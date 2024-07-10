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
    	//	로그인 정보 판단
    	if (!("2").equals(authUser.getAuthCode())) {
			//	로그인 안 한 경우 홈으로 리다이렉트
			redirectAttributes.addFlashAttribute("errorMsg", "auth code 불일치 ");
			return "redirect:/";
		}
    	
    	List<UserVo> list = userService.getList();	//	계정 리스트
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
