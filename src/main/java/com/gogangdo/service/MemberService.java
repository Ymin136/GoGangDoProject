package com.gogangdo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gogangdo.dto.MemberDTO;
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

	public String selectId(String id) {
		return memberMapper.selectid(id);
	}

	
	

	

}
