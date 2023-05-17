package com.jejutree.user_model;

import java.util.List;



public interface UserDAO {
	
	int insertUser(UserDTO dto);
	
	List<UserDTO> getUserList();
	
	int deleteUser(String user_id);

	//로그인시 정보 조회
	UserDTO getuser(String user_id);

}
