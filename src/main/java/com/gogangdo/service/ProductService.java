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

//	public List<ProductDTO> selectProductList(int pageNo) {
//		return mapper.selectProductList(pageNo);
//	}
//
//	public int selectProductCount() {
//		return mapper.selectProductCount();
//	}
}
