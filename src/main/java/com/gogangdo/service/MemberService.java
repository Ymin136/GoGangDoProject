package com.gogangdo.service;

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

	

}
