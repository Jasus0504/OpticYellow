package com.peachmarket.opticyellow.allcommu.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.peachmarket.opticyellow.allcommu.model.AllCommuLikeVO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;
import com.peachmarket.opticyellow.allcommu.service.AllCommuService;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AllCommuRestController {
	
	@Autowired
	AllCommuService service;
	
	@Autowired
	ServletContext sContext;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/json_allcommu_List.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AllCommuVO> json_allcommu_List(
			 @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_allcommu_List.do...{}",page);
		
		// 전체 게시글 수
		int listCnt = service.totalCommu();
		
		//Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		
		log.info("paging:{}",pagination);
		
		List<AllCommuVO> vos = service.commuList(pagination);
		
		return vos;
	} // end json_allcommu_List......

	@RequestMapping(value = "/json_commuSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AllCommuVO> json_commuSearch(String searchKey, String searchWord) {
		log.info("/json_commuSearch.do...");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		List<AllCommuVO> vos = service.commuSearch(searchKey,searchWord);
		
		return vos;
	} // end json_commuSearch......

	@RequestMapping(value = "/json_commu_dislike.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_commu_dislike(AllCommuLikeVO vo, Model model) {
		log.info("/json_commu_dislike.do...{}",vo);
		
		String m_id = (String)session.getAttribute("user_id");

		Map<String, String> map = new HashMap<String, String>();
		
		// 로그인하지 않은 경우 > 반송
		if(m_id == null) {
			map.put("result", "Login");
			return map;
		}
		
		vo.setLike_user(m_id);
		
		AllCommuLikeVO vo2 = service.findliker(vo);
		log.info("{}",vo2);
		
		if(vo2 == null) {
			// 한번도 참여하지 않은 사람 == like를 -1로 insert
			int result = service.dislikeInsert(vo);
			
			if(result == 1) {
				service.likesDown(vo);
				log.info("dislikeInsert 성공");
				
				map.put("result", "OK");
				return map;
			} 
		}
		
		// vo2가 있는 경우
		int likes = vo2.getLikes();
		
		if(likes == 1) {
			// 추천했던 사람 == like를 -1로 update
			int result = service.dislikeUpdate(vo2);
			
			if(result == 1) {
				service.likesDown(vo);
				log.info("dislikeUpdate 성공");
				
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
	} // end json_commu_dislike......
	
	@RequestMapping(value = "/json_commu_like.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_commu_like(AllCommuLikeVO vo, Model model) {
		log.info("/json_commu_like.do...{}",vo);
		
		String m_id = (String)session.getAttribute("user_id");
		
		Map<String, String> map = new HashMap<String, String>();
		
		// 로그인하지 않은 경우 > 반송
		if(m_id == null) {
			map.put("result", "Login");
			return map;
		}
		
		vo.setLike_user(m_id);
		
		AllCommuLikeVO vo2 = service.findliker(vo);
		log.info("{}",vo2);
		
		if(vo2 == null) {
			// 한번도 참여하지 않은 사람 == like를 1로 insert
			int result = service.likeInsert(vo);
			
			if(result == 1) {
				service.likesUp(vo);
				log.info("likeInsert 성공");
				
				map.put("result", "OK");
				return map;
			} 
		}
		
		// vo2가 있는 경우
		int likes = vo2.getLikes();
		
		if(likes == -1) {
			// 비추천했던 사람 == like를 1로 update
			int result = service.likeUpdate(vo2);
			
			if(result == 1) {
				service.likesUp(vo);
				log.info("likeUpdate 성공");
				
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
	} // end json_commu_like......
	
	@RequestMapping(value = "/json_commu_imgUp.do", method = RequestMethod.POST)
	@ResponseBody
	public String json_commu_imgUp(@RequestParam("file") MultipartFile file) {
		log.info("/json_commu_imgUp.do...");
	    try {
	        // 업로드된 파일을 저장할 경로 설정
	        String realPath = sContext.getRealPath("resources/uploadimg");
	        
	        // 파일 저장
	        String fileName = file.getOriginalFilename();
	        String filePath = realPath + File.separator + fileName;
	        File f = new File(filePath);
	        file.transferTo(f);
	        
	        // 저장된 이미지의 URL 반환
	        String imageUrl = "resources/uploadimg/" + fileName; // 예시 URL
	        return imageUrl;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }
	} // end json_commu_imgUp......
	
}
