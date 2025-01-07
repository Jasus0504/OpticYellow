package com.peachmarket.opticyellow.qnaanswer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.qna.model.QnaDAO;
import com.peachmarket.opticyellow.qna.model.QnaVO;
import com.peachmarket.opticyellow.qnaanswer.model.QnaAnswerDAO;
import com.peachmarket.opticyellow.qnaanswer.model.QnaAnswerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnaAnswerService {

	@Autowired
	QnaAnswerDAO dao;

	public QnaAnswerService() {
		log.info("QnaAnswerService...");
	}

	// 효림님 코드
	public int insert(QnaAnswerVO vo) {
		log.info("서비스에 insert");
		return dao.insert(vo);
	}

	public int update(QnaAnswerVO vo) {
		return dao.update(vo);
	}

	public int delete(QnaAnswerVO vo) {
		return dao.delete(vo);
	}

	public List<QnaAnswerVO> selectAll(QnaAnswerVO vo) {
		return dao.selectAll(vo);
	}



	

}
