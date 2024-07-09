package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.repositories.vo.BookVo;
import com.inventory.repositories.vo.OrderBasketVo;
import com.inventory.services.BookService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	@Autowired
	BookService bookService;

	@RequestMapping("orderlist")
	public String orderList(HttpSession session, Model model) {
		List<BookVo> list = bookService.getbookList();
		model.addAttribute("list", list);

		System.out.println();

		return "branches/branch_order_list";
	}

	@PostMapping("/add-to-cart")
	public String addToCart(@RequestParam("bookCode") String bookCode, @RequestParam("quantity") int quantity,
			HttpSession session) {
		// 예시 교재 목록 (실제 구현에서는 데이터베이스에서 가져와야 함)
		System.out.println("===========" + bookCode + quantity);
		OrderBasketVo vo = new OrderBasketVo(bookCode, quantity);
		session.setAttribute("cart", vo);
		return "redirect:/orderlist";
	}

//	(@RequestParam("bookName") String bookName,
//            @RequestParam("quantity") int quantity,
//            HttpSession session) {
//
//// 장바구니 아이템 객체 생성
//CartItem item = new CartItem(bookName, quantity);
//
//// 세션에서 장바구니 목록 가져오기
//List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
//if (cart == null) {
//cart = new ArrayList<>();
//}
//
//// 장바구니에 아이템 추가
//cart.add(item);
//
//// 세션에 장바구니 목록 저장
//session.setAttribute("cart", cart);

	@RequestMapping("orderhistory")
	public String orderHistory() {
		return "branches/branch_order_detail";
	}

	@RequestMapping("ordering")
	public String ordering() {

		return "redirect:/orderhistory";
	}

}
