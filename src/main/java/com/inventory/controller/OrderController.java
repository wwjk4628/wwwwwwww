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

import com.inventory.repositories.vo.BookVo;
import com.inventory.repositories.vo.OrderBasketVo;
import com.inventory.services.BookService;
import com.inventory.services.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	@Autowired
	BookService bookService;
	@Autowired
	OrderService orderService;

	@RequestMapping("orderlist")
	public String orderList(HttpSession session, Model model) {
		List<BookVo> list = bookService.getbookList();
		model.addAttribute("list", list);
//		System.out.println("orderlist" + session.getAttribute("cart"));
		// 세션에서 cart 객체 가져오기
		Object cartObject = session.getAttribute("cart");

		// cart 객체가 List<OrderBasketVo> 형태로 저장된다고 가정
		List<OrderBasketVo> cartList = (List<OrderBasketVo>) cartObject;

		model.addAttribute("cartList", cartList);
		System.err.println(cartList);
		return "branches/branch_order_list";
	}

	@PostMapping("/add-to-cart")
	public String addToCart(@RequestParam("bookCode") String bookCode, @RequestParam("quantity") int quantity,
			HttpSession session) {
		// 예시 교재 목록 (실제 구현에서는 데이터베이스에서 가져와야 함)
		List<OrderBasketVo> cart = (List<OrderBasketVo>) session.getAttribute("cart");
		BookVo book = bookService.getData(bookCode);
		String book_name = book.getBook_name();
		OrderBasketVo vo = new OrderBasketVo(bookCode, book_name, quantity);
		if (cart == null) {
			cart = new ArrayList<>();
		}

		cart.add(vo);
		session.setAttribute("cart", cart);
		return "redirect:/orderlist";
	}

	@PostMapping("/remove-from-cart")
	public String removeFromCart(@RequestParam("bookCode") String bookCode, HttpSession session) {
		// 세션에서 장바구니 가져오기
		List<OrderBasketVo> cart = (List<OrderBasketVo>) session.getAttribute("cart");

		if (cart != null) {
			// 장바구니에서 해당 상품 코드에 해당하는 항목 삭제
			Iterator<OrderBasketVo> iterator = cart.iterator();
			while (iterator.hasNext()) {
				OrderBasketVo vo = iterator.next();
				if (vo.getBook_code().equals(bookCode)) {
					iterator.remove();
					break;
				}
			}

			// 수정된 장바구니 세션에 저장
			session.setAttribute("cart", cart);
		}

		return "redirect:/orderlist"; // 장바구니 목록 페이지로 리다이렉트
	}

	@RequestMapping("orderhistory")
	public String orderHistory() {
		return "branches/branch_order_detail";
	}

	@RequestMapping("/ordering")
	public String ordering(HttpSession session) {
		List<OrderBasketVo> cart = (List<OrderBasketVo>) session.getAttribute("cart");
		System.out.println("ordering====" + cart);
		orderService.insert("1");
		System.err.println("================" + orderService.getMax());
		if (cart != null && !cart.isEmpty()) {
		    for (OrderBasketVo item : cart) {
		    	item.setOrder_id(orderService.getMax());
		        System.err.println(item); // 예시: 각 아이템 출력
		        orderService.insertDetail(item);
		    }
		} else {
		    System.err.println("장바구니가 비어 있습니다.");
		}
		// session에서 "cart" 속성을 삭제합니다.
		session.removeAttribute("cart");

		return "redirect:/orderhistory";

	}

}
