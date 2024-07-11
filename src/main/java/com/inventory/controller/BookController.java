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
	
	@RequestMapping("/booklist")
	public String booklist(Model model) {
		List<BookVo> list = bookService.getbookList();
		model.addAttribute("list", list);
		System.out.println("controller" + list);
		return "admins/book_update";
	}

	@RequestMapping("/deletebook/{bookCode}")
	public String delete(@PathVariable("bookCode") String bookCode) {
		System.out.println("delete controller" + bookCode);
		boolean success = bookService.deletebook(bookCode);
		return "redirect:/admin/booklist";
	}
	
	@RequestMapping("/insert")
	public String insertBook(@ModelAttribute BookVo vo) {
		boolean success = bookService.writebook(vo);
        return "redirect:/admin/booklist";
    }
	
	@GetMapping("/searchbooks")
    public String searchBooks(@RequestParam("bookName") String bookName, Model model) {
        System.out.println("con" + bookName);
        List<BookVo> list = bookService.search(bookName);
        model.addAttribute("list", list);
        return "admins/book_update"; // 정상적인 경우 이렇게 반환할 것입니다.
    }
	
	@GetMapping("/updatebooks/{bookCode}")
	public String updateBooks(@PathVariable("bookCode") String bookCode, Model model) {
		BookVo vo = bookService.getData(bookCode);
		model.addAttribute("vo", vo);
		return "admins/book_modify";
	}
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute BookVo vo) {
		boolean success = bookService.updatebook(vo);
		return "redirect:/admin/booklist";
	}
}
