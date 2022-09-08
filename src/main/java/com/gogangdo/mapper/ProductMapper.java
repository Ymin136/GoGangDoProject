package com.gogangdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	int selectProductNo();


	void registerProduct(ProductDTO dto);


	List<ProductDTO> selectProductList(int pageNo);


	int selectProductCount();


	List<ProductDTO> selectProductLowPrice(int product_price);

}
