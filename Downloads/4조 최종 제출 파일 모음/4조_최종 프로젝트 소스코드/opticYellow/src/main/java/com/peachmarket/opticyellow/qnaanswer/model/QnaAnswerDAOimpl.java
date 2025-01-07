package com.peachmarket.opticyellow.qnaanswer.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class QnaAnswerDAOimpl implements QnaAnswerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public QnaAnswerDAOimpl() {
		log.info("QnaAnswerDAOimpl....");
	}
	
	// 효림님 코드
	@Override
	public int insert(QnaAnswerVO vo) {
		return sqlSession.insert("QNAANSWER_INSERT",vo);
	}

	@Override
	public int update(QnaAnswerVO vo) {
		log.info("QNAANSWER_UPDATE()....{}",vo);
		return sqlSession.update("QNAANSWER_UPDATE",vo);
	}

	@Override
	public int delete(QnaAnswerVO vo) {
		log.info("QNAANSWER_DELETE()....{}",vo);
		return sqlSession.delete("QNAANSWER_DELETE",vo);
	}

	@Override
	public List<QnaAnswerVO> selectAll(QnaAnswerVO vo) {
		log.info("QnaAnswerVO selectAll()....{}",vo);
		return sqlSession.selectList("QNAANSWER_SELECT_ALL",vo);
	}



	
	
}
