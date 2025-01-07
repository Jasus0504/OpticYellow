package com.peachmarket.opticyellow.allcmt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.allcmt.model.AllCmtLikeVO;
import com.peachmarket.opticyellow.allcmt.model.AllCmtVO;
import com.peachmarket.opticyellow.allcmt.service.AllCmtService;
import com.peachmarket.opticyellow.allcommu.model.AllCommuLikeVO;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AllCmtRestController {
	
	@Autowired
	AllCmtService service;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/json_cmt_insertOK.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_cmt_insertOK(AllCmtVO vo) {
		log.info("/json_cmt_insertOK.do...{}",vo);
		
		Map<String, String> map = new HashMap<String, String>();
		
		String cmt_id = vo.getCmt_id();
		log.info("{}",cmt_id);		
		if(cmt_id == "") {
			log.info("{}",cmt_id);		
			map.put("result", "login");
			return map;
		}
		
		int result = service.cmtInsertOK(vo);
		
		if(result==1) {
			map.put("result", "OK");
			
			// 댓글수 카운트업
			service.cmtCount(vo);
			
		} else {
			map.put("result", "NotOK");
		}
		
		return map;
	} // end json_cmt_insertOK......

	@RequestMapping(value = "/json_cmtList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AllCmtVO> json_cmtList(AllCmtVO vo
			, @RequestParam(required = false, defaultValue = "1") int page) {
		log.info("/json_cmtList.do...{}",vo);
		
		int startList = 0;
		int endList = 0;
		
		// 댓글 시작번호 ex) 1, 6, 11, 16 ...
		if (page == 1) {
			startList = 1;
			endList = startList + 4;
		} else {
			startList = (5 * (page - 1)) + 1;
			endList = startList + 4;
		}		
		
		log.info("startList,endList:{},{}",startList,endList);
		
		vo.setStartList(startList);
		vo.setEndList(endList);
		
		List<AllCmtVO> vos = service.cmtList(vo);
		
		return vos;
	} // end json_cmtList......

	@RequestMapping(value = "/json_cmtUpdateOK.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_cmtUpdateOK(AllCmtVO vo) {
		log.info("/json_cmtUpdateOK.do...{}",vo);
		
		int result = service.cmtUpdateOK(vo);
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(result==1) {
			map.put("result", "OK");
		} else {
			map.put("result", "NotOK");
		}
		
		return map;
	} // end json_cmtUpdateOK......

	@RequestMapping(value = "/json_cmtDeleteOK.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_cmtDeleteOK(AllCmtVO vo) {
		log.info("/json_cmtDeleteOK.do...{}",vo);
		
		int result = service.cmtDeleteOK(vo);
		service.comm_cmt_Update(vo);
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(result==1) {
			map.put("result", "OK");
		} else {
			map.put("result", "NotOK");
		}
		
		return map;
	} // end json_cmtDeleteOK......

	@RequestMapping(value = "/json_cmt_dislike.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_cmt_dislike(AllCmtLikeVO vo, Model model) {
		log.info("/json_cmt_dislike.do...{}",vo);
		
		String m_id = (String)session.getAttribute("user_id");

		Map<String, String> map = new HashMap<String, String>();
		
		// 로그인하지 않은 경우 > 반송
		if(m_id == null) {
			map.put("result", "Login");
			return map;
		}
		
		vo.setLike_user(m_id);
		
		AllCmtLikeVO vo2 = service.find_cmtliker(vo);
		log.info("{}",vo2);
		
		if(vo2 == null) {
			// 한번도 참여하지 않은 사람 == like를 -1로 insert
			int result = service.cmt_dislikeInsert(vo);
			log.info("{}",result);
			
			if(result == 1) {
				service.cmt_likesDown(vo);
				
				map.put("result", "OK");
				return map;
			} 
		}
		
		// vo2가 있는 경우
		int likes = vo2.getLikes();
		
		if(likes == 1) {
			// 추천했던 사람 == like를 -1로 update
			int result = service.cmt_dislikeUpdate(vo2);
			
			if(result == 1) {
				service.cmt_likesDown(vo);
				
				map.put("result", "OK");
				return map;
			} 
		} else if(likes == -1) {
			// 이미 비추에 참여한 사람 == 불가능
			map.put("result", "NotOK");
			return map;
		}
		
		map.put("result", "Error");
		return map;
	} // end json_cmt_dislike......
	
	@RequestMapping(value = "/json_cmt_like.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_cmt_like(AllCmtLikeVO vo, Model model) {
		log.info("/json_cmt_like.do...{}",vo);
		
		String m_id = (String)session.getAttribute("user_id");
		
		Map<String, String> map = new HashMap<String, String>();
		
		// 로그인하지 않은 경우 > 반송
		if(m_id == null) {
			map.put("result", "Login");
			return map;
		}
		
		vo.setLike_user(m_id);
		
		AllCmtLikeVO vo2 = service.find_cmtliker(vo);
		log.info("{}",vo2);
		
		if(vo2 == null) {
			// 한번도 참여하지 않은 사람 == like를 1로 insert
			int result = service.cmt_likeInsert(vo);
			
			if(result == 1) {
				service.cmt_likesUp(vo);
				
				map.put("result", "OK");
				return map;
			} 
		}
		
		// vo2가 있는 경우
		int likes = vo2.getLikes();
		
		if(likes == -1) {
			// 비추천했던 사람 == like를 1로 update
			int result = service.cmt_likeUpdate(vo2);
			
			if(result == 1) {
				service.cmt_likesUp(vo);
				
				map.put("result", "OK");
				return map;
			} 
		} else if(likes == 1) {
			// 이미 추천에 참여한 사람 == 불가능
			map.put("result", "NotOK");
			return map;
		}
		
		map.put("result", "Error");
		return map;
	} // end json_cmt_like......
	
}
