package com.inventory.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.repositories.vo.BookInventoryVo;
import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.BookInventoryService;
import com.inventory.services.BookService;
import com.inventory.services.OrderCheckService;
import com.inventory.services.StockService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/branch/initial")
@Controller
public class InitialSettingController {
	@Autowired
	BookInventoryService bookInventoryService;
	@Autowired
	BookService bookService;
	@Autowired
	StockService stockService;
	@Autowired
	OrderCheckService orderCheckService;
	
	@RequestMapping("/setting")
	public String moveToInitialSettingPage(HttpSession session) {
		
		//	교재 선택 리스트 출력
		UserVo vo = (UserVo)session.getAttribute("authUser");
		List<BookInventoryVo> list = bookInventoryService.getList(vo.getBranchId());
		session.setAttribute("authUser", vo);
		session.setAttribute("list", list);
		
		//	카트 리스트 표시
		List<OrderVo> cartList = (List<OrderVo>) session.getAttribute("cart");
		session.setAttribute("cartList", cartList);
		
		return "branches/initial_setting/initial_setting_form";
	}
	
	@RequestMapping("/add")
	public String addSettingList(@RequestParam("bookCode") String bookCode, @RequestParam("quantity") int quantity, HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		List <StockVo> list = (List<StockVo>) session.getAttribute("cart");
		if (list == null || list.isEmpty()) {
			list = new ArrayList<StockVo>();
		}
		
		//	카트 목록 삽입
		StockVo vo = new StockVo (authUser.getBranchId(), bookCode, quantity, (bookService.getData(bookCode)).getBookName());
		list.add(vo);
		session.setAttribute("cart", list);
		
		return "redirect:/branch/initial/setting";
	}
	
	@RequestMapping("/delete")
	public String delSettingList(@RequestParam("bookCode") String bookCode, HttpSession session) {
		List <StockVo> list = (List<StockVo>) session.getAttribute("cart");
		if(list != null && !list.isEmpty()) {
			Iterator<StockVo>iterator = list.iterator();
			while (iterator.hasNext()) {
				StockVo vo = iterator.next();
				if(vo.getBookCode().equals(bookCode)) {
					iterator.remove();
					break;
				}
			}
			session.setAttribute("cart", list);
		}
		return "redirect:/branch/initial/setting";
	}
	
	@RequestMapping("/confirm")
	public String confirmSettingList(HttpSession session) {
		List<StockVo> list = (List<StockVo>) session.getAttribute("cart");
		UserVo userVo = (UserVo)session.getAttribute("authUser");
		
		//	Stock_in 반영 로직
		orderCheckService.confirmAndInsertStockIn("-1", userVo.getBranchId());
		
		//	Stock_in의 in_id 받아오기
		int inId = stockService.getInId(userVo.getBranchId());
		
		//	재고에 반영하는 로직
		if(list != null && !list.isEmpty()) {
			for (StockVo inInvenStockVo : list) {
				stockService.confirnStockIn(inInvenStockVo);
				
//				in_detail 정보 넣기
				inInvenStockVo.setId(inId);
				orderCheckService.confirmAndInsertInDetail(inInvenStockVo);
			}
		}
		session.setAttribute("authUser", userVo);
		
		return "redirect:/branch/inventory";
	}
}
