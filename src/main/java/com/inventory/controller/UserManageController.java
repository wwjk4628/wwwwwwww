package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.UserVo;
import com.inventory.services.UserService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/usermanage")
@Controller
public class UserManageController {
	@Autowired
	private UserService userService;

	@RequestMapping({"/list", "/", ""}) 
    public String userList(HttpSession session,  RedirectAttributes redirectAttributes, Model model) {
    	UserVo authUser = (UserVo) session.getAttribute("authUser");
    	if (authUser == null) {
			//	홈화면으로 보내
			redirectAttributes.addFlashAttribute("errorMsg", "로그인을 해얗자 ");
			return "redirect:/";
		}
    	List<UserVo> list = userService.getList();
		model.addAttribute("list", list);
        return "admins/user_list";
    }
	
	@RequestMapping("/{no}/delete")
	public String delete (@PathVariable ("no") Long no, HttpSession	session) {
		userService.delete(no);
		return "redirect:/usermanage/list";
	}
	
	@RequestMapping("/{no}/confirm")
	public String confirm (@PathVariable ("no") int no) {
		userService.confirm(no);
		return "redirect:/usermanage/list";
	}
	
}
