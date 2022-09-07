package com.gogangdo;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gogangdo.dto.ProductDTO;
import com.gogangdo.service.MemberService;
import com.gogangdo.service.OrderService;
import com.gogangdo.service.ProductService;
import com.gogangdo.vo.PaggingVO;

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
	public String startPage(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model) {
		List<ProductDTO> list = productService.selectProductList(pageNo);
		model.addAttribute("list", list);
		
		int count = productService.selectProductCount();
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
		model.addAttribute("pagging", vo);
		
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
	
}
