package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.BookInventoryVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.BookInventoryService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/branches")
@Controller
public class BranchController {
	
	@Autowired
	private BookInventoryService bookInvenService;
	
	@RequestMapping({"/home", "", "/"})
	public String branchHome(HttpSession session, RedirectAttributes redirectAttributes) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if (!("1").equals(authUser.getAuthCode())) {
			//	홈화면으로 보내
			redirectAttributes.addFlashAttribute("errorMsg", "로그인을 해얗자 ");
			return "redirect:/";
		}
		session.setAttribute("authUser", authUser);
		
		List<BookInventoryVo> list = bookInvenService.getList(authUser.getBranchId());
		session.setAttribute("list", list);
		
		return "branches/branch_home";
	}
}
