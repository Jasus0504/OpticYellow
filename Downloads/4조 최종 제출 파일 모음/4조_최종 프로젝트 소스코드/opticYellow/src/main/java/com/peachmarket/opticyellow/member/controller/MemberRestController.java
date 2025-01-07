package com.peachmarket.opticyellow.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberRestController {

	@Autowired
	MemberService service;

	@Autowired
	HttpSession session;

	// 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;	
	
	// 서준 코드
	@RequestMapping(value = "/json_idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_idCheck(MemberVO vo) {
		log.info("/json_idCheck.do...{}", vo.getM_id());

		MemberVO vo2 = service.idCheck(vo);
		log.info("vo2:{}", vo2); // m_id가 null 인지 not null 인지 체크

		String msg = "OK";
		if (vo2 != null) {
			msg = "Not OK";
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("result", msg);

		return map;
	} // end json_idCheck......

	@RequestMapping(value = "/json_ntrp_update.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> json_ntrp_update(MemberVO vo) {
		log.info("/json_ntrp_update.do...{}", vo);

		vo.setM_id((String) session.getAttribute("user_id"));

		int result = service.ntrpUpdate(vo);
		log.info("result: {}", result);

		String msg = "OK";
		if (result != 1) {
			msg = "Not OK";
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("result", msg);

		return map;
	} // end json_ntrp_update......

	// 민서님 코드
	@RequestMapping(value = "/json_mypage_profile.do", method = RequestMethod.GET)
	@ResponseBody
	public MemberVO json_mypage_profile(MemberVO vo) {
		log.info("/json_mypage_profile.do... {}", vo);

		MemberVO vo2 = service.mypage_profile(vo);
		log.info("{}", vo2);

		return vo2;
	}

	// 친구 프로필
	@RequestMapping(value = "/json_friend_profile.do", method = RequestMethod.GET)
	@ResponseBody
	public MemberVO json_friend_profile(MemberVO vo) {
		log.info("/json_friend_profile.do... {}", vo);

		MemberVO vo2 = service.friend_profile(vo);
		log.info("{}", vo2);

		return vo2;
	}

	@RequestMapping(value = "/json_invite_code.do", method = RequestMethod.GET)
	@ResponseBody
	public String json_invite_code(MemberVO vo) {
		log.info("/json_invite_code.do... {}", vo);

		MemberVO vo2 = new MemberVO();
		vo2.setM_id(vo.getM_id());
		MemberVO result = service.inviteCode(vo2);
		String inviteCode = result.getM_invite_code();

		log.info("inviteCode: {}", inviteCode);

		return inviteCode;
	}

	@RequestMapping(value = "/json_pw_check.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String json_pw_check(MemberVO vo) {

		// 입력받은 비밀번호와 암호화된 비밀번호 비교
		MemberVO vo2 = service.pwCheck(vo);
		boolean pwCheck = passEncoder.matches(vo.getPw(), vo2.getPw());

		log.info("pwCheck: {}", pwCheck);

		if (pwCheck == true) {
			return "success"; // 비밀번호가 일치하는 경우 성공 값을 반환
		} else {
			return "failure"; // 비밀번호가 일치하지 않는 경우 실패 값을 반환
		}
	}

}
