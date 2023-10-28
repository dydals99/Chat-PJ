package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class MemberDTO {
	int member_idx;
	String email;
	String password;
	String name;
}
