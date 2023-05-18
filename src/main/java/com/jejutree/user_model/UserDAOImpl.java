package com.jejutree.user_model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertUser(UserDTO dto) {
		return this.sqlSession.insert("UserJoin",dto);
	}

	@Override
	public List<UserDTO> getUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteUser(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO getuser(String user_id) {
		return this.sqlSession.selectOne("UserInfo",user_id);
	}

	@Override
	public int checkEmail(String email) {
		return this.sqlSession.selectOne("checkEmail", email);
	}

	@Override
	public int updateMailKey(UserDTO dto) throws Exception {
		return this.sqlSession.update("updateMailKey", dto);
	}

	@Override
	public int updateMailAuth(UserDTO dto) throws Exception {
		return this.sqlSession.update("updateMailAuth", dto);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		 return this.sqlSession.selectOne("emailAuthFail", id);
	}

	
	
}