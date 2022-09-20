package com.gogangdo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.OrderManageDTO;
import com.gogangdo.dto.Order_DetailDTO;
import com.gogangdo.dto.Order_DetailDTO;

@Mapper
public interface OrderMapper {

	void insertOrder(Order_DetailDTO dto);

	void orderCartProduct(Order_DetailDTO dto);

	List<Order_DetailDTO> selectOrderView(String id);

	int selectOrderNo();
	
	void insertOrderManage(OrderManageDTO manage);
	
	int selectOrderDetailNo();
	
	void insertOrderDetail(Order_DetailDTO detail);

}
