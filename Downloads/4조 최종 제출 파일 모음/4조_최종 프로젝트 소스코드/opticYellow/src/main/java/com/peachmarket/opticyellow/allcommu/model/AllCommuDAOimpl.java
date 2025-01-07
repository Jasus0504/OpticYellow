package com.peachmarket.opticyellow.allcommu.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AllCommuDAOimpl implements AllCommuDAO {

	@Autowired
	SqlSession sqlSession;
	
	public AllCommuDAOimpl() {
		log.info("AllCommuDAOimpl...");
	}

	@Override
	public List<AllCommuVO> commuList(PaginationVO pagination) {
		log.info("commuList...{}",pagination);
		return sqlSession.selectList("COMMU_LIST",pagination);
	}

	@Override
	public int commuInsert(AllCommuVO vo) {
		log.info("commuInsert...{}",vo);
		return sqlSession.insert("COMMU_INSERT",vo);
	}

	@Override
	public AllCommuVO commuOne(AllCommuVO vo) {
		log.info("commuOne...{}",vo);
		return sqlSession.selectOne("COMMU_ONE",vo);
	}

	@Override
	public void vcountUp(AllCommuVO vo) {
		log.info("vcountUp...{}",vo);
		sqlSession.update("VCOUNT_UP",vo);
		
	}

	@Override
	public int commuUpdate(AllCommuVO vo) {
		log.info("commuUpdate...{}",vo);
		return sqlSession.update("COMMU_UPDATE",vo);
	}

	@Override
	public int commuDelete(AllCommuVO vo) {
		log.info("commuDelete...{}",vo);
		return sqlSession.delete("COMMU_DELETE",vo);
	}

	@Override
	public List<AllCommuVO> commuSearch(String searchKey, String searchWord) {
		log.info("commuSearch...{},{}",searchKey,searchWord);
		
		List<AllCommuVO> vos = new ArrayList<AllCommuVO>();
		
		if(searchKey.equals("제목")) {
			vos = sqlSession.selectList("COMMU_SEARCH_TITLE", "%"+searchWord+"%");
		} else {
			vos = sqlSession.selectList("COMMU_SEARCH_ID", "%"+searchWord+"%");
		}
		
		return vos;
	}

	@Override
	public AllCommuLikeVO findliker(AllCommuLikeVO vo) {
		log.info("findliker...{}",vo);
		return sqlSession.selectOne("FIND_LIKER", vo);
	}

	@Override
	public int dislikeInsert(AllCommuLikeVO vo) {
		log.info("dislikeInsert...{}",vo);
		return sqlSession.insert("DISLIKE_IN",vo);
	}

	@Override
	public void likesDown(AllCommuLikeVO vo) {
		log.info("likesDown...{}",vo);
		sqlSession.update("LIKES_DOWN",vo);
		
	}

	@Override
	public int dislikeUpdate(AllCommuLikeVO vo2) {
		log.info("dislikeUpdate...{}",vo2);
		return sqlSession.update("DISLIKE_UPD",vo2);
	}

	@Override
	public int likeInsert(AllCommuLikeVO vo) {
		log.info("likeInsert...{}",vo);
		return sqlSession.insert("LIKE_IN",vo);
	}

	@Override
	public void likesUp(AllCommuLikeVO vo) {
		log.info("likesUp...{}",vo);
		sqlSession.update("LIKES_UP",vo);
		
	}

	@Override
	public int likeUpdate(AllCommuLikeVO vo2) {
		log.info("likeUpdate...{}",vo2);
		return sqlSession.update("LIKE_UPD",vo2);
	}

	@Override
	public int totalCommu() {
		log.info("totalCommu...");
		return sqlSession.selectOne("COMMU_TOTAL");
	}


}
