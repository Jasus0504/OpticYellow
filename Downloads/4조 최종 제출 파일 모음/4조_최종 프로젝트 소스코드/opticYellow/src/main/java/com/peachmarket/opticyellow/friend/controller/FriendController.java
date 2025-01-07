package com.peachmarket.opticyellow.friend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.friend.model.FriendVO;
import com.peachmarket.opticyellow.friend.service.FriendService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FriendController {

	@Autowired
	FriendService service;

	@Autowired
	HttpSession session;

	// 친구 목록
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_list.do", method = RequestMethod.GET)
	public String friend_list(Model model, FriendVO vo, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/friend_list.do...{}", vo);

		String to_user_id = (String) session.getAttribute("user_id");
		// 친구 목록 개수
		int listCnt = service.FriendListCnt(to_user_id);

		// Pagination 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);

		return "member/friend/friend_list";

	}

	// 회원 검색
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_search.do", method = RequestMethod.GET)
	public String friend_search(Model model, FriendVO vo, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/friend_search.do...{},{}", vo, page);

		String to_user_id = (String) session.getAttribute("user_id");
		// 친구 목록 개수
		int listCnt = service.FriendMemberCnt(to_user_id);

		// Pagination 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);

		return "member/friend/friend_search";

	}

	// 친구 신청
	@ResponseBody
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_request.do", method = RequestMethod.GET)
	public String friend_request(Model model, FriendVO vo) {
		log.info("/friend_request.do...{}", vo);

		service.friendRequest(vo);

		return "{\"result\":\"successed\"}";
	}

	// 친구 신청 현황
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_state.do", method = RequestMethod.GET)
	public String friend_state(Model model, FriendVO vo, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_friend_state.do... {}", vo);

		String m_user_id = (String) session.getAttribute("user_id");

		// 친구 신청 현황 목록 개수
		int listCnt = service.friendStateCnt(m_user_id);

		// Pagination 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		log.info("paging:{}", pagination);
		return "member/friend/friend_state";

	}

	// 친구 신청 온 것 수락
	@ResponseBody
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_state_agree.do", method = RequestMethod.GET)
	public String friend_state_agree(Model model, FriendVO vo) {
		log.info("/friend_state_agree.do...{}", vo);

		// 친구 신청 수락 처리
		service.stateAgree(vo);

		// 신청받은 사람의 목록에도 추가
		service.addFriend(vo);

		return "{\"result\":\"successed\"}";// {"result":"successed"}
	}

	// 친구 신청 온 것 거절
	@ResponseBody
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_state_reject.do", method = RequestMethod.GET)
	public String friend_state_reject(Model model, FriendVO vo) {
		log.info("/friend_state_reject.do...{}", vo);

		service.stateReject(vo);

		return "{\"result\":\"successed\"}";
	}

	// 친구 추천 랜덤
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_random_list.do", method = RequestMethod.GET)
	public String friend_random_list(Model model, FriendVO vo) {
		log.info("/friend_random_list.do...{}", vo);

		return "member/friend/friend_random";

	}

	// 친구가 신청한 매치 목록
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_game_list.do", method = RequestMethod.GET)
	public String friend_game_list(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/friend_game_list.do...");

		String to_user_id = (String) session.getAttribute("user_id");
		// 전체 게시글 개수
		int listCnt = service.FriendGameCnt(to_user_id);

		// Pagination 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);

		return "member/friend/friend_game";

	}

	// 친구 취소
	@ResponseBody
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_remove.do", method = RequestMethod.GET)
	public String friend_remove(Model model, FriendVO vo) {
		log.info("/friend_remove.do...{}", vo);

		service.friendRemoveMe(vo);
		service.friendRemove(vo);

		return "{\"result\":\"successed\"}";
	}

}
