package com.peachmarket.opticyellow.facman.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.peachmarket.opticyellow.common.PaginationVO;
import com.peachmarket.opticyellow.facman.model.FacManVO;
import com.peachmarket.opticyellow.facman.service.FacManService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FacManController {

	@Autowired
	FacManService service;

	@Autowired
	ServletContext sContext;

	// 관리자용 코트 목록 페이지 이동
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/fac_manSelectAll.do", method = RequestMethod.GET)
	public String fac_manSelectAll(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/fac_manSelectAll.do...");

		// 테니스장 목록 개수
		int listCnt = service.facSelectAllCnt();

		// Pagination 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		
		return "fac_manage/fac_manSelectAll";
	}
	
	// 테니스장 검색
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/fac_mansearchList.do", method = RequestMethod.GET)
	public String fac_mansearchList() {
		log.info("fac_mansearchList...");

		return "fac_manage/fac_manSelectAll";
	}

	// 테니스장 정보 삭제
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/fac_deleteOK.do", method = RequestMethod.GET)
	public String fac_deleteOK(FacManVO vo) {
		log.info("fac_deleteOK...{}", vo);

		int result = service.delete(vo);

		if (result == 1) {
			return "redirect:fac_manSelectAll.do";
		} else {
			return "fac_manage/delete_failed";
		}
	}

	// 테니스장 승인
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/fac_confirmOK.do", method = RequestMethod.GET)
	public String fac_confirmOK(FacManVO vo) {
		log.info("fac_confirmOK...{}", vo);

		int result1 = service.confirm(vo);
		service.court_id_insert(vo);

		if (result1 == 1) {
			return "redirect:fac_manSelectAll.do";
		} else {
			return "fac_manage/confirm_failed";
		}
	}

	// 테니스장 상세 정보 페이지에서 승인
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/fac_confirmOKOne.do", method = RequestMethod.GET)
	public String fac_confirmOKOne(FacManVO vo) {
		log.info("fac_confirmOKOne...{}", vo);

		int result1 = service.confirm(vo);
		service.court_id_insert(vo);

		if (result1 == 1) {
			return "redirect:fac_manSelectOne.do?fac_id=" + vo.getFac_id();
		} else {
			return "fac_manage/confirm_failed";
		}
	}

	// 관리자용 테니스장 상세 정보 페이지 이동
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/fac_manSelectOne.do", method = RequestMethod.GET)
	public String fac_manSelectOne(FacManVO vo, Model model) {
		log.info("fac_manSelectOne...{}", vo);

		model.addAttribute("vof", vo);

		return "fac_manage/fac_manSelectOne";
	}

	// 관리자용 테니스장 정보 수정 페이지 이동
	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/fac_update.do", method = RequestMethod.GET)
	public String fac_update(FacManVO vo) {
		log.info("fac_update...{}", vo);

		return "fac_manage/fac_update";
	}

	// 관리자용 테니스장 정보 수정
	@RequestMapping(value = "/fac_updateOK.do", method = RequestMethod.POST)
	public String fac_updateOK(FacManVO vo) throws IllegalStateException, IOException {
		log.info("fac_updateOK...{}", vo);

		// 테니스장 사진1 처리
		String getOriginalFilename1 = vo.getMultipartFile1().getOriginalFilename();
		int fileNameLength1 = vo.getMultipartFile1().getOriginalFilename().length();
		log.info("getOriginalFilename1 : {}", getOriginalFilename1);
		log.info("fileNameLength1 : {}", fileNameLength1);

		if (getOriginalFilename1.length() == 0) {
			vo.setCourt_pic1("");
		} else {
			vo.setCourt_pic1(getOriginalFilename1);
			String realPath = sContext.getRealPath("resources/images/court_image");
			log.info("realPath : {}", realPath);

			File f1 = new File(realPath + File.separator + vo.getCourt_pic1());
			vo.getMultipartFile1().transferTo(f1);

		} // end else

		// 테니스장 사진2 처리
		String getOriginalFilename2 = vo.getMultipartFile2().getOriginalFilename();
		int fileNameLength2 = vo.getMultipartFile2().getOriginalFilename().length();
		log.info("getOriginalFilename2 : {}", getOriginalFilename2);
		log.info("fileNameLength2 : {}", fileNameLength2);

		if (getOriginalFilename2.length() == 0) {
			vo.setCourt_pic2("");
		} else {
			vo.setCourt_pic2(getOriginalFilename2);
			String realPath = sContext.getRealPath("resources/images/court_image");

			File f2 = new File(realPath + File.separator + vo.getCourt_pic2());
			vo.getMultipartFile2().transferTo(f2);

		} // end else

		// 테니스장 사진3 처리
		String getOriginalFilename3 = vo.getMultipartFile3().getOriginalFilename();
		int fileNameLength3 = vo.getMultipartFile3().getOriginalFilename().length();
		log.info("getOriginalFilename3 : {}", getOriginalFilename3);
		log.info("fileNameLength3 : {}", fileNameLength3);

		if (getOriginalFilename3.length() == 0) {
			vo.setCourt_pic3("");
		} else {
			vo.setCourt_pic3(getOriginalFilename3);
			String realPath = sContext.getRealPath("resources/images/court_image");

			File f3 = new File(realPath + File.separator + vo.getCourt_pic3());
			vo.getMultipartFile3().transferTo(f3);

		} // end else

		if (vo.getConv() == null) {
			vo.setConv("");
		}

		int result = service.update(vo);
		log.info("result : {}", result);

		if (result == 1)
			return "fac_manage/update_success";
		else
			return "redirect:fac_update.do?fac_id=" + vo.getFac_id();
	}
}
