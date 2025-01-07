package com.peachmarket.opticyellow.faq.model;

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
public class FAQDAOimpl implements FAQDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public FAQDAOimpl() {
		log.info("FAQDAOimpl....");
	}

	// 효림님 코드
	@Override
	public int insert(FAQVO vo) {
		log.info("insert()....드러갔나요{}",vo);
		return sqlSession.insert("Q_INSERT",vo);
	}

	@Override
	public int update(FAQVO vo) {
		log.info("update()....{}",vo);
		return sqlSession.update("Q_UPDATE",vo);
	}

	@Override
	public int delete(FAQVO vo) {
		log.info("delete()....{}",vo);
		return sqlSession.delete("Q_DELETE",vo);
	}

	@Override
	public List<FAQVO> selectAll(PaginationVO pagination) {
		log.info("selectAll()....{}",pagination);
		return sqlSession.selectList("Q_SELECT_ALL",pagination);
	}

	@Override
	public FAQVO selectOne(FAQVO vo) {
		log.info("selectOne()....{}",vo);
		
		return sqlSession.selectOne("Q_SELECT_ONE",vo);
	}

	@Override
	public List<FAQVO> searchList(String searchKey, String searchWord,int startList, int endList) {
		
		log.info("DAOimpl()...{},{}", searchKey, searchWord);
		
	        Map<String, Object> params = new HashMap<String,Object>();
	        params.put("searchKey", searchKey);
	        params.put("searchWord", "%" + searchWord + "%");
	        params.put("startList", startList);
	        params.put("endList", endList);

	        if ("all".equals(searchKey)) {
	            return sqlSession.selectList("Q_SEARCH_ALL", params);
	        } else {
	            return sqlSession.selectList("Q_SEARCH", params);
	        }
	    }
//		String newsearchWord = "%" + searchWord + "%";
//		if (searchKey.equals("All")) {
//			Map<String, Object> parameters = new HashMap<String, Object>();
//			parameters.put("searchWord", newsearchWord);
//			return sqlSession.selectList("Q_SEARCH_ALL",parameters);
//		} else if{
//			Map<String, Object> parameters = new HashMap<String, Object>();
//			parameters.put("searchKey", searchKey);
//			parameters.put("searchWord", newsearchWord);
//			return sqlSession.selectList("Q_SEARCH", parameters);
//		}
//		log.info("searchList()....searchKey:{}",searchKey);
//		log.info("searchList()....searchWord:{}",searchWord);
//		String key = "";
//		if(searchKey.equals("title")) {
//			key = "Q_SEARCH_LIST_TITLE";
//		}else if(searchKey.equals("content")) {
//			key = "Q_SEARCH_LIST_CONTENT";
//			
//		}else {
//			key = "Q_SEARCH_LIST_WRITER";
//			
//		}
//		return sqlSession.selectList(key,"%"+searchWord+"%");
//	}

	@Override
	public void vcountUp(FAQVO vo) {
		log.info("vcountUp()....{}",vo);
		sqlSession.update("Q_VCOUNT_UP",vo);
	}

	@Override
	public int totalFaq() {
		log.info("totalFaq()....");
		return sqlSession.selectOne("Q_TOTAL");
	}

}
