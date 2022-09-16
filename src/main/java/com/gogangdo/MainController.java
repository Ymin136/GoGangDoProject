package com.gogangdo;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.MemberDTO;
import com.gogangdo.dto.ProductDTO;
import com.gogangdo.service.MemberService;
import com.gogangdo.service.OrderService;
import com.gogangdo.service.ProductService;
import com.gogangdo.service.CertificationService;
import com.gogangdo.vo.PaggingVO;

@Controller
public class MainController {
	private ProductService productService;
	private MemberService memberService;
	private CertificationService certificationService;
	//private OrderService orderService;
	
	public MainController(ProductService productService, MemberService memberService, CertificationService certificationService) {
		this.productService = productService;
		this.memberService = memberService;
		this.certificationService = certificationService ;
		//this.orderService = orderservice;
		
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
	@GetMapping
	public @ResponseBody
	String sendSMS(String phoneNumber) {
		Random rand = new Random();
		String numStr = "";
		for(int i=0;i<4;i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr+=ran;
		}
		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);
		certificationService.certifiedPhoneNumber(phoneNumber,numStr);
		return numStr;
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
		public String productDetail(int product_no, Model model) {
			ProductDTO dto = productService.selectproductDTO(product_no);
			FileDTO thumbnail = productService.selectThumbnailDTO(product_no);
			FileDTO image = productService.selectimageDTO(product_no);
			System.out.println(dto.toString());
			System.out.println(thumbnail.toString());
			System.out.println(image.toString());
			model.addAttribute("product", dto);
			model.addAttribute("thumbnail", thumbnail);
			model.addAttribute("image", image);
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
