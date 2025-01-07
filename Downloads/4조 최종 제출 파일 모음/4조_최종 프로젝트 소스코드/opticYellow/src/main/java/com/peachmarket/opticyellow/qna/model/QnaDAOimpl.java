package com.peachmarket.opticyellow.qna.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class QnaDAOimpl implements QnaDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public QnaDAOimpl() {
		log.info("QnaDAOimpl....");
	}
	
	// 효림님 코드
	@Override
	public int insert(QnaVO vo) {
		
		log.info("QnaDAOimpl 인서트....");
		return sqlSession.insert("QNA_INSERT",vo);
	}

	@Override
	public int update(QnaVO vo) {
		log.info("update()....{}",vo);
		return sqlSession.update("QNA_UPDATE",vo);
	}

	@Override
	public int delete(QnaVO vo) {
		log.info("delete()....{}",vo);
		return sqlSession.delete("QNA_DELETE",vo);
	}

	@Override
	public List<QnaVO> selectAll(PaginationVO pagination,String m_id) {
		log.info("selectAll()....{},{}",pagination,m_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("startList", pagination.getStartList());
		map.put("endList", pagination.getEndList());
		map.put("q_writer", m_id);
		
		return sqlSession.selectList("QNA_SELECT_ALL",map);
	}

	@Override
	public QnaVO selectOne(QnaVO vo) {
		log.info("selectOne()....{}",vo);
		
		return sqlSession.selectOne("QNA_SELECT_ONE",vo);
	}

	@Override
	public int totalQna(String m_id) {
		log.info("totalQna()....{}",m_id);
		return sqlSession.selectOne("TOTAL_QNA",m_id);
	}

	@Override
	public List<QnaVO> selectAllAdmin(PaginationVO pagination) {
		log.info("selectAllAdmin()....{}",pagination);
		return sqlSession.selectList("QNA_ALL_ADMIN",pagination);
	}

	
	
}
