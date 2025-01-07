package com.peachmarket.opticyellow.allcmt.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AllCmtDAOimpl implements AllCmtDAO {

	@Autowired
	SqlSession sqlSession;
	
	public AllCmtDAOimpl() {
		log.info("AllCmtDAOimpl...");
	}

	@Override
	public int cmtInsertOK(AllCmtVO vo) {
		log.info("cmtInsertOK...{}",vo);
		return sqlSession.insert("CMT_INSERT",vo);
	}

	@Override
	public List<AllCmtVO> cmtList(AllCmtVO vo) {
		log.info("cmtList...{}",vo);
		return sqlSession.selectList("CMT_LIST",vo);
	}

	@Override
	public int cmtUpdateOK(AllCmtVO vo) {
		log.info("cmtUpdateOK...{}",vo);
		return sqlSession.update("CMT_UPDATE",vo);
	}

	@Override
	public int cmtDeleteOK(AllCmtVO vo) {
		log.info("cmtDeleteOK...{}",vo);
		return sqlSession.delete("CMT_DELETE",vo);
	}

	@Override
	public void cmtCount(AllCmtVO vo) {
		log.info("cmtCount...{}",vo);
		sqlSession.update("CMT_COUNT",vo);
		
	}

	@Override
	public AllCmtLikeVO find_cmtliker(AllCmtLikeVO vo) {
		log.info("find_cmtliker...{}",vo);
		return sqlSession.selectOne("FIND_CMT_LIKER",vo);
	}

	@Override
	public int cmt_dislikeInsert(AllCmtLikeVO vo) {
		log.info("cmt_dislikeInsert...{}",vo);
		return sqlSession.insert("CMT_DISLIKE_IN",vo);
	}

	@Override
	public void cmt_likesDown(AllCmtLikeVO vo) {
		log.info("cmt_likesDown...{}",vo);
		sqlSession.update("CMT_LIKES_DOWN",vo);
	}

	@Override
	public int cmt_dislikeUpdate(AllCmtLikeVO vo2) {
		log.info("cmt_dislikeUpdate...{}",vo2);
		return sqlSession.update("CMT_DISLIKE_UPD",vo2);
	}

	@Override
	public int cmt_likeInsert(AllCmtLikeVO vo) {
		log.info("cmt_likeInsert...{}",vo);
		return sqlSession.insert("CMT_LIKE_IN",vo);
	}

	@Override
	public void cmt_likesUp(AllCmtLikeVO vo) {
		log.info("cmt_likesUp...{}",vo);
		sqlSession.update("CMT_LIKES_UP",vo);
	}

	@Override
	public int cmt_likeUpdate(AllCmtLikeVO vo2) {
		log.info("cmt_likeUpdate...{}",vo2);
		return sqlSession.update("CMT_LIKE_UPD",vo2);
	}

	@Override
	public void comm_cmt_Update(AllCmtVO vo) {
		log.info("comm_cmt_Update...{}",vo);
		sqlSession.update("COMM_CMT_UPD",vo);
		
	}

	@Override
	public int totalCmt(AllCommuVO vo) {
		log.info("totalCmt...{}",vo);
		return sqlSession.selectOne("CMT_TOTAL",vo);
	}


}
