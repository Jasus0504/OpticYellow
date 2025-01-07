package com.peachmarket.opticyellow.registration.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RegistrationDAOimpl implements RegistrationDAO {
	
	@Autowired
	SqlSession sqlSession;

	// 병엽님 코드
	// 테니스장 정보 등록
	@Override
	public int registration(RegistrationVO vo) {
		log.info("registration()...{}" + vo);

		int flag = 0;

		flag = sqlSession.insert("COURT_REGIST", vo);
		
		return flag;
	}
}
