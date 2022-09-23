package com.gogangdo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.ProductDTO;
import com.gogangdo.dto.QnADTO;
import com.gogangdo.dto.ReviewDTO;
import com.gogangdo.mapper.ProductMapper;

@Service
public class ProductService {
	private ProductMapper mapper;
	
	public ProductService(ProductMapper mapper) {
		this.mapper = mapper;
	}
	//CHO
	public List<ProductDTO> selectProductList(int pageNo, int category_no) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageNo", pageNo);
		map.put("category_no", category_no);
		return mapper.selectProductList(map);
	}
	public int selectProductCount(int category_no) {
		return mapper.selectProductCount(category_no);
	}
	public int selectProductSubCount(int sub_category_no) {
		return mapper.selectProductSubCount(sub_category_no);
	}
	public List<ProductDTO> selectProductSubList(int pageNo, int sub_category_no) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageNo", pageNo);
		map.put("sub_category_no", sub_category_no);
		return mapper.selectProductSubList(map);
   }
   public int selectCategoryNo(int category_no) {
		return mapper.selectCategoryNo(category_no);
   }
	public List<ProductDTO> selectProductSortList(int pageNo, int category_no, int sort) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageNo", pageNo);
		map.put("category_no", category_no);
		map.put("sort", sort);
		if(sort == 0)
			return mapper.selectProductLowPrice(map);
		else
			return mapper.selectProductHighPrice(map);
	}
	
	//jym
//	public List<ProductDTO> selectProductLowPrice(int product_price) {
//		return mapper.selectProductLowPrice(product_price);
//	}
	public int selectProductNo() {
		return mapper.selectProductNo();
	}
	public void registerProduct(ProductDTO dto) {
		mapper.registerProduct(dto);		
	}
	public FileDTO selectImageFile(int fno) {
		return mapper.selectImageFile(fno);
	}
	public void insertthumbnail(FileDTO fileDTO) {
		mapper.insertthumbnail(fileDTO);
	}
	public void insertproduct_img(FileDTO fileDTO) {
		mapper.insertproduct_img(fileDTO);
	}
	public int selectImageNo() {
		return mapper.selectImageNo();
	}
	public ProductDTO selectproductDTO(int product_no) {
		return mapper.selectproductDTO(product_no);
	}
	public FileDTO selectThumbnailDTO(int product_no) {
		return mapper.selectThumbnailDTO(product_no);
	}
	public FileDTO selectimageDTO(int product_no) {
		return mapper.selectimageDTO(product_no);
	}
	public List<ReviewDTO> selectReviewList(int pageNo, int product_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageNo", pageNo);
		map.put("product_no", product_no);
		return mapper.selectReviewList(map);
	}

	public List<QnADTO> selectQnAList(int pageNo, int product_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageNo", pageNo);
		map.put("product_no", product_no);
		return mapper.selectQnAList(map);
	}
	public int selectReviewCount(int product_no) {		
		int count = mapper.selectReviewCount(product_no);
		return count;
	}

	public int selectQnaCount(int product_no) {
		int count = mapper.selectQnACount(product_no);
		return count;
	}

	public int selectProductImageNo(int product_no) {
		return mapper.selectProductImageNo(product_no);
	}

	public String selectProductName(int product_no) {
		return mapper.selectProductName(product_no);
  }
	public int selectQnaNo() {
		
		return mapper.selectQnaNo();
	}

	public void insertQnA(QnADTO dto) {
		mapper.insertQnA(dto);
	}

	public List<QnADTO> selectQnaAllList(int pageNo, int answer_check) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageNo", pageNo);
		map.put("answer_check", answer_check);
		return mapper.selectQnaAllList(map);
	}

	public int selectQnaAllCount(int answer_check) {
		int count = mapper.selectQnaAllCount(answer_check);
		return count;
	}

	public void insertQnaAnswer(QnADTO dto) {
		mapper.insertQnaAnswser(dto);
		
	}

	public List<ProductDTO> productSearchList(int pageNo, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("search", search);
		return mapper.productSearchList(map);
	}
	public int selectProductNameCount(String search) {
		return mapper.selectProductNameCount(search);
	}
	public List<ProductDTO> selectBestproductList(int pageNo) {
		return mapper.selectBestproductList(pageNo);
	}
	public List<ProductDTO> selectNewproductList(int pageNo) {
		return mapper.selectNewproductList(pageNo);
	}
}
