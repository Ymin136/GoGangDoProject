package com.gogangdo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gogangdo.dto.MemberDTO;
import com.gogangdo.dto.Order_DetailDTO;
import com.gogangdo.dto.ReviewDTO;
import com.gogangdo.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper memberMapper;
	
	public MemberService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	public int insertmember(MemberDTO dto) {
		return memberMapper.insertmember(dto);
		
	}

	public MemberDTO login(String id, String passwd) {
		Map<String, Object> membermap = new HashMap<String, Object>(); 
		membermap.put("id", id);
		membermap.put("pw", passwd);
		return memberMapper.login(membermap);
	}

	public int userUpdate(MemberDTO dto) {
		return memberMapper.userUpdate(dto);
	}

	public int userDelete(String id) {
		
		return memberMapper.userDelete(id);
   }
	public String selectId(String id) {
		return memberMapper.selectid(id);
	}
	
	public List<MemberDTO> selectMember() {
		return memberMapper.selectMember();
	}
	
	public List<MemberDTO> selectMemberDetail(String type, String search) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("search", search);
		return memberMapper.selectMemberDetail(map);
	}

	public void updateMemberAccess(String id, String user_grade) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("user_grade", user_grade);
		memberMapper.updateMemberAccess(map);
		
	}
	public List<MemberDTO> selectproduct() {
		return memberMapper.selectproduct();
	}

	public int updateMember(MemberDTO dto) {
		return memberMapper.updateMember(dto);
	}

	public int deleteMember(String user_no) {
		return memberMapper.deleteMember(user_no);
	}

	public List<ReviewDTO> selectReviewList() {
		return memberMapper.selectReviewList();
	}

	public List<Order_DetailDTO> selectorder() {
		return memberMapper.selectorder();
	}

	public List<Order_DetailDTO> selectOrderList(Order_DetailDTO dto) {
		return memberMapper.selectOrderList(dto);
	}

	public int updateOrder(Order_DetailDTO dto) {
		return memberMapper.updateOrder(dto);
	}

	public int deleteOrder(int order_no) {
		return memberMapper.deleteOrder(order_no);
	}
	
	
	

}
