package com.gogangdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.CartDTO;

@Mapper
public interface CartMapper {

	List<CartDTO> selectCartView(String id);

	int selectCartCount();

	int cartDelete(int cart_no);

	int selectCartNo();

	void insertCart(CartDTO dto);
	
	void deleteAllCart(String id);

//	int selectCartPrice();

//	int selectTotalPrice();


}