package com.edu.springboot.jdbc;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberService {

	public MemberDTO login_act(String email, String password);
	public int signup_act(MemberDTO dto);
	public List<MemberDTO> select_user();
}
  