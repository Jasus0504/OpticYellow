package com.peachmarket.opticyellow.allcmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.allcmt.model.AllCmtDAO;
import com.peachmarket.opticyellow.allcmt.model.AllCmtLikeVO;
import com.peachmarket.opticyellow.allcmt.model.AllCmtVO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuDAO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;

import lombok.extern.slf4j.Slf4j;

@Service
public class AllCmtService {

	@Autowired
	AllCmtDAO dao;
	
	public int cmtInsertOK(AllCmtVO vo) {
		return dao.cmtInsertOK(vo);
	}

	public List<AllCmtVO> cmtList(AllCmtVO vo) {
		return dao.cmtList(vo);
	}

	public int cmtUpdateOK(AllCmtVO vo) {
		return dao.cmtUpdateOK(vo);
	}

	public int cmtDeleteOK(AllCmtVO vo) {
		return dao.cmtDeleteOK(vo);
	}

	public void cmtCount(AllCmtVO vo) {
		dao.cmtCount(vo);
		
	}

	public AllCmtLikeVO find_cmtliker(AllCmtLikeVO vo) {
		return dao.find_cmtliker(vo);
	}

	public int cmt_dislikeInsert(AllCmtLikeVO vo) {
		return dao.cmt_dislikeInsert(vo);
	}

	public void cmt_likesDown(AllCmtLikeVO vo) {
		dao.cmt_likesDown(vo);
	}

	public int cmt_dislikeUpdate(AllCmtLikeVO vo2) {
		return dao.cmt_dislikeUpdate(vo2);
	}

	public int cmt_likeInsert(AllCmtLikeVO vo) {
		return dao.cmt_likeInsert(vo);
	}

	public void cmt_likesUp(AllCmtLikeVO vo) {
		dao.cmt_likesUp(vo);
	}

	public int cmt_likeUpdate(AllCmtLikeVO vo2) {
		return dao.cmt_likeUpdate(vo2);
	}

	public void comm_cmt_Update(AllCmtVO vo) {
		dao.comm_cmt_Update(vo);
		
	}

	public int totalCmt(AllCommuVO vo) {
		return dao.totalCmt(vo);
	}
	
}
