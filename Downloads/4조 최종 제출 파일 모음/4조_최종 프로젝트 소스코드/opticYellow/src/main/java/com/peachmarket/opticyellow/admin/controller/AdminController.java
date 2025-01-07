package com.peachmarket.opticyellow.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.peachmarket.opticyellow.admin.model.AdminVO;
import com.peachmarket.opticyellow.admin.service.AdminService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {

	@Autowired
	AdminService service;

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext sContext;

	// 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;

	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/adminPage.do", method = RequestMethod.GET)
	public String adminPage(Model model) {
		log.info("/adminPage.do...");

		AdminVO vo = new AdminVO();

		vo.setM_id((String) session.getAttribute("user_id"));

		AdminVO vo2 = service.adminPage(vo);
		log.info("{}", vo2);
		model.addAttribute("vo2", vo2);

		return "admin/adminPage";
	} // end adminPage

	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/memberList.do", method = RequestMethod.GET)
	public String memberList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/memberList.do...");
		
		//전체 게시글 개수
		int listCnt = service.totalMember();

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		
		return "admin/memberList";
		
	} // end memberList

	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/memberUpdate.do", method = RequestMethod.GET)
	public String memberUpdate(AdminVO vo, Model model) {
		log.info("/memberUpdate.do...{}", vo);

		AdminVO vo2 = service.memberInfo(vo);
		log.info("{}", vo2);

		String region = "";
		String subRegion = "";

		String arr[] = vo2.getM_location().split(" ");

		if (arr.length == 2) {
			region = arr[0];
			subRegion = arr[1];
		} else {
			region = arr[0];
		}

		model.addAttribute("vo2", vo2);
		// 선호지역 나눠서 전달
		model.addAttribute("region", region);
		model.addAttribute("subRegion", subRegion);

		return "admin/memberUpdate";
	} // end memberUpdate

	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/mem_updateOK.do", method = RequestMethod.POST)
	public String mem_updateOK(AdminVO vo, Model model) throws IllegalStateException, IOException {
		log.info("/memberUpdate.do...{}", vo);

		// 1.file 저장 과정
		// 업로드된 file 이름 확인
		String getOriginalFilename = vo.getMultipartFile().getOriginalFilename();
		int fileNameLength = getOriginalFilename.length();
		log.info("getOriginalFilename: {}", getOriginalFilename);
		log.info("fileNameLength: {}", fileNameLength);

		// 업로드 파일 있을 경우와 없을 경우
		if (fileNameLength == 0) {
			vo.setM_img(vo.getM_img());
		} else {
			vo.setM_img(getOriginalFilename);

			// 웹 어플리케이션이 갖는 실제 경로 : 이미지를 업로드하면 저장되는 실제경로 realPath 로그 찍기
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath: {}", realPath);

			// realPath에 파일 저장
			File f = new File(realPath + File.separator + vo.getM_img());
			// 업로드된 이미지를 경로에 갖다 넣어줌 (throws exception 처리해줌 >> 코드 간결 위해 서버에 예외처리 넘김)
			vo.getMultipartFile().transferTo(f);
		}
		log.info("{}", vo);

		// INSERT
		int result = service.memberUpdate(vo);
		log.info("result:{}", result);

		if (result == 1) {
			String msg = "회원정보를 수정했습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/memberList.do");

			return "alert";
		} else {
			String msg = "입력하신 정보를 다시 확인해 주세요!";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/memberUpdate.do?" + vo.getM_num());

			return "alert";
		}

	} // end mem_updateOK......

	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.GET)
	public String memberDelete(MemberVO vo, Model model) {
		log.info("/memberDelete.do...");

		int result = service.memberDel(vo);

		if (result == 1) {
			String msg = "삭제되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/memberList.do");
			return "alert";
		}

		String msg = "시스템 에러입니다.";
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/memberList.do");
		return "alert";
	} // end memberUpdate

	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/memberJoinList.do", method = RequestMethod.GET)
	public String memberJoinList(Model model, HttpServletRequest request
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/memberJoinList.do...");
		
		String m_num = request.getParameter("m_num");
		
		//전체 예약 개수
		int listCnt = service.totalGameRes(m_num);

		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);		
		
		return "admin/memberJoinList";
	} // end memberResList

	@MySecured(secured_role = Role.ADMIN)
	@RequestMapping(value = "/memberResList.do", method = RequestMethod.GET)
	public String memberResList(Model model, HttpServletRequest request
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		log.info("/memberResList.do...");
		
		String m_num = request.getParameter("m_num");	
		
		//전체 예약 개수
		int listCnt = service.totalCourtRes(m_num);
		
		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);		
		
		return "admin/memberResList";
	} // end memberResList

}
