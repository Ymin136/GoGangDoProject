package com.gogangdo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gogangdo.dto.FileDTO;
import com.gogangdo.dto.ProductDTO;
import com.gogangdo.mapper.ProductMapper;

@Service
public class ProductService {
	private ProductMapper mapper;
	
	public ProductService(ProductMapper mapper) {
		this.mapper = mapper;
	}
	
	public List<ProductDTO> selectProductList(int pageNo, int category_no) {
		return mapper.selectProductList(pageNo, category_no);
	}
	public int selectProductCount() {
		return mapper.selectProductCount();
	}
	
	
	
	//jym
	public List<ProductDTO> selectProductLowPrice(int product_price) {
		return mapper.selectProductLowPrice(product_price);
	}
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
	public List<ProductDTO> selectProductSubList(int pageNo, int sub_category_no) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageNo", pageNo);
		map.put("sub_category_no", sub_category_no);
		return mapper.selectProductSubList(map);
   }
	public List<ProductDTO> selectReviewList(int pageNo, int product_no) {
		return mapper.selectReviewList(pageNo, product_no);
	}
}
