package com.peachmarket.opticyellow.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;
import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AdminDAOimpl implements AdminDAO {

	@Autowired
	SqlSession sqlSession;
	
	public AdminDAOimpl() {
		log.info("MemberDAOimpl...");
	}
	
	@Override
	public AdminVO adminPage(AdminVO vo) {
		log.info("adminPage...{}",vo);
		return sqlSession.selectOne("ADMINPAGE_SELECT_ONE",vo);
	}

	@Override
	public List<AdminVO> memberList(PaginationVO pagination) {
		log.info("memberList...{}",pagination);
		return sqlSession.selectList("MEMBER_LIST",pagination);
	}

	@Override
	public List<AdminVO> gameResList(String m_num, PaginationVO pagination) {
		log.info("gameResList...{},{}",m_num,pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("startList", pagination.getStartList());
		map.put("endList", pagination.getEndList());
		
		return sqlSession.selectList("GAME_RES_LIST",map);
	}

	@Override
	public List<AdminVO> courtResList(String m_num, PaginationVO pagination) {
		log.info("courtResList...{},{}",m_num,pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("startList", pagination.getStartList());
		map.put("endList", pagination.getEndList());
		
		return sqlSession.selectList("COURT_RES_LIST",map);
	}

	@Override
	public int memberDel(MemberVO vo) {
		log.info("memberDel...{}",vo);
		return sqlSession.delete("M_DELETE",vo);
	}

	@Override
	public AdminVO memberInfo(AdminVO vo) {
		log.info("memberInfo...{}",vo);
		return sqlSession.selectOne("MEMBER_INFO",vo);
	}

	@Override
	public int memberUpdate(AdminVO vo) {
		log.info("memberUpdate...{}",vo);
		return sqlSession.update("MEMBER_UPDATE",vo);
	}

	@Override
	public List<AdminVO> memberSearch(String searchKey, String searchWord) {
		log.info("memberSearch...{},{}",searchKey,searchWord);
		
		List<AdminVO> vos = new ArrayList<AdminVO>();
		
		if(searchKey.equals("이름")) {
			vos = sqlSession.selectList("MEMBER_SEARCH_NAME", "%"+searchWord+"%");
		} else {
			vos = sqlSession.selectList("MEMBER_SEARCH_ID", "%"+searchWord+"%");
		}
		
		return vos;
	}

	@Override
	public int totalMember() {
		log.info("totalMember...");
		return sqlSession.selectOne("MEMBER_TOTAL");
	}

	@Override
	public int totalGameRes(String m_num) {
		log.info("totalGameRes...{}",m_num);
		return sqlSession.selectOne("JOIN_TOTAL",m_num);
	}

	@Override
	public int totalCourtRes(String m_num) {
		log.info("totalCourtRes...{}",m_num);
		return sqlSession.selectOne("COURT_RES_TOTAL",m_num);
	}

}
