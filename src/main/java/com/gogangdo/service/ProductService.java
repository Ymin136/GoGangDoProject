package com.gogangdo.service;

import java.util.List;

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
	public int selectProductNo() {
		return mapper.selectProductNo();
		
	}

	public void registerProduct(ProductDTO dto) {
		mapper.registerProduct(dto);
		
	}
	public List<ProductDTO> selectProductList(int pageNo) {
		return mapper.selectProductList(pageNo);
	}
	public int selectProductCount() {
		return mapper.selectProductCount();
	}
	public List<ProductDTO> selectProductLowPrice(int product_price) {
		return mapper.selectProductLowPrice(product_price);
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
	public FileDTO selectimagelDTO(int product_no) {
		return mapper.selectimagelDTO(product_no);
	}

}
