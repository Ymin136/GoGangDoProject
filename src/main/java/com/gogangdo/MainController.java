package com.gogangdo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gogangdo.service.MemberService;
import com.gogangdo.service.OrderService;
import com.gogangdo.service.ProductService;

@Controller
public class MainController {
	private ProductService productService;
	private MemberService memberService;
	private OrderService orderService;
	
	public MainController(ProductService productService, MemberService memberService, OrderService orderservice) {
		this.productService = productService;
		this.memberService = memberService;
		this.orderService = orderservice;
	}

	@RequestMapping("/")
	public String startPage() {
		return "main";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "redirect:/";
	}
	@RequestMapping("/loginView.do")
	public String loginView() {
		return "login";
	}
	@RequestMapping("/registerView.do")
	public String registerView() {
		return "register";
	}
	
	@RequestMapping("/productList.do")
	public String productList() {
		return "product_list";
	}
	
}
