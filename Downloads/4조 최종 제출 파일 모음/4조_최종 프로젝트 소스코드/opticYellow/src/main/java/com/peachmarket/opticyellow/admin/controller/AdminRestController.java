package com.peachmarket.opticyellow.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.admin.model.AdminVO;
import com.peachmarket.opticyellow.admin.service.AdminService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminRestController {
	
	@Autowired
	AdminService service;
	
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/json_memberList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminVO> json_memberList(
			 @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_memberList.do...{}",page);
		
		// 전체 멤버 수
		int listCnt = service.totalMember();
		
		//Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		
		log.info("paging:{}",pagination);
		
		List<AdminVO> vos = service.memberList(pagination);
		log.info("{}",vos);
		
		return vos;
	} // end json_memberList......

	@RequestMapping(value = "/json_m_gameResList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminVO> json_m_gameResList(String m_num
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_m_gameResList.do...");
		
		// 전체 멤버 수
		int listCnt = service.totalGameRes(m_num);
		
		//Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		
		log.info("paging:{}",pagination);
		
		List<AdminVO> vos = service.gameResList(m_num, pagination);
		log.info("{}",vos);
		
		return vos;
	} // end json_m_gameResList......

	@RequestMapping(value = "/json_m_courtResList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminVO> json_m_courtResList(String m_num
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/json_m_courtResList.do...");
		
		// 전체 멤버 수
		int listCnt = service.totalCourtRes(m_num);
		
		//Pagination 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		
		log.info("paging:{}",pagination);
		
		List<AdminVO> vos = service.courtResList(m_num, pagination);
		log.info("{}",vos);
		
		return vos;
	} // end json_m_courtResList......

	@RequestMapping(value = "/json_memberSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminVO> json_memberSearch(String searchKey, String searchWord) {
		log.info("/json_memberSearch.do...");
		log.info("searchKey: {}",searchKey);
		log.info("searchWord: {}",searchWord);
		
		List<AdminVO> vos = service.memberSearch(searchKey,searchWord);
		log.info("{}",vos);
		
		return vos;
	} // end json_memberSearch......
	
}
