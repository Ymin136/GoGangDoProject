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

import org.json.JSONObject;
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
import com.gogangdo.dto.OrderManageDTO;
import com.gogangdo.dto.Order_DetailDTO;
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
	public String startPage(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model) {
		List<ProductDTO> list = productService.selectBestproductList(pageNo);
		System.out.println(list.size());
		model.addAttribute("list", list);
		for(int i=0;i<list.size();i++) {
			list.get(i).setImg_no(productService.selectProductImageNo(list.get(i).getProduct_no()));
		}
		List<ProductDTO> list2 = productService.selectNewproductList(pageNo);
		System.out.println(list2.size());
		model.addAttribute("list2", list2);
		for(int i=0;i<list2.size();i++) {
			list2.get(i).setImg_no(productService.selectProductImageNo(list2.get(i).getProduct_no()));
		}
		return "main";
	}
	
	@RequestMapping("/main.do")
	public String main(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model) {

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
		
		int categoryNo = productService.selectCategoryNo(category_no);
		model.addAttribute("category", categoryNo);
		
		int count = productService.selectProductCount(category_no);
		model.addAttribute("count",count);
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
		model.addAttribute("pagging", vo);
		return "product_list";
	}
	@RequestMapping("/productSubList.do")
	public String productSubList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model, int sub_category_no) {
		List<ProductDTO> sub_list = productService.selectProductSubList(pageNo, sub_category_no);
		model.addAttribute("list", sub_list);
		
		int count = productService.selectProductSubCount(sub_category_no);
		model.addAttribute("count",count);
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
		model.addAttribute("pagging", vo);
		return "product_list";
    }
	@RequestMapping("/productSortList.do")
	public String productSortList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, int sort, int category_no, Model model) {
		List<ProductDTO> sort_list = productService.selectProductSortList(pageNo, category_no, sort);
		model.addAttribute("list", sort_list);
		
		int categoryNo = productService.selectCategoryNo(category_no);
		model.addAttribute("category", categoryNo);
		
		int count = productService.selectProductCount(category_no);
		model.addAttribute("count",count);
		PaggingVO vo = new PaggingVO(count, pageNo, 20, 4);
		return "product_list";
	}
	@RequestMapping("/productSearchList.do")
	public String productSearchList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, Model model, String search) {
		List<ProductDTO> list = productService.productSearchList(pageNo, search);
		model.addAttribute("list", list);
		
		int count = productService.selectProductNameCount(search);
		model.addAttribute("count",count);

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
		
		ProductDTO dto = productService.selectproductDTO(product_no);
		model.addAttribute("product", dto);
		FileDTO thumbnail = productService.selectThumbnailDTO(product_no);
		FileDTO image = productService.selectimageDTO(product_no);
		model.addAttribute("thumbnail", thumbnail);			
		model.addAttribute("image", image);
		
		List<ReviewDTO> review_list = productService.selectReviewList(pageNo,product_no);		
		int review_count = productService.selectReviewCount(product_no);		
		model.addAttribute("reviewlist", review_list);
		PaggingVO review_vo = new PaggingVO(review_count, pageNo, 5, 10);
		model.addAttribute("review_pagging", review_vo);
		
		List<QnADTO> qna_list = productService.selectQnAList(pageNo,product_no);
		int qna_count = productService.selectQnaCount(product_no);
		model.addAttribute("qnalist", qna_list);
		PaggingVO qna_vo = new PaggingVO(qna_count, pageNo, 5, 10);
		model.addAttribute("qna_pagging", qna_vo);
		
		
	
		
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
	public ResponseEntity<List<QnADTO>> QnAList(int pageNo, int product_no){
		List<QnADTO> list = productService.selectQnAList(pageNo,product_no);
		return ResponseEntity.ok(list);
	}
	@RequestMapping("/myPage.do")
	public String myPage(Model model, HttpSession session, HttpServletResponse response) {
		String id = (String) session.getAttribute("id");
		List<CartDTO> list = cartService.selectCartView(id);
		model.addAttribute("cart", list);
		return "mypage";
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
	public String cartView(Model model, HttpSession session, HttpServletResponse response) {
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
	public String insertpurchase(Order_DetailDTO dto, Model model, HttpServletRequest request) {
		//System.out.println(dto.toString());
		List<Order_DetailDTO> list = new ArrayList<Order_DetailDTO>();
		ProductDTO product = productService.selectproductDTO(dto.getProduct_no());
		//System.out.println(product.toString());
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
		
		System.out.println(list.toString());
//		insertCart()
		return "purchase";
	}
	//SHOP_CART에 있는 데이터를 구매 페이지에 넣는 매핑
	@RequestMapping("/orderCartProduct.do")
	public String orderCartProduct(String id, Model model, HttpSession session) {
		List<Order_DetailDTO> list = new ArrayList<Order_DetailDTO>();
		
		List<CartDTO> clist = cartService.selectCartView(id);
		for(int i=0; i<clist.size();i++) {
			list.add(new Order_DetailDTO(clist.get(i).getImg_no(), clist.get(i).getImg_path(), i, i, clist.get(i).getProduct_no(), clist.get(i).getCart_ea(), 0, clist.get(i).getProduct_price(), id, clist.get(i).getProduct_name()));
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
	public void purchase(HttpSession session, HttpServletResponse response, OrderManageDTO manage) throws IOException{
//		String id = (String) session.getAttribute("id");
		
		int ono = orderService.selectOrderNo();
		manage.setOrder_no(ono);
		System.out.println(manage.toString());
		orderService.insertOrderManage(manage);
//		System.out.println(manage.toString());
		
		List<CartDTO>list = cartService.selectCartView(manage.getId());	
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getProduct_price());
			int odno = orderService.selectOrderDetailNo();
			Order_DetailDTO dto = new Order_DetailDTO(ono, odno, list.get(i).getProduct_no(),list.get(i).getCart_ea(),
					list.get(i).getProduct_price(),list.get(i).getProduct_name());
			orderService.insertOrderDetail(dto);
		}
//		detail.setOrder_no(ono);
//		System.out.println(detail.toString());
		
		cartService.deleteAllCart(manage.getId());
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('결제 완료되었습니다. 메인페이지로 돌아갑니다.');location.href='main.do';</script>");
		} catch (IOException e1) {
			response.getWriter().write("<script>alert('결제 실패하였습니다.');history.back();</script>");
		}
	}
	
	@RequestMapping("/productRegisterView.do")
	public String productRegisterView() {
		return "product_register";
	}
	
	@RequestMapping("/productRegister.do")
	public void productRegister(ProductDTO dto, HttpServletResponse response, MultipartHttpServletRequest request) throws IOException {
		try {
		System.out.println(dto.toString());
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
	@RequestMapping("/managerList.do")
	public String managerList(Model model) {
		List<MemberDTO> memberList = memberService.selectMember();
		List<MemberDTO> productreList = memberService.selectproduct();
		List<ReviewDTO> reviewList = memberService.selectReviewList();
		List<Order_DetailDTO> orderList = memberService.selectorder();
		System.out.println(orderList);
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("productreList",productreList);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("orderList",orderList);
		return "manager2";
	}	
	@RequestMapping("/productreList.do")
	public void searchMembe(HttpServletResponse response, String type, String search) throws IOException{
		response.setCharacterEncoding("utf-8");
		List<ProductDTO> list = productService.selectProductDetail(type, search);
		JSONObject json = new JSONObject();
		System.out.println("###list### : " + list);
		
		if(!list.isEmpty()) {
			json.put("list", list);
			response.getWriter().write(json.toString());
		}else {
			json.put("message", "검색 결과가 없습니다.");
			response.getWriter().write(json.toString());
		}
		
	}
	@RequestMapping("/searchMember.do")
	public void searchMember(HttpServletResponse response, String type, String search) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<MemberDTO> list = memberService.selectMemberDetail(type, search);
		JSONObject json = new JSONObject();
		
		if(!list.isEmpty()) {
			json.put("list", list);
			response.getWriter().write(json.toString());
		}else {
			json.put("message", "검색 결과가 없습니다.");
			response.getWriter().write(json.toString());
		}
	}
	@RequestMapping("/updateMember.do")
	public void updateMember(HttpServletResponse response,MemberDTO dto) throws IOException {
		
		//javascript로 undefined 값이 들어올 경우 빈 문자열로 대체
		if(dto.getTel().equals("undefined")) {
			dto.setTel("");
		}
		if(dto.getEmail().equals("undefined")) {
			dto.setEmail("");
		}
		if(dto.getAddress1().equals("undefined")) {
			dto.setAddress1("");
		}
		if(dto.getAddress2().equals("undefined")) {
			dto.setAddress2("");
		}
		if(dto.getPost().equals("undefined")) {
			dto.setPost("");
		}
		
		int result = 0;
		result = memberService.updateMember(dto);
		
		if(result == 1)
			response.getWriter().write("1");
		else
			response.getWriter().write("0");
		
	}
	@RequestMapping("/deleteMember.do")
	public void deleteMember(HttpServletResponse response, String user_no) throws IOException {
		response.setCharacterEncoding("utf-8");
		
		int result = 0;
		result = memberService.deleteMember(user_no);
		
		if(result == 1)
			response.getWriter().write("1");
		else
			response.getWriter().write("0");
	}
	@RequestMapping("/updateMemberAccess.do")
	public String updateMemberAccess(String id, String user_grade) {
		memberService.updateMemberAccess(id, user_grade);
		return "redirect:/managerList.do";
	}
	@RequestMapping("/updateOrder.do")
	public void updateOrder(HttpServletResponse response,Order_DetailDTO dto) throws IOException {
		int result = 0;
		result = memberService.updateOrder(dto);
		
		if(result == 1) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
	}
	@RequestMapping("/deleteOrder.do")
	public void deleteOrder(HttpServletResponse response, int order_no) throws IOException {
		int result = 0;
		result = memberService.deleteOrder(order_no);
		
		if(result == 1) {
			response.getWriter().write("1");
		}else {
			response.getWriter().write("0");
		}
		
		
	}
}
