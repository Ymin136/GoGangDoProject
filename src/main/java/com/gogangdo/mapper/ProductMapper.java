package com.gogangdo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	int selectProductNo();

	void registerProduct(ProductDTO dto);

}
