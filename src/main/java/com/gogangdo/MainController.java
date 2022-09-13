package com.gogangdo;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gogangdo.dto.MemberDTO;
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
	@RequestMapping("/getInfo.do")
	public String getInfo() {
		return "getinfo";
	}
	@RequestMapping("/userUpdate.do")
	public String userUpdate(MemberDTO dto) {
		System.out.println(dto.toString());
		int result = memberService.userUpdate(dto);
		if(result == 1)
		System.out.println("회원정보 수정 완료");
		else 
		System.out.println("실패");
		
		return "redirect:/";
	}
	@RequestMapping("/loginView2.do")
	public String loginView(String id,String pw, HttpSession session) {
		MemberDTO dto = memberService.login(id, pw);
 		
		if(dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("id", dto.getId());
			session.setAttribute("pw", dto.getPw());
			return "redirect:/";
		}else {
			session.setAttribute("login", false);
			return "login";
		}		
	}
	@RequestMapping("/loginoutView.do")
	public String loginoutView(HttpSession session) {
			session.invalidate();
		return "redirect:/";		
	}
	@RequestMapping("/loginView1.do")
	public String loginView1() {
		return "findid";
	}
	@RequestMapping("/registerView.do")
	public String registerView() {
		return "register";
	}
	@RequestMapping("/registerView2.do")
	public String insertregisterView2() {
		return "register2";
	}
	@RequestMapping("/registerView3.do")
	public String insertgisterView3(MemberDTO dto) {
		System.out.println(dto);
		memberService.insertmember(dto);
		return "register3";
	}
	@RequestMapping("/productList.do")
	public String productList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model, int a) {
		List<ProductDTO> list = productService.selectProductList(pageNo,a);
		model.addAttribute("list", list);
		
		int count = productService.selectProductCount();
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
		model.addAttribute("pagging", vo);
		model.addAttribute("count",count);
		return "product_list";
	}
	@RequestMapping("/userDelete.do")
	public String userDelete(String id, HttpSession session) {
		System.out.println(id);
		int result = memberService.userDelete(id);
		if(result == 1)
			System.out.println("회원정보 삭제 완료");
			else 
			System.out.println("실패");
		session.invalidate();
		return "redirect:/main.do";
	}
	@RequestMapping("/imageLoad.do")
	public void imageLoad(int fno, HttpServletResponse response) throws IOException {
		String path = productService.selectImageFile(fno).getImg_path();
		File file = new File(path);
		
		response.setHeader("Content-Disposition", "attachement;fileName="+file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int)file.length());
		
		FileInputStream fis = new FileInputStream(file);
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buffer = new byte[1024*1024];
		
		while(true) {
			int size = fis.read(buffer);
			if(size == - 1) break;
			bos.write(buffer,0,size);
			bos.flush();
		}
		fis.close();
		bos.close();
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
	public String cartView(Model model) {
		//List<ProductDTO> list = productService.selectProductBuy();
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
