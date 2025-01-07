package com.peachmarket.opticyellow.friend.model;

import java.util.List;

import com.peachmarket.opticyellow.pagination.PaginationVO;

public interface FriendDAO {

	List<FriendVO> friendList(String to_user_id, PaginationVO pagination);

	List<FriendVO> friendListSort(String sortKey, String to_user_id, PaginationVO pagination);

	int FriendListCnt(String to_user_id);

	List<FriendVO> friendSearch(String searchKey, String searchWord, String to_user_id);

	List<FriendVO> searchAll(String to_user_id, PaginationVO pagination);

	int FriendMemberCnt(String to_user_id);

	List<FriendVO> friendState(String m_user_id, PaginationVO pagination);

	int friendStateCnt(String m_user_id);

	void stateAgree(FriendVO vo);

	void stateReject(FriendVO vo);

	void addFriend(FriendVO vo);

	void friendRequest(FriendVO vo);

	List<FriendVO> friendRandom(FriendVO vo);

	List<FriendVO> friendGame(String to_user_id, PaginationVO pagination);

	public int FriendGameCnt(String to_user_id);

	void friendRemove(FriendVO vo);

	void friendRemoveMe(FriendVO vo);

}
