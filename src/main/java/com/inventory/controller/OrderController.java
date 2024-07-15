package com.inventory.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.repositories.vo.BookInventoryVo;
import com.inventory.repositories.vo.BookVo;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.BookInventoryService;
import com.inventory.services.BookService;
import com.inventory.services.OrderService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/branch/order")
@Controller
public class OrderController {
	@Autowired
	BookService bookService;
	@Autowired
	OrderService orderService;
	@Autowired
	BookInventoryService bookInventoryService;

	@RequestMapping("/form")
	public String orderList(HttpSession session, Model model) {
//		로그인 시 저장한 session authUser를 받아와 branchId 기반으로
//		지점 branch_inventory 테이블 데이터 연결
//		데이터를 받아와 지점 교재 재고 현황을 모델에 저장

		UserVo vo = (UserVo) session.getAttribute("authUser");

		List<BookInventoryVo> list = bookInventoryService.getList(vo.getBranchId());
		model.addAttribute("list", list);

//		session에 저장된 장바구니 리스트를 받아오고 모델에 추가해 jsp에 전달
		Object cartObject = session.getAttribute("cart");
		List<OrderVo> cartList = (List<OrderVo>) cartObject;

		model.addAttribute("cartList", cartList);
		System.err.println(cartList);
		return "branches/branch_order_form";
	}

	@PostMapping("/add")
	public String addToCart(@RequestParam("bookCode") String bookCode, @RequestParam("quantity") int quantity,
			HttpSession session) {
//		로그인 시 저장한 session authUser를 받아오는 기능
		UserVo authUser = (UserVo) session.getAttribute("authUser");

//		session에 저장된 장바구니 리스트를 받아오는 기능
		List<OrderVo> cart = (List<OrderVo>) session.getAttribute("cart");

//		jsp에서 넘어온 bookCode 기반으로 객체 저장
		BookVo book = bookService.getData(bookCode);

//		객체에서 bookName을 뽑아와 bookName에 저장 후 주문 객체에 추가,
//		수량과 교재 코드도 저장
		String bookName = book.getBookName();
		int price = book.getPrice();
		OrderVo vo = new OrderVo(bookCode, bookName, quantity);
		vo.setPrice(price);
		vo.setBranchId(authUser.getBranchId());

//		장바구니가 비었으면 리스트만 생성 후 jsp전달
//		그 후 장바구니에 주문 객체 추가 후 리다이렉트 
		if (cart == null) {
			cart = new ArrayList<>();
		}

		cart.add(vo);
		session.setAttribute("cart", cart);
		return "redirect:/branch/order/form";
	}

	@PostMapping("/remove")
	public String removeFromCart(@RequestParam("bookCode") String bookCode, HttpSession session) {

//	 	세션에서 장바구니 가져오기
		List<OrderVo> cart = (List<OrderVo>) session.getAttribute("cart");

//		장바구니가 비어있지 않으면 장바구니를 순회하여 원하는 장바구니 제품을 삭제
		if (cart != null) {

			Iterator<OrderVo> iterator = cart.iterator();
			while (iterator.hasNext()) {

				OrderVo vo = iterator.next();

				if (vo.getBookCode().equals(bookCode)) {
					iterator.remove();
					break;
				}
			}

			// 수정된 장바구니 세션에 저장
			session.setAttribute("cart", cart);
		}

		return "redirect:/branch/order/form"; // 장바구니 목록 페이지로 리다이렉트
	}

	@RequestMapping("/list")
	public String orderHistory(Model model, HttpSession session) {
//		로그인 시 저장한 session authUser를 받아오는 기능
		UserVo vo = (UserVo) session.getAttribute("authUser");


//		branchId 기반으로 주문 기록 뽑아와 리스트에 저장 후 모델에 실어서
//		jsp에 전달
		List<OrderVo> list = orderService.getOrderList(vo.getBranchId());
		model.addAttribute("list", list);
		return "branches/branch_order_list";
	}

	@RequestMapping("/submit")
	public String ordering(HttpSession session) {
//		장바구니 세션 받아와 리스트에 저장, authUser 세션 받아와 객체에 저장
		List<OrderVo> cart = (List<OrderVo>) session.getAttribute("cart");
		UserVo vo = (UserVo) session.getAttribute("authUser");


//		장바구니가 있으면 book_order테이블에
//		지점 아이디 기반으로 데이터 생성
		if (cart != null && !cart.isEmpty()) {
			orderService.insert(vo.getBranchId());

//			장바구니 리스트를 순회하며 방금 생성된 주문 번호 기반으로 
//			order_detail에 저장
			for (OrderVo item : cart) {
				item.setOrderId(orderService.getMax());
				orderService.insertDetail(item);
			}

//			장바구니 리스트 삭제
			session.removeAttribute("cart");

//			장바구니가 비어있으면 장바구니 삭제 후 리다이렉트
		} else {
			System.err.println("장바구니가 비어 있습니다.");
			session.removeAttribute("cart");

			return "redirect:/branch/order/form";
		}

		return "redirect:/branch/order/list";

	}

	@RequestMapping("/search")
	public String searchBooks(@RequestParam("bookName") String bookName, HttpSession session, Model model) {
//		session에서 authUser 받아와 branchId와 jsp에서 넘어온 교재 이름으로
//		branch_inventory에서 데이터를 받아 리스트에 저장후 모델에 저장 
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		List<BookInventoryVo> list = bookInventoryService.search(authUser.getBranchId(), bookName);
		model.addAttribute("list", list);

//		장바구니 세션 받아와 리스트에 저장후 모델에 저장
		Object cartObject = session.getAttribute("cart");

		List<OrderVo> cartList = (List<OrderVo>) cartObject;

		model.addAttribute("cartList", cartList);

		return "branches/branch_order_form"; // 정상적인 경우 이렇게 반환할 것입니다.
	}
	
	@RequestMapping("/detail")
	public String orderDetail(@RequestParam("orderId") String orderId, Model model) {

//		받아온 orderId 기반으로 주문 상세 페이지로 연결
		List<OrderVo> list = orderService.getDetailList(orderId);
		List<BookVo> bookList = new ArrayList<>();
		for (OrderVo vo : list) {
			BookVo bookVo = bookService.getData(vo.getBookCode());
			vo.setBookName(bookVo.getBookName());
			vo.setPrice(bookVo.getPrice());

		}
		model.addAttribute("list", list);
		model.addAttribute("orderId", orderId);
		return "branches/branch_order_detail";
	}

}
