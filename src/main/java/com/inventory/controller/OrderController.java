package com.inventory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/order")
@Controller
public class OrderController {

	@RequestMapping({"/list", "", "/"})
	public String orderList(HttpSession session, RedirectAttributes redirectAttributes) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		session.setAttribute("authUser", authUser);
		return "branches/branch_order_list";
	}
	
}
