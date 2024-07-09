package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.repositories.vo.BookVo;
import com.inventory.services.BookService;

@Controller
public class OrderController {
	@Autowired
	BookService bookService;
	
	@RequestMapping("orderlist")
	public String orderList(Model model) {
		List<BookVo> list = bookService.getbookList();
		model.addAttribute("list", list);
		return "branches/branch_order_list";
	}
	
	
	@RequestMapping("orderhistory")
	public String orderHistory() {
		return "branches/branch_order_detail";
	}
	
}
