package com.peachmarket.opticyellow.notice.model;

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
public class NoticeDAOimpl implements NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public NoticeDAOimpl() {
		log.info("NoticeDAOimpl....");
	}

	// 효림님 코드
	@Override
	public int insert(NoticeVO vo) {
		return sqlSession.insert("N_INSERT",vo);
	}

	@Override
	public int update(NoticeVO vo) {
		log.info("update()....{}",vo);
		return sqlSession.update("N_UPDATE",vo);
	}

	@Override
	public int delete(NoticeVO vo) {
		log.info("delete()....{}",vo);
		return sqlSession.delete("N_DELETE",vo);
	}

	@Override
	public List<NoticeVO> selectAll(PaginationVO pagination) {
		log.info("selectAll()....{}",pagination);
		return sqlSession.selectList("N_SELECT_ALL",pagination);
	}

	@Override
	public NoticeVO selectOne(NoticeVO vo) {
		log.info("selectOne()임플임..{}",vo);
		
		return sqlSession.selectOne("N_SELECT_ONE",vo);
	}

	@Override
	public List<NoticeVO> searchList(String searchWord, int startList, int endList) {
		log.info("searchList()....searchWord:{}",searchWord);
		String key = "N_SEARCH_LIST";
	
        Map<String, Object> params = new HashMap<String,Object>();
        params.put("searchWord", "%" + searchWord + "%");
        params.put("startList", startList);
        params.put("endList", endList);
		
		return sqlSession.selectList(key,params);
	}

	@Override
	public void vcountUp(NoticeVO vo) {
		sqlSession.update("N_VCOUNT_UP",vo);
	}

	@Override
	public int totalNotice() {
		log.info("totalNotice()...{}");
		return sqlSession.selectOne("TOTAL_NOTICE");
	}

}
