package com.peachmarket.opticyellow.friend.controller;

import java.util.List;

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
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FriendRestController {

	@Autowired
	FriendService service;

	@Autowired
	HttpSession session;

	// 친구 목록
	@RequestMapping(value = "/json_friend_list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FriendVO> json_friend_sort_list(Model model, FriendVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_friend_sort_list.do... {}", vo);

		String to_user_id = (String) session.getAttribute("user_id");
		int listCnt = service.FriendGameCnt(to_user_id);
		// Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);

		log.info("paging:{}", pagination);

		List<FriendVO> vos = service.friendList(to_user_id, pagination);
		log.info("{}", vos);

		return vos;
	}

	// 친구 목록 정렬
	@RequestMapping(value = "/json_friend_list_sort.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FriendVO> json_friend_list_sort(Model model, FriendVO vo, String sortKey,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_friend_sort_list.do... {}", vo);
		log.info("sortKey : {}", sortKey);

		String to_user_id = (String) session.getAttribute("user_id");
		int listCnt = service.FriendGameCnt(to_user_id);
		// Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);

		log.info("paging:{}", pagination);

		List<FriendVO> vos = service.friendListSort(sortKey, to_user_id, pagination);
		log.info("{}", vos);

		return vos;
	}

	// 회원 검색 전체 목록
	@RequestMapping(value = "/json_friend_search_all.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FriendVO> json_friend_search_all(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_friend_search_all.do... {},{}", page, range);
		String to_user_id = (String) session.getAttribute("user_id");

		int listCnt = service.FriendMemberCnt(to_user_id);
		// Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);

		log.info("paging:{}", pagination);
		log.info("listCnt:{}", listCnt);
		List<FriendVO> vos = service.searchAll(to_user_id, pagination);
		log.info("{}", vos);

		return vos;
	}

	// 회원 검색 목록
	@RequestMapping(value = "/json_friend_search_list.do", method = RequestMethod.POST)
	@ResponseBody
	public List<FriendVO> json_friend_search_list(String searchKey, String searchWord) {
		log.info("/json_friend_search_list.do... ");
		log.info("searchKey : {}", searchKey);
		log.info("searchWord : {}", searchWord);

		String to_user_id = (String) session.getAttribute("user_id");

		List<FriendVO> vos = service.friendSearch(searchKey, searchWord, to_user_id);
		log.info("{}", vos);

		return vos;
	}

	// 친구 신청 현황 목록
	@RequestMapping(value = "/json_friend_state.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FriendVO> json_friend_state(Model model, FriendVO vo,
			@RequestParam(required = false, defaultValue = "1") int page,
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

		List<FriendVO> vos = service.friendState(m_user_id, pagination);
		log.info("{}", vos);

		return vos;
	}

	// 친구 추천 랜덤 목록
	@RequestMapping(value = "/json_friend_random_list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FriendVO> json_friend_random_list(FriendVO vo) {
		log.info("/json_friend_random_list.do... {}", vo);
		List<FriendVO> vos = service.friendRandom(vo);
		log.info("{}", vos);

		return vos;
	}

	// 친구가 신청한 매치 목록
	@RequestMapping(value = "/json_friend_game_list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<FriendVO> json_friend_game_list(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_friend_game_list.do... {}", page);
		String to_user_id = (String) session.getAttribute("user_id");
		int listCnt = service.FriendGameCnt(to_user_id);

		// Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		log.info("paging:{}", pagination);

		List<FriendVO> vos = service.friendGame(to_user_id, pagination);

		log.info("{}", vos);

		return vos;
	}

}
