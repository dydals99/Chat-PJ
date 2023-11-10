package com.edu.springboot.jdbc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IChatService {

	public ArrayList<ChatRoomDTO> chatroom(int member_idx);
}
  