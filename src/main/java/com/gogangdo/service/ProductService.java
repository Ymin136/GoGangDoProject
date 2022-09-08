package com.gogangdo.service;

import java.util.List;

import org.springframework.stereotype.Service;

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

}
