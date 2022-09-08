package com.gogangdo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gogangdo.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	int insertmember(MemberDTO dto);

}
