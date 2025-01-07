package com.peachmarket.opticyellow.allcommu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.allcmt.model.AllCmtVO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuDAO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuLikeVO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Service
public class AllCommuService {

	@Autowired
	AllCommuDAO dao;
	
	public List<AllCommuVO> commuList(PaginationVO pagination) {
		return dao.commuList(pagination);
	}

	public int commuInsert(AllCommuVO vo) {
		return dao.commuInsert(vo);
	}

	public AllCommuVO commuOne(AllCommuVO vo) {
		return dao.commuOne(vo);
	}

	public void vcountUp(AllCommuVO vo) {
		dao.vcountUp(vo);
	}

	public int commuUpdate(AllCommuVO vo) {
		return dao.commuUpdate(vo);
	}

	public int commuDelete(AllCommuVO vo) {
		return dao.commuDelete(vo);
	}

	public List<AllCommuVO> commuSearch(String searchKey, String searchWord) {
		return dao.commuSearch(searchKey,searchWord);
	}

	public AllCommuLikeVO findliker(AllCommuLikeVO vo) {
		return dao.findliker(vo);
	}

	public int dislikeInsert(AllCommuLikeVO vo) {
		return dao.dislikeInsert(vo);
	}

	public void likesDown(AllCommuLikeVO vo) {
		dao.likesDown(vo);
		
	}

	public int dislikeUpdate(AllCommuLikeVO vo2) {
		return dao.dislikeUpdate(vo2);
	}

	public int likeInsert(AllCommuLikeVO vo) {
		return dao.likeInsert(vo);
	}

	public void likesUp(AllCommuLikeVO vo) {
		dao.likesUp(vo);
		
	}

	public int likeUpdate(AllCommuLikeVO vo2) {
		return dao.likeUpdate(vo2);
	}

	public int totalCommu() {
		return dao.totalCommu();
	}

}
