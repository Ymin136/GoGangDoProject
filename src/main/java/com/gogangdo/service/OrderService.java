package com.gogangdo.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.gogangdo.dto.OrderManageDTO;
import com.gogangdo.dto.Order_DetailDTO;
import com.gogangdo.dto.ProductDTO;
import com.gogangdo.mapper.OrderMapper;

@Service
public class OrderService {
	private OrderMapper mapper;

	public OrderService(OrderMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public void insertOrder(Order_DetailDTO dto) {
		mapper.insertOrder(dto);
	}

	public void orderCartProduct(Order_DetailDTO dto) {
		mapper.orderCartProduct(dto);
	}

	public List<Order_DetailDTO> selectOrderView(String id) {
		return mapper.selectOrderView(id);
	}
	
	public int selectOrderNo() {
		int ono = mapper.selectOrderNo();
//		manage.setOrder_no(ono);
//		mapper.insertOrderManage(manage);
		return ono;
	}

	public int selectOrderDetailNo() {
		int ono = mapper.selectOrderDetailNo();
//		detail.setOrder_no(ono);
//		mapper.insertOrderDetail(detail);
		return ono;
	}

	public void insertOrderDetail(Order_DetailDTO detail) {
		mapper.insertOrderDetail(detail);
	}

	public void insertOrderManage(OrderManageDTO manage) {
		mapper.insertOrderManage(manage);
	}


	



//	public void insertOrderManage(int ono, String id) {
//		Map<String , Object> map = new HashMap<String, Object>();
//		map.put("ono", ono);
//		map.put("id", id);
//		mapper.insertOrderManage(map);
//	}
	
}
