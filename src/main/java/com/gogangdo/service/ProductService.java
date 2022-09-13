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
	public List<ProductDTO> selectProductList(int pageNo, int a) {
		if(a==0)
			return mapper.selectProductListRecent(pageNo);
		else if(a==1)
			return mapper.selectProductListLow(pageNo);
		else
			return mapper.selectProductListHigh(pageNo);
	}
	public int selectProductCount() {
		return mapper.selectProductCount();
	}
	public List<ProductDTO> selectProductLowPrice(int product_price) {
		return mapper.selectProductLowPrice(product_price);
	}
	public FileDTO selectImageFile(int fno) {
		return mapper.selectImageFile(fno);
	}
	

}
