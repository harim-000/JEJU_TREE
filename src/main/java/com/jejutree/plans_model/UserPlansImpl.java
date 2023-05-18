package com.jejutree.plans_model;
	
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
	
@Repository
public class UserPlansImpl implements UserPlansDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPlans(UserPlansDTO dto) {
	
		return this.sqlSession.insert("addplans", dto);

	}
}
