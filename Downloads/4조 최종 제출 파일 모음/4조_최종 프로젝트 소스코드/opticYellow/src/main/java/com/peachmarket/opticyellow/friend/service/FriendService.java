package com.peachmarket.opticyellow.friend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.friend.model.FriendDAO;
import com.peachmarket.opticyellow.friend.model.FriendVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FriendService {

	@Autowired
	FriendDAO dao;

	public List<FriendVO> friendList(String to_user_id, PaginationVO pagination) {
		return dao.friendList(to_user_id, pagination);
	}

	public int FriendListCnt(String to_user_id) {
		return dao.FriendListCnt(to_user_id);
	}

	public List<FriendVO> friendListSort(String sortKey, String to_user_id, PaginationVO pagination) {
		return dao.friendListSort(sortKey, to_user_id, pagination);
	}

	public List<FriendVO> searchAll(String to_user_id, PaginationVO pagination) {
		return dao.searchAll(to_user_id, pagination);
	}

	public int FriendMemberCnt(String to_user_id) {
		return dao.FriendMemberCnt(to_user_id);
	}

	public List<FriendVO> friendSearch(String searchKey, String searchWord, String to_user_id) {
		return dao.friendSearch(searchKey, searchWord, to_user_id);
	}

	public List<FriendVO> friendState(String m_user_id, PaginationVO pagination) {
		return dao.friendState(m_user_id, pagination);
	}

	public int friendStateCnt(String m_user_id) {
		return dao.friendStateCnt(m_user_id);
	}

	public void stateAgree(FriendVO vo) {
		dao.stateAgree(vo);
	}

	public void stateReject(FriendVO vo) {
		dao.stateReject(vo);
	}

	public void addFriend(FriendVO vo) {
		dao.addFriend(vo);

	}

	public void friendRequest(FriendVO vo) {
		dao.friendRequest(vo);

	}

	public List<FriendVO> friendRandom(FriendVO vo) {
		return dao.friendRandom(vo);
	}

	public List<FriendVO> friendGame(String to_user_id, PaginationVO pagination) {
		return dao.friendGame(to_user_id, pagination);
	}

	public int FriendGameCnt(String to_user_id) {
		return dao.FriendGameCnt(to_user_id);
	}

	public void friendRemove(FriendVO vo) {
		dao.friendRemove(vo);
	}

	public void friendRemoveMe(FriendVO vo) {
		dao.friendRemoveMe(vo);
	}

}
