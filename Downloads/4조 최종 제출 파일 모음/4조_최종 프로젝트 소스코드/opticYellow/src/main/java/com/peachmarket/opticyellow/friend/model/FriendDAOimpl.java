
package com.peachmarket.opticyellow.friend.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FriendDAOimpl implements FriendDAO {

	@Autowired
	SqlSession sqlSession;

	public FriendDAOimpl() {
		log.info("FriendDAOimpl...");
	}

	// 친구목록
	@Override
	public List<FriendVO> friendList(String to_user_id, PaginationVO pagination) {
		log.info("friendList...{},{}", to_user_id, pagination);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("to_user_id", to_user_id);
		paramMap.put("startList", pagination.getStartList());
		paramMap.put("endList", pagination.getEndList());

		return sqlSession.selectList("FRIEND_LIST", paramMap);
	}

	// 친구목록 count
	@Override
	public int FriendListCnt(String to_user_id) {
		log.info("FriendListCnt...{}", to_user_id);

		return sqlSession.selectOne("FRIEND_LIST_COUNT", to_user_id);
	}

	// 친구목록정렬
	@Override
	public List<FriendVO> friendListSort(String sortKey, String to_user_id, PaginationVO pagination) {
		log.info("searchList()...");
		log.info("sortKey : " + sortKey);
		log.info("to_user_id : " + to_user_id);

		List<FriendVO> vos = null;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("to_user_id", to_user_id);
		paramMap.put("sortKey", sortKey);
		paramMap.put("startList", pagination.getStartList());
		paramMap.put("endList", pagination.getEndList());

		return sqlSession.selectList("FRIEND_LIST_SORT", paramMap);
	}

	// 회원 검색 전체 목록
	@Override
	public List<FriendVO> searchAll(String to_user_id, PaginationVO pagination) {
		log.info("searchAll...{},{}", to_user_id, pagination);
		
		FriendVO vo = new FriendVO();
		
		log.info("searchAll...{}", vo);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("to_user_id", to_user_id);
		paramMap.put("startList", pagination.getStartList());
		paramMap.put("endList", pagination.getEndList());

		return sqlSession.selectList("FRIEND_MEMBER_LIST", paramMap);
	}

	// 회원 검색 전체 목록 count
	@Override
	public int FriendMemberCnt(String to_user_id) {
		log.info("FriendMemberCnt...{}", to_user_id);

		return sqlSession.selectOne("FRIEND_MEMBER_COUNT", to_user_id);
	}

	// 회원 검색
	@Override
	public List<FriendVO> friendSearch(String searchKey, String searchWord, String to_user_id) {
		log.info("searchList()...");
		log.info("searchKey : " + searchKey);
		log.info("searchWord : " + searchWord);
		log.info("to_user_id : " + to_user_id);

		List<FriendVO> vos = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("to_user_id", to_user_id);
		map.put("searchWord", "%" + searchWord + "%");

		if (searchKey.equals("name")) {
			vos = sqlSession.selectList("M_SEARCH_NAME", map);
		} else if (searchKey.equals("id")) {
			vos = sqlSession.selectList("M_SEARCH_ID", map);
		} else {
			vos = sqlSession.selectList("M_SEARCH_NTRP", map);
		}
		return vos;
	}

	// 친구 신청 현황
	@Override
	public List<FriendVO> friendState(String m_user_id, PaginationVO pagination) {
		log.info("friendState...{},{}", m_user_id, pagination);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("m_user_id", m_user_id);
		paramMap.put("startList", pagination.getStartList());
		paramMap.put("endList", pagination.getEndList());
		return sqlSession.selectList("FRIEND_STATE", paramMap);
	}

	// 친구 신청 현황 count
	@Override
	public int friendStateCnt(String m_user_id) {
		log.info("friendStateCnt...{}", m_user_id);

		return sqlSession.selectOne("FRIEND_STATE_COUNT", m_user_id);
	}

	// 친구 신청 수락
	@Override
	public void stateAgree(FriendVO vo) {
		log.info("stateAgree...{}", vo);

		sqlSession.update("FRIEND_STATE_AGREE", vo);
	}

	// 친구 신청 거절
	@Override
	public void stateReject(FriendVO vo) {
		log.info("stateReject...{}", vo);

		sqlSession.delete("FRIEND_STATE_REJECT", vo);
	}

	// 친구 추가
	@Override
	public void addFriend(FriendVO vo) {
		log.info("addFriend...{}", vo);

		sqlSession.insert("FRIEND_ADDFRIEND", vo);
	}

	// 친구 신청
	@Override
	public void friendRequest(FriendVO vo) {
		log.info("friendRequest...{}", vo);

		sqlSession.insert("FRIEND_REQUEST", vo);
	}

	// 친구 추천 램덤
	@Override
	public List<FriendVO> friendRandom(FriendVO vo) {
		log.info("friendRandom...{},{}", vo);

		return sqlSession.selectList("FRIEND_RANDOM", vo);
	}

	// 친구가 신청한 매치
	@Override
	public List<FriendVO> friendGame(String to_user_id, PaginationVO pagination) {
		log.info("friendGame...{},{}", to_user_id, pagination);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("to_user_id", to_user_id);
		paramMap.put("startList", pagination.getStartList());
		paramMap.put("endList", pagination.getEndList());

		return sqlSession.selectList("FRIEND_GAME", paramMap);
	}

	// 친구가 신청한 매치 count
	@Override
	public int FriendGameCnt(String to_user_id) {

		log.info("FriendGameCnt...{}", to_user_id);

		return sqlSession.selectOne("FRIEND_GAME_COUNT", to_user_id);
	}
	
	//친구 취소 (친구)
	@Override
	public void friendRemove(FriendVO vo) {
		log.info("friendRemove...{}", vo);

		sqlSession.delete("FRIEND_REMOVE_YOU", vo);
	}

	//친구 취소 (나)
	@Override
	public void friendRemoveMe(FriendVO vo) {
		log.info("friendRemoveMe...{}", vo);

		sqlSession.delete("FRIEND_REMOVE_ME", vo);
	}

}
