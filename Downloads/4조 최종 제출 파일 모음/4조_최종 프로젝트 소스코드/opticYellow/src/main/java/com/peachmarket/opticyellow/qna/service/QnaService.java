package com.peachmarket.opticyellow.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.pagination.PaginationVO;
import com.peachmarket.opticyellow.qna.model.QnaDAO;
import com.peachmarket.opticyellow.qna.model.QnaVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnaService {

	@Autowired
	QnaDAO dao;

	public QnaService() {
		log.info("QnaService...");
	}

	// 효림님 코드
	public int insert(QnaVO vo) {
		log.info("서비스에 insert");
		return dao.insert(vo);
	}

	public int update(QnaVO vo) {
		return dao.update(vo);
	}

	public int delete(QnaVO vo) {
		return dao.delete(vo);
	}

	public List<QnaVO> selectAll(PaginationVO pagination, String m_id) {
		return dao.selectAll(pagination,m_id);
	}

	public QnaVO selectOne(QnaVO vo) {
		return dao.selectOne(vo);
	}

	public int totalQna(String m_id) {
		return dao.totalQna(m_id);
	}

	public List<QnaVO> selectAllAdmin(PaginationVO pagination) {
		return dao.selectAllAdmin(pagination);
	}

	

}
