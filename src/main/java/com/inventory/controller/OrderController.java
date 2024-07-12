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

@Controller
public class OrderController {
	@Autowired
	BookService bookService;
	@Autowired
	OrderService orderService;
	@Autowired
	BookInventoryService bookInventoryService;

	@RequestMapping("orderlist")
	public String orderList(HttpSession session, Model model) {
		UserVo vo = (UserVo)session.getAttribute("authUser");
		List<BookInventoryVo> list = bookInventoryService.getList(vo.getBranchId());
		model.addAttribute("list", list);
//		System.out.println("orderlist" + session.getAttribute("cart"));
		// 세션에서 cart 객체 가져오기
		Object cartObject = session.getAttribute("cart");

		// cart 객체가 List<OrderBasketVo> 형태로 저장된다고 가정
		List<OrderVo> cartList = (List<OrderVo>) cartObject;

		model.addAttribute("cartList", cartList);
		System.err.println(cartList);
		return "branches/branch_order_list";
	}

	@PostMapping("/add-to-cart")
	public String addToCart(@RequestParam("bookCode") String bookCode, @RequestParam("quantity") int quantity,
			HttpSession session) {
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		// 예시 교재 목록 (실제 구현에서는 데이터베이스에서 가져와야 함)
		List<OrderVo> cart = (List<OrderVo>) session.getAttribute("cart");
		BookVo book = bookService.getData(bookCode);

		String bookName = book.getBookName();
		OrderVo vo = new OrderVo(bookCode, bookName, quantity);
		vo.setBranchId(authUser.getBranchId());
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
		List<OrderVo> cart = (List<OrderVo>) session.getAttribute("cart");

		if (cart != null) {
			// 장바구니에서 해당 상품 코드에 해당하는 항목 삭제
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

		return "redirect:/orderlist"; // 장바구니 목록 페이지로 리다이렉트
	}

	@RequestMapping("orderhistory")
	public String orderHistory(Model model, HttpSession session) {
		UserVo vo = (UserVo)session.getAttribute("authUser");
		System.out.println("orderhistory" + vo.getBranchId());
		List<OrderVo> list = orderService.getOrderList(vo.getBranchId());
		model.addAttribute("list", list);
		return "branches/branch_order_detail";
	}

	@RequestMapping("/ordering")
	public String ordering(HttpSession session) {
		List<OrderVo> cart = (List<OrderVo>) session.getAttribute("cart");
		UserVo vo = (UserVo)session.getAttribute("authUser");
		
		if (cart != null && !cart.isEmpty()) {
			orderService.insert(vo.getBranchId());
			for (OrderVo item : cart) {
				item.setOrderId(orderService.getMax());
				System.err.println(item); // 예시: 각 아이템 출력
				orderService.insertDetail(item);
			}
		} else {
			System.err.println("장바구니가 비어 있습니다.");
			session.removeAttribute("cart");

			return "redirect:/orderlist";
		}
		// session에서 "cart" 속성을 삭제합니다.
		session.removeAttribute("cart");

		return "redirect:/orderhistory";

	}

	@RequestMapping("/searchbooks")
	public String searchBooks(@RequestParam("bookName") String bookName, HttpSession session, Model model) {
		System.out.println("con" + bookName);
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		List<BookInventoryVo> list = bookInventoryService.search(authUser.getBranchId(), bookName);
		model.addAttribute("list", list);
		Object cartObject = session.getAttribute("cart");

		// cart 객체가 List<OrderBasketVo> 형태로 저장된다고 가정
		List<OrderVo> cartList = (List<OrderVo>) cartObject;

		model.addAttribute("cartList", cartList);

		return "branches/branch_order_list"; // 정상적인 경우 이렇게 반환할 것입니다.
	}
	
	@RequestMapping("/orderdetail")
	public String orderDetail(@RequestParam("orderId") String orderId, Model model) {

		List<OrderVo> list = orderService.getDetailList(orderId);
		List<BookVo> bookList = new ArrayList<>();
		for (OrderVo vo : list) {
			BookVo bookVo = bookService.getData(vo.getBookCode());
			vo.setBookName(bookVo.getBookName());
			vo.setPrice(bookVo.getPrice());


		}
		model.addAttribute("list", list);
		model.addAttribute("orderId", orderId);
		return "branches/branch_order_real_detail";
	}
	

}
