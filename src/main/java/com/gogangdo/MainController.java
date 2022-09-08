package com.gogangdo;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gogangdo.dto.ProductDTO;
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
	
	@RequestMapping("/productDetail.do")
	public String productDetail() {
		return "product_detail";
	}
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "mypage";
	}
	@RequestMapping("/cartView.do")
	public String cartView() {
		return "cart";
	}
	@RequestMapping("/purchase.do")
	public String purchase() {
		return "purchase";
	}
	@RequestMapping("/productRegisterView.do")
	public String productRegisterView() {
		return "product_register";
	}
	
	@RequestMapping("/productRegister.do")
	public void productRegister(ProductDTO dto, HttpServletResponse response) {		
		int pno = productService.selectProductNo();
		dto.setProduct_no(pno);
		System.out.println(dto.toString());
		productService.registerProduct(dto);
		
		try {
			response.getWriter().write("1");
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
}
