package com.gogangdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.CartDTO;

@Mapper
public interface CartMapper {

	CartDTO selectCartView(String id);

	int selectCartCount();

	int cartDelete(int product_no);


}