package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.repositories.vo.BookVo;
import com.inventory.services.BookService;

@RequestMapping("/admin")
@Controller
public class BookController {

	@Autowired
	BookService bookService;

//	본사 교재 리스트 관리 페이지
	@RequestMapping("/booklist")
	public String booklist(Model model) {
//		book_list 테이블에서 전체 데이터를 뽑아와 list에 저장
		List<BookVo> list = bookService.getbookList();
//		모델에 책 목록을 추가하여 JSP에 전달
		model.addAttribute("list", list);
		return "admins/book_update";
	}

//	본사 교재 리스트에서 교재 삭제 기능
	@RequestMapping("/deletebook/{bookCode}")
	public String delete(@PathVariable("bookCode") String bookCode) {
//		book_list 테이블에서 부분 데이터 삭제 기능
		boolean success = bookService.deletebook(bookCode);
		return "redirect:/admin/booklist";
	}

//	본사 교재 리스트에서 교재 추가 기능
	@RequestMapping("/insert")
	public String insertBook(@ModelAttribute BookVo vo) {
//		book_list 테이블에서 부분 데이터 추가 기능
		boolean success = bookService.writebook(vo);
		return "redirect:/admin/booklist";
	}

//	본사 교재 리스트에서 교재 검색 기능
	@GetMapping("/searchbooks")
	public String searchBooks(@RequestParam("bookName") String bookName, Model model) {
//		book_list 테이블의 데이터 검색 기능
		List<BookVo> list = bookService.search(bookName);
		model.addAttribute("list", list);
		return "admins/book_update";
	}

//	본사 교재 리스트에서 수정 하고싶은 데이터를 수정 페이지로 넘겨줌
	@GetMapping("/updatebooks/{bookCode}")
	public String updateBooks(@PathVariable("bookCode") String bookCode, Model model) {
//		bookCode 기반으로 book_list 테이블의 데이터를 받아와 모델에 저장
		BookVo vo = bookService.getData(bookCode);
		model.addAttribute("vo", vo);
		return "admins/book_modify";
	}

//	본사 교재 리스트중 교재 정보 수정
	@PostMapping("/modify")
	public String modify(@ModelAttribute BookVo vo) {
//		model을 받아와 book_list테이블의 부분 데이터를 수정
		boolean success = bookService.updatebook(vo);
		return "redirect:/admin/booklist";
	}
}
