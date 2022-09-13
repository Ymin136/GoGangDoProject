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
	public FileDTO selectImageFile(int fno) {		
		return mapper.selectImageFile(fno);
	}

}
