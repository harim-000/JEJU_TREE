package com.jejutree.user_model;

import java.util.List;



public interface UserDAO {
	
	int insertUser(UserDTO dto);
	
	List<UserDTO> getUserList();
	
	int deleteUser(String user_id);

	//로그인시 정보 조회
	UserDTO getuser(String user_id);
	
	// 이메일 중복 체크 처리
   int checkEmail(String email);
   
   // 회원가입 시 이메일 인증을 위한 랜덤번호 저장
   int updateMailKey(UserDTO dto) throws Exception;
   
    // 메일 인증을 하면 mail_auth 컬럼을 기본값 0에서 1로 바꿔 로그인을 허용
   int updateMailAuth(UserDTO dto) throws Exception;
   
   // 이메일 인증을 안 했으면 0을 반환, 로그인 시 인증했나 안 했나 체크하기 위함
   int emailAuthFail(String id) throws Exception;

}
