package com.peachmarket.opticyellow.facman.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.common.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FacManDAOimpl implements FacManDAO {

	@Autowired
	SqlSession sqlSession;

	// 병엽님 코드
	
	// 전체 목록 카운트
	@Override
	public int facSelectAllCnt() {
		log.info("facSelectAllCnt()...");

		return sqlSession.selectOne("FAC_MAN_SELECT_ALL_COUNT");
	}
	
	// 전체 목록
	@Override
	public List<FacManVO> selectAll(PaginationVO pagination) {
		log.info("selectAll()...{}",pagination);

		List<FacManVO> vos = sqlSession.selectList("FAC_MAN_SELECT_ALL",pagination);

		return vos;
	}

	@Override
	public List<FacManVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...{}, {}", searchKey, searchWord);

		List<FacManVO> vos = null;

		if (searchKey.equals("fac_name")) {
			vos = sqlSession.selectList("SEARCH_LIST_FACNAME", "%" + searchWord + "%");
		} else if (searchKey.equals("address")) {
			vos = sqlSession.selectList("SEARCH_LIST_ADDRESS", "%" + searchWord + "%");
		} else if (searchKey.equals("register_id")) {
			vos = sqlSession.selectList("SEARCH_LIST_REGISTERID", "%" + searchWord + "%");
		} else if (searchKey.equals("f_confirm")) {
			vos = sqlSession.selectList("SEARCH_LIST_CONFIRM", "%" + searchWord + "%");
		}

		return vos;
	}

	@Override
	public int delete(FacManVO vo) {
		log.info("delete()...{}", vo);

		int flag = 0;

		flag = sqlSession.delete("DELETE", vo);

		return flag;
	}

	@Override
	public int confirm(FacManVO vo) {
		log.info("confirm()...{}", vo);

		int flag = 0;

		flag = sqlSession.update("CONFIRM", vo);

		return flag;
	}

	@Override
	public FacManVO selectOne(FacManVO vo) {
		log.info("selectOne()...{}", vo);
		
		FacManVO vo2 = sqlSession.selectOne("SELECT_ONE", vo);
		
		return vo2;
	}

	@Override
	public int update(FacManVO vo) {
		log.info("update()...{}", vo);

		int flag = 0;

		if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() == "") {
			flag = sqlSession.update("UPDATE1", vo);			
		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() == "") {
			flag = sqlSession.update("UPDATE2", vo);						
		} else if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() == "") {
			flag = sqlSession.update("UPDATE3", vo);					
		} else if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() != "") {
			flag = sqlSession.update("UPDATE4", vo);					
		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() == "") {
			flag = sqlSession.update("UPDATE5", vo);					
		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() == "" && vo.getCourt_pic3() != "") {
			flag = sqlSession.update("UPDATE6", vo);					
		} else if(vo.getCourt_pic1() == "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() != "") {
			flag = sqlSession.update("UPDATE7", vo);					
		} else if(vo.getCourt_pic1() != "" && vo.getCourt_pic2() != "" && vo.getCourt_pic3() != "") {
			flag = sqlSession.update("UPDATE8", vo);					
		}

		return flag;
	}

	@Override
	public void court_id_insert(FacManVO vo) {
		log.info("court_id_insert()...{}" + vo);
		
		sqlSession.insert("INSERT_COURT_ID", vo);
	}

	

}
