package com.peachmarket.opticyellow.allcmt.model;

import java.util.List;

import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;

public interface AllCmtDAO {

	int cmtInsertOK(AllCmtVO vo);

	List<AllCmtVO> cmtList(AllCmtVO vo);

	int cmtUpdateOK(AllCmtVO vo);

	int cmtDeleteOK(AllCmtVO vo);

	void cmtCount(AllCmtVO vo);

	AllCmtLikeVO find_cmtliker(AllCmtLikeVO vo);

	int cmt_dislikeInsert(AllCmtLikeVO vo);

	void cmt_likesDown(AllCmtLikeVO vo);

	int cmt_dislikeUpdate(AllCmtLikeVO vo2);

	int cmt_likeInsert(AllCmtLikeVO vo);

	void cmt_likesUp(AllCmtLikeVO vo);

	int cmt_likeUpdate(AllCmtLikeVO vo2);

	void comm_cmt_Update(AllCmtVO vo);

	int totalCmt(AllCommuVO vo);

}
