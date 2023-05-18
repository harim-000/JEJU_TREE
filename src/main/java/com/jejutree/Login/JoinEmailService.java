package com.jejutree.Login;

import com.jejutree.user_model.UserDTO;

public interface JoinEmailService {
	
	int updateMailKey(UserDTO memberDto) throws Exception;

	int updateMailAuth(UserDTO memberDto) throws Exception;
	   
	int emailAuthFail(String id) throws Exception;
	
	int insertUser(UserDTO userDTO) throws Exception;

}
