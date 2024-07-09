package com.inventory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.UserVo;
import com.inventory.services.UserService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/admins")
@Controller
public class AdminController {
	@Autowired
	private UserService userService;

    @RequestMapping({"/home", "/", ""}) 
    public String adminHome(HttpSession session,  RedirectAttributes redirectAttributes, Model model) {
    	UserVo authUser = (UserVo) session.getAttribute("authUser");
    	//	authUser = null 일때 오류 나니까 수정 필요
    	if (!("2").equals(authUser.getAuthCode())) {
			//	홈화면으로 보내
			redirectAttributes.addFlashAttribute("errorMsg", "로그인을 해얗자 ");
			return "redirect:/";
		}
    	
    	//	계정 승인 요청 
    	long taikiUser = userService.userCount();
    	System.out.println(taikiUser);
    	model.addAttribute("count", taikiUser);
    	
        return "admins/admin_home";
    }
}
