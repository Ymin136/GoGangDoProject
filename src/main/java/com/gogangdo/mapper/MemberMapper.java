package com.gogangdo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.MemberDTO;
import com.gogangdo.dto.Order_DetailDTO;
import com.gogangdo.dto.ReviewDTO;

@Mapper
public interface MemberMapper {

	int insertmember(MemberDTO dto);

	MemberDTO login(Map<String, Object> membermap);

	int userUpdate(MemberDTO dto);

	int userDelete(String id);

	String selectid(String id);

	List<MemberDTO> selectMember();

	int updateMember(MemberDTO dto);

	int deleteMember(String user_no);
	
	List<MemberDTO> selectMemberDetail(Map<String, Object> map);
	
	void updateMemberAccess(HashMap<String, Object> map);
	
	List<MemberDTO> selectproduct();

	List<ReviewDTO> selectReviewList();

	List<Order_DetailDTO> selectorder();

	List<Order_DetailDTO> selectOrderList(Order_DetailDTO dto);

	int updateOrder(Order_DetailDTO dto);

	int deleteOrder(int order_no);
}
