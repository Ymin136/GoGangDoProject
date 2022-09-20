package com.gogangdo.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.MemberDTO;

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
}
