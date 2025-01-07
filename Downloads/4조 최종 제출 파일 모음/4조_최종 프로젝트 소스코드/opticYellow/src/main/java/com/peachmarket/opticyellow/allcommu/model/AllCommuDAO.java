package com.peachmarket.opticyellow.allcommu.model;

import java.util.List;

import com.peachmarket.opticyellow.pagination.PaginationVO;

public interface AllCommuDAO {

	List<AllCommuVO> commuList(PaginationVO pagination);

	int commuInsert(AllCommuVO vo);

	AllCommuVO commuOne(AllCommuVO vo);

	void vcountUp(AllCommuVO vo);

	int commuUpdate(AllCommuVO vo);

	int commuDelete(AllCommuVO vo);

	List<AllCommuVO> commuSearch(String searchKey, String searchWord);

	AllCommuLikeVO findliker(AllCommuLikeVO vo);

	int dislikeInsert(AllCommuLikeVO vo);

	void likesDown(AllCommuLikeVO vo);

	int dislikeUpdate(AllCommuLikeVO vo2);

	int likeInsert(AllCommuLikeVO vo);

	void likesUp(AllCommuLikeVO vo);

	int likeUpdate(AllCommuLikeVO vo2);

	int totalCommu();

}
