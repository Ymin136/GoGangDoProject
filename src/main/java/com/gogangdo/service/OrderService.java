package com.gogangdo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gogangdo.dto.OrderDTO;
import com.gogangdo.mapper.OrderMapper;

@Service
public class OrderService {
	private OrderMapper mapper;

	public OrderService(OrderMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public int selectOrderNo() {
		return mapper.selectOrderNo();
	}

	public void insertOrder(OrderDTO dto) {
		mapper.insertOrder(dto);
	}

	public void orderCartProduct(OrderDTO dto) {
		mapper.orderCartProduct(dto);
	}

	public List<OrderDTO> selectOrderView(String id) {
		return mapper.selectOrderView(id);
	}
	
}
