package com.edu.springboot.jdbc;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberService {

	public MemberDTO login_act(String email, String password);
	public int signup_act(String email, String name, String password);
}
  