package com.gogangdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.OrderDTO;

@Mapper
public interface OrderMapper {

	int selectOrderNo();

	void insertOrder(OrderDTO dto);

	void orderCartProduct(OrderDTO dto);

	List<OrderDTO> selectOrderView(String id);

}
