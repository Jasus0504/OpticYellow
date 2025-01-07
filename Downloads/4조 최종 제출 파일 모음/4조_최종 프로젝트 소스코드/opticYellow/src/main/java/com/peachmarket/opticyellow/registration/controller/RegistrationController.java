package com.peachmarket.opticyellow.registration.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.registration.model.RegistrationVO;
import com.peachmarket.opticyellow.registration.service.RegistrationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RegistrationController {

	@Autowired
	RegistrationService service;

	@Autowired
	ServletContext sContext;

	// 병엽님 코드
	// 테니스장 등록 페이지로 이동
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/fac_registration.do", method = RequestMethod.GET)
	public String fac_registration() {
		log.info("fac_registration...");

		return "fac_regi/fac_registration";
	}

	// 테니스장 등록 완료 페이지로 이동
	@RequestMapping(value = "/regi_complete.do", method = RequestMethod.GET)
	public String regi_complete() {
		log.info("regi_complete...");
		
		return "fac_regi/regi_complete";
	}

	// 테니스장 등록 데이터 처리
	@RequestMapping(value = "/fac_registrationOK.do", method = RequestMethod.POST)
	public String fac_registrationOK(RegistrationVO vo) throws IllegalStateException, IOException {
		log.info("fac_registrationOK...{}", vo);

		// 테니스장 사진1 처리
		String getOriginalFilename1 = vo.getMultipartFile1().getOriginalFilename();
		int fileNameLength1 = vo.getMultipartFile1().getOriginalFilename().length();
		log.info("getOriginalFilename1 : {}", getOriginalFilename1);
		log.info("fileNameLength1 : {}", fileNameLength1);

		if (getOriginalFilename1.length() == 0) {
			vo.setCourt_pic1("f_default.jpg");
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

		if (vo.getCome() == null) {
			vo.setCome("내용 없음");
		}
		
		int result = service.registration(vo);
		log.info("result : {}", result);

		if (result == 1)
			return "redirect:regi_complete.do";
		else
			return "redirect:fac_registration.do";
	}
}
