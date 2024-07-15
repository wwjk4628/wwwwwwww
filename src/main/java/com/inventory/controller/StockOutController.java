package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.repositories.vo.BookInventoryVo;
import com.inventory.repositories.vo.StockVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.BookInventoryService;
import com.inventory.services.StockService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/branch/stockout")
public class StockOutController {

	@Autowired
	StockService stockService;
	@Autowired
	BookInventoryService bookInvenService;
    
    @RequestMapping("/list")
	public String stockInList(Model model, HttpSession session) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		List <StockVo> list = stockService.getStockOutList(vo.getBranchId());
		model.addAttribute("list", list);
		return "branches/branch_stock_out_list";
	}
    
    @RequestMapping("/form")
    public String moveToStockOutFrom(HttpSession session) {
    	UserVo vo = (UserVo)session.getAttribute("authUser");
		List<BookInventoryVo> list = bookInvenService.checkedGetList(vo.getBranchId());
		session.setAttribute("authUser", vo);
		session.setAttribute("list", list);
		return "branches/branch_stock_out_form";
    }
}
