package com.gogangdo.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	int insertmember(MemberDTO dto);

	MemberDTO login(Map<String, Object> membermap);

}
