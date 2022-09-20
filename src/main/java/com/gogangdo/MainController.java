package com.gogangdo;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gogangdo.dto.CartDTO;
import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.MemberDTO;
import com.gogangdo.dto.OrderDTO;
import com.gogangdo.dto.ProductDTO;
import com.gogangdo.dto.QnADTO;
import com.gogangdo.dto.ReviewDTO;
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
		System.out.println(dto.toString());
		if(dto != null) {
			session.setAttribute("login", true);
			
			session.setAttribute("id", dto.getId());
			session.setAttribute("pw", dto.getPw());
			session.setAttribute("user_grade", dto.getUser_grade());
			session.setAttribute("user_name", dto.getUser_name());
			session.setAttribute("tel", dto.getTel());
			session.setAttribute("address1", dto.getAddress1());
			session.setAttribute("address2", dto.getAddress2());
			session.setAttribute("post", dto.getPost());
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
	@RequestMapping("/productSearchList.do")
	public String productSearchList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model, String search) {
		List<ProductDTO> list = productService.productSearchList(pageNo, search);
		model.addAttribute("list", list);
		
		int count = productService.selectProductCount();
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
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
		System.out.println(fno);
		String path = productService.selectImageFile(fno).getImg_path();
		
		System.out.println(path);
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
	public String productDetail(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
			int product_no, Model model) {
		try {
		
		List<ReviewDTO> review_list = productService.selectReviewList(pageNo,product_no);
		List<QnADTO> qna_list = productService.selectQnAList(pageNo,product_no);
		ProductDTO dto = productService.selectproductDTO(product_no);
		int review_count = productService.selectReviewCount(product_no);
		int qna_count = productService.selectQnaCount(product_no);
		
		PaggingVO review_vo = new PaggingVO(review_count, pageNo, 5, 10);
		PaggingVO qna_vo = new PaggingVO(qna_count, pageNo, 5, 10);
		
		model.addAttribute("product", dto);
		model.addAttribute("reviewlist", review_list);
		model.addAttribute("qnalist", qna_list);
		model.addAttribute("review_pagging", review_vo);
		model.addAttribute("qna_pagging", qna_vo);
		FileDTO thumbnail = productService.selectThumbnailDTO(product_no);
		FileDTO image = productService.selectimageDTO(product_no);

		model.addAttribute("thumbnail", thumbnail);			
		model.addAttribute("image", image);
		
		}catch (Exception e) {
			
		}
		return "product_detail";
	}
	@RequestMapping("qnaAllList.do")
	public ResponseEntity<List<QnADTO>>  qnaAllList(int pageNo, int answer_check) {
		List<QnADTO> list = productService.selectQnaAllList(pageNo,answer_check);
		return ResponseEntity.ok(list);
	}
	@RequestMapping("qnaPagging.do")
	public ResponseEntity<PaggingVO> qnaPaggingList(int pageNo, int answer_check) {
		int qna_count = productService.selectQnaAllCount(answer_check);
		PaggingVO qna_vo = new PaggingVO(qna_count, pageNo, 5, 10);
		return ResponseEntity.ok(qna_vo);
	}
	@RequestMapping("/qnaManagerView.do")
	public String qnaManagerView(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, 
			@RequestParam(name = "answer_check", defaultValue = "0") int answer_check, Model model) {		
		int qna_count = productService.selectQnaAllCount(answer_check);
		PaggingVO qna_vo = new PaggingVO(qna_count, pageNo, 5, 10);
		model.addAttribute("qna_pagging", qna_vo);
		return "qna_manager";
	}
	@RequestMapping("/ReviewList.do")
	public ResponseEntity<List<ReviewDTO>> 
							ReviewList(int pageNo, int product_no){
		List<ReviewDTO> list = productService.selectReviewList(pageNo,product_no);
		return ResponseEntity.ok(list);
	}
	@RequestMapping("/qnaList.do")
	public ResponseEntity<List<QnADTO>> 
							QnAList(int pageNo, int product_no){
		List<QnADTO> list = productService.selectQnAList(pageNo,product_no);
		return ResponseEntity.ok(list);
	}
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "mypage";
	}
	
	@RequestMapping("/manager.do")
	public String managerList(Model model) {
		List<MemberDTO> memberList = memberService.selectMember();
		model.addAttribute("memberList",memberList);		
		return "manager2";
	}
	@RequestMapping("/insertCart.do")
	public void insertCart(CartDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		//dto.setCart_no(cartService.selectCartNo());
		int cno = cartService.selectCartNo();
		ProductDTO product = productService.selectproductDTO(dto.getProduct_no());
		//System.out.println(product.toString());
		dto.setImg_no(productService.selectProductImageNo(dto.getProduct_no()));
		dto.setCart_no(cno);
		System.out.println(dto.toString());
		cartService.insertCart(dto);
		try {
			response.getWriter().write(1);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/cartView.do")
	public String cartView(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<CartDTO> list = cartService.selectCartView(id);
		model.addAttribute("cart", list);
		System.out.println(list);
		
		int all_price = 0;
		int total_price = 0;
//		int total_price = cartService.selectCartPrice();
		
		for(int i=0; i<list.size();i++) {
			CartDTO dto = list.get(i);
			total_price = dto.getProduct_price() * dto.getCart_ea();
			all_price = all_price + total_price;
		}
		
		model.addAttribute("total_price", total_price);
		model.addAttribute("all_price", all_price);
		int deliv = 3000;
		model.addAttribute("cart_price", all_price + deliv);
		
		int count = cartService.selectCartCount();
		model.addAttribute("cart_count", count);
		return "cart";
	}
	@RequestMapping("/cartDelete.do")
	public String cartDelete(@RequestParam int cart_no) {
		cartService.cartDelete(cart_no);
		return "redirect:/cartView.do";
	}
	//상품을 구매 페이지에 넣는 매핑
	@RequestMapping("/insertPurchase.do")
	public String insertpurchase(OrderDTO dto, Model model, HttpServletRequest request) {
		System.out.println(dto.toString());
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		ProductDTO product = productService.selectproductDTO(dto.getProduct_no());
		System.out.println(product.toString());
		dto.setImg_no(productService.selectProductImageNo(dto.getProduct_no()));
		dto.setProduct_name(productService.selectProductName(dto.getProduct_no()));
		list.add(dto);
		
		model.addAttribute("order", list);
		
		int all_price = 0;
		int total_price = 0;
		for(int i=0; i<list.size();i++) {
			total_price = list.get(i).getProduct_price() * list.get(i).getOrder_ea();
			all_price = all_price + total_price;
		}
		model.addAttribute("total_price", total_price);
		model.addAttribute("all_price", all_price);
		int deliv = 3000;
		model.addAttribute("order_price", all_price + deliv);
		int count = cartService.selectCartCount();
		model.addAttribute("cart_count", count);
		
		return "purchase";

	}
	//SHOP_CART에 있는 데이터를 SHOP_ORDER에 넣는 매핑
	@RequestMapping("/orderCartProduct.do")
	public String orderCartProduct(String id, Model model, HttpSession session) {
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		List<CartDTO> clist = cartService.selectCartView(id);
		for(int i=0; i<clist.size();i++) {
			list.add(new OrderDTO(clist.get(i).getImg_no(), clist.get(i).getImg_path(), i, clist.get(i).getProduct_no(), null, clist.get(i).getCart_ea(), 0, clist.get(i).getProduct_price(), id, clist.get(i).getProduct_name()));
		}
		list.toString();
		model.addAttribute("order", list);
		
		int all_price = 0;
		int total_price = 0;
		for(int i=0; i<list.size();i++) {
			total_price = list.get(i).getProduct_price() * list.get(i).getOrder_ea();
			all_price = all_price + total_price;
		}
		model.addAttribute("total_price", total_price);
		model.addAttribute("all_price", all_price);
		int deliv = 3000;
		model.addAttribute("order_price", all_price + deliv);
		int count = cartService.selectCartCount();
		model.addAttribute("cart_count", count);
		
		System.out.println(list);
		return "purchase";
	}
	@RequestMapping("/purchase.do")
	public String purchase(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<OrderDTO> list = orderService.selectOrderView(id);
		System.out.println(list);
		model.addAttribute("order", list);
		
//		int all_price = 0;
//		int total_price = 0;
//		for(int i=0; i<list.size();i++) {
//			OrderDTO dto = list.get(i);
//			total_price = dto.getProduct_price() * dto.getOrder_ea();
//			all_price = all_price + total_price;
//		}
//		//int total_price = cartService.selectTotalPrice();
//		model.addAttribute("total_price", total_price);
//		model.addAttribute("all_price", all_price);
//		
//		int deliv = 3000;
//		model.addAttribute("order_price", all_price + deliv);
//		
//		int count = cartService.selectCartCount();
//		model.addAttribute("cart_count", count);
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
		response.getWriter().write("<script>alert('상품 등록 성공');location.href='productDetail.do?product_no="+pno+"';</script>");
		} catch (IOException e) {			
			response.getWriter().write("<script>alert('데이터입력이 잘못됐습니다.');history.back();</script>");
		}
	}
	
	@RequestMapping("/insertQnA.do")
	public void insertQnA(QnADTO dto, HttpSession session, HttpServletResponse response) {
		int qno = productService.selectQnaNo();
		String id = (String) session.getAttribute("id");
		dto.setQna_no(qno);
		dto.setId(id);
		productService.insertQnA(dto);
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('문의사항 등록완료');location.href='productDetail.do?product_no="+dto.getProduct_no()+"';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/insertQnaAnswer.do")
	public void insertQnaAnswer(QnADTO dto, HttpServletResponse response) throws IOException {
		productService.insertQnaAnswer(dto);
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('답변 등록완료');location.href='qnaManagerView.do';</script>");
		} catch (IOException e) {
			response.getWriter().write("<script>alert('답변 등록실패');location.href='qnaManagerView.do';</script>");
		}
	}
	
}
