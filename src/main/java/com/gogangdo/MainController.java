package com.gogangdo;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.gogangdo.dto.CartDTO;
import com.gogangdo.dto.ReviewDTO;
import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.MemberDTO;
import com.gogangdo.dto.ProductDTO;
import com.gogangdo.service.CartService;
import com.gogangdo.service.MemberService;
import com.gogangdo.service.OrderService;
import com.gogangdo.service.ProductService;
import com.gogangdo.vo.PaggingVO;

@Controller
public class MainController {
	private ProductService productService;
	private MemberService memberService;
	private OrderService orderService;
	private CartService cartService;
	
	
	public MainController(OrderService orderService, ProductService productService, MemberService memberService, CartService cartService) {
		this.productService = productService;
		this.memberService = memberService;
		
		this.orderService = orderService;
		this.cartService = cartService;
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
	public String loginView2(String id,String pw, HttpSession session) {
		MemberDTO dto = memberService.login(id, pw);
		if(dto != null) {
			session.setAttribute("login", true);
			
			session.setAttribute("id", dto.getId());
			session.setAttribute("pw", dto.getPw());
			session.setAttribute("user_no", dto.getUser_grade());
			session.setAttribute("user_name", dto.getUser_name());
			session.setAttribute("tel", dto.getTel());
			session.setAttribute("address", dto.getAddress());
			session.setAttribute("email", dto.getEmail());
			return "redirect:/";
		}else {
			session.setAttribute("login", false);
			return "redirect:/loginView.do";
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
	public String insertgisterView3(MemberDTO dto, HttpSession session) {
		System.out.println(dto);
		int registerView3=memberService.insertmember(dto);
		if(registerView3 != 0) {
			System.out.println("회원가입 성공");
			return "redirect:/";
		}else {
			System.out.println("회원가입 실패");
			return "redirect:/";
		}		
	}
	@RequestMapping("/idCheck.do")
	public void idCheck(String id, HttpServletResponse response) throws IOException {
		String id_cmp = memberService.selectId(id);
		System.out.println(id_cmp);
		if(id.equals(id_cmp)) {
			response.getWriter().write(String.valueOf(0));
		} else {
			response.getWriter().write(String.valueOf(1));
		}
	}
	@RequestMapping("/productList.do")
	public String productList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model, int category_no) {
		List<ProductDTO> list = productService.selectProductList(pageNo, category_no);
		model.addAttribute("list", list);
		
		int count = productService.selectProductCount();
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
		model.addAttribute("pagging", vo);
		model.addAttribute("count",count);
		return "product_list";
	}
	@RequestMapping("/productSubList.do")
	public String productSubList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model, int sub_category_no) {
		List<ProductDTO> sub_list = productService.selectProductSubList(pageNo, sub_category_no);
		model.addAttribute("list", sub_list);
		
		int count = productService.selectProductCount();
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
		model.addAttribute("pagging", vo);
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
//	@RequestMapping("/productSortList.do")
//	public String productSortList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, int product_price, int sort, Model model) {
//		List<ProductDTO> sort_list = productService.selectProductSortList(pageNo, product_price, sort);
//		model.addAttribute("list", sort_list);
//		return "product_list";
//	}
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
	public String productDetail(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,int product_no, Model model) {
		try {
		
		List<ReviewDTO> list = productService.selectReviewList(pageNo,product_no);
		ProductDTO dto = productService.selectproductDTO(product_no);
		int count = productService.selectReviewCount(product_no);
		
		PaggingVO vo = new PaggingVO(count, pageNo, 5, 10);
		
		model.addAttribute("product", dto);
		model.addAttribute("list", list);
		model.addAttribute("pagging", vo);
		System.out.println(list);
		FileDTO thumbnail = productService.selectThumbnailDTO(product_no);
		FileDTO image = productService.selectimageDTO(product_no);

		model.addAttribute("thumbnail", thumbnail);			
		model.addAttribute("image", image);
		
		}catch (Exception e) {
			
		}
		return "product_detail";
	}
	@RequestMapping("/ReviewList.do")
	public ResponseEntity<List<ReviewDTO>> 
							ReviewList(int pageNo, int product_no){
		System.out.println("pageNo : "+pageNo);
		System.out.println("product_no : "+product_no);
		
		
		List<ReviewDTO> list = productService.selectReviewList(pageNo,product_no);
		System.out.println(list.get(0));
		
		return ResponseEntity.ok(list);
	}
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "mypage";
	}
	@RequestMapping("/cartView.do")
	public String cartView(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<CartDTO> list = cartService.selectCartView(id);
		model.addAttribute("cart", list);
		
		int all_price = 0;
		int total_price = 0;
		for(int i=0; i<list.size();i++) {
			CartDTO dto = list.get(i);
			total_price = dto.getProduct_price() * dto.getOrder_ea();
			all_price = all_price + total_price;
		}
		//int total_price = cartService.selectTotalPrice();
		model.addAttribute("total_price", total_price);
		model.addAttribute("all_price", all_price);
		int deliv = 3000;
		model.addAttribute("cart_price", all_price + deliv);
		
		int count = cartService.selectCartCount();
		model.addAttribute("cart_count", count);
		return "cart";
	}
	@RequestMapping("/cartDelete.do")
	public String cartDelete(int product_no, String id) {
		cartService.cartDelete(product_no);
		return "redirect:/cartView.do?id="+id;
	}
	@RequestMapping("/purchase.do")
	public String purchase() {
		//ProductDTO dto = int product_no, int ea
		return "purchase";
	}
	@RequestMapping("/productRegisterView.do")
	public String productRegisterView() {
		return "product_register";
	}
	
	@RequestMapping("/productRegister.do")
	public void productRegister(ProductDTO dto, HttpServletResponse response, MultipartHttpServletRequest request) throws IOException {
		try {
		int pno = productService.selectProductNo();
		dto.setProduct_no(pno);
		System.out.println(dto.toString());
		dto.setProduct_desc(dto.getProduct_desc().replaceAll("\\n", "<br>"));
		productService.registerProduct(dto);
		
		
		String root ="c:\\fileUpload\\";
		File userRoot = new File(root);
		if(userRoot.exists())
			userRoot.mkdirs();
		
		MultipartFile thumbnail = request.getFile("product_thumbnail");
		MultipartFile product_img = request.getFile("product_img");
		
		String originalFileName1 = thumbnail.getOriginalFilename();
		String originalFileName2 = product_img.getOriginalFilename();
		File uploadFile1 = new File(root + "\\"+originalFileName1);
		File uploadFile2 = new File(root + "\\"+originalFileName2);
		int img_no = productService.selectImageNo();
		productService.insertthumbnail(new FileDTO(uploadFile1, pno, img_no));
		img_no = productService.selectImageNo();
		productService.insertproduct_img(new FileDTO(uploadFile2, pno, img_no));		
		try {
			thumbnail.transferTo(uploadFile1);
			product_img.transferTo(uploadFile2);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('상품 등록 성공');location.href='productList.do';</script>");
		} catch (IOException e) {			
			response.getWriter().write("<script>alert('데이터입력이 잘못됐습니다.');history.bakc();</script>");
		}
	}
	
}
