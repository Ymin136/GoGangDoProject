package com.gogangdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	int selectProductNo();
	
//	List<ProductDTO> selectProductList(int pageNo);
//
//	int selectProductCount();
}
