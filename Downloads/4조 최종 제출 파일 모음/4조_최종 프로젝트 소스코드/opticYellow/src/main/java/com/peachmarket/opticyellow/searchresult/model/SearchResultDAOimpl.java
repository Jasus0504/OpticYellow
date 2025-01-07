package com.peachmarket.opticyellow.searchresult.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class SearchResultDAOimpl implements SearchResultDAO {

	@Autowired
	SqlSession sqlSession;

	// 병엽님 코드
	@Override
	public List<SearchResultVO> selectAll() {
		log.info("selectAll()...");

		List<SearchResultVO> vos = sqlSession.selectList("SR_SELECT_ALL");

		return vos;
	}

	@Override
	public List<SearchResultVO> searchList(String searchWord) {
		log.info("searchList()...{}", searchWord);

		List<SearchResultVO> vos = null;

		vos = sqlSession.selectList("SR_SEARCH_LIST", "%" + searchWord + "%");

		return vos;
	}
//
//	@Override
//	public int delete(SearchResultVO vo) {
//		log.info("delete()...{}", vo);
//
//		int flag = 0;
//
//		flag = sqlSession.delete("DELETE", vo);
//
//		return flag;
//	}
//
//	@Override
//	public int confirm(SearchResultVO vo) {
//		log.info("confirm()...{}", vo);
//
//		int flag = 0;
//
//		flag = sqlSession.update("CONFIRM", vo);
//
//		return flag;
//	}
//
//	@Override
//	public SearchResultVO selectOne(SearchResultVO vo) {
//		log.info("selectOne()...{}", vo);
//		
//		SearchResultVO vo2 = sqlSession.selectOne("SELECT_ONE", vo);
//		
//		return vo2;
//	}
//
//	@Override
//	public int update(SearchResultVO vo) {
//		log.info("update()...{}", vo);
//
//		int flag = 0;
//
//		if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() == "") {
//			flag = sqlSession.update("UPDATE1", vo);			
//		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() == "") {
//			flag = sqlSession.update("UPDATE2", vo);						
//		} else if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() == "") {
//			flag = sqlSession.update("UPDATE3", vo);					
//		} else if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() != "") {
//			flag = sqlSession.update("UPDATE4", vo);					
//		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() == "") {
//			flag = sqlSession.update("UPDATE5", vo);					
//		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() != "") {
//			flag = sqlSession.update("UPDATE6", vo);					
//		} else if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() != "") {
//			flag = sqlSession.update("UPDATE7", vo);					
//		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() != "") {
//			flag = sqlSession.update("UPDATE8", vo);					
//		}
//
//		return flag;
//	}

}
