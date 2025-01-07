package com.peachmarket.opticyellow.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peachmarket.opticyellow.game.service.GameService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;
import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@Autowired
	HttpSession session;

	// resources 실제 저장 경로
	@Autowired
	ServletContext sContext;

	// 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 서준 코드
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {
		log.info("/login.do...");

		Cookie[] cookies = request.getCookies(); // 저장된 쿠키값 받아서 저장
		String cookieUserId = null;

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				// cookie이름(cookieUserId)으로 있는지 비교 후 있으면 cookie값 저장해주기
				if (cookie.getName().equals("cookieUserId")) {
					cookieUserId = cookie.getValue();
					break;
				}
			}
		}

		model.addAttribute("m_id", cookieUserId);

		return "member/login";
	} // end login......

	@RequestMapping(value = "/logoutOK.do", method = RequestMethod.GET)
	public String logoutOK() {
		log.info("/logoutOK.do...");

		// 모든 세션정보 삭제
		session.invalidate();

		return "redirect:home.do";
	} // end logoutOK......

	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	public String loginOK(MemberVO vo, String idchk, HttpServletResponse response, Model model) {
		log.info("/loginOK.do...{}", vo);
		// 로그인 시 아이디 기억하기(idchk) checked == on, unchecked == null
		log.info("idchk:{}", idchk);

		// 입력받은 비밀번호와 암호화된 비밀번호 비교
		MemberVO vo2 = service.pwCheck(vo);

		// m_id 불일치!
		if (vo2 == null) {
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "아이디/비밀번호를 다시 확인해 주세요!";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/login.do");

			return "alert";
		}

		boolean pwCheck = passEncoder.matches(vo.getPw(), vo2.getPw());

		// 입력받은 비밀번호와 암호화된 비밀번호 비교 == true면 로그인 메서드 실행, false면 로그인 실패 얼럿
		if (pwCheck == true) {
			MemberVO vo3 = service.login(vo);
			log.info("vo3:{}", vo3);

			if (vo3 != null) {
				session.setAttribute("user_id", vo3.getM_id());

				// 로그인 시 아이디 기억하기(idchk) checked == on, unchecked == null
				if (idchk != null) {
					// 쿠키 7일간 저장
					Cookie cookie = new Cookie("cookieUserId", vo3.getM_id());
					cookie.setDomain("101.79.10.1");
					cookie.setPath("/");
					cookie.setMaxAge(7 * 24 * 60 * 60);
					cookie.setSecure(false); // https에서만 사용가능, http는 무시됨
					response.addCookie(cookie);
				} else {
					// 쿠키 삭제
					Cookie cookie = new Cookie("cookieUserId", null);
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}

				// 얼럿창 생성 후 아이디찾기 페이지로 이동
				String msg = "로그인 되었습니다!";
				model.addAttribute("msg", msg);
				model.addAttribute("url", "/");

				return "alert";

			}

		} // end if

		// 얼럿창 생성 후 아이디찾기 페이지로 이동
		String msg = "아이디/비밀번호를 다시 확인해 주세요!";
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/login.do");

		return "alert";

	} // end loginOK......

	@RequestMapping(value = "/m_insert.do", method = RequestMethod.GET)
	public String m_insert() {
		log.info("/m_insert.do...");

		return "member/insert";
	} // end m_insert......

	@RequestMapping(value = "/m_insertOK.do", method = RequestMethod.POST)
	public String m_insertOK(MemberVO vo, Model model) throws IllegalStateException, IOException {
		log.info("/m_insertOK.do...{}", vo);

		// 중복 아이디 체크
		MemberVO duplication = service.idCheck(vo);
		if (duplication != null) {
			String msg = "이미 사용중인 아이디입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/m_insert.do");

			return "alert";
		}
		// 중복 이메일 체크
		MemberVO duplication2 = service.emailCheck(vo);
		if (duplication2 != null) {
			String msg = "이미 사용중인 이메일입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/m_insert.do");

			return "alert";
		}

		// 사이트 최초 가입자에게 ADMIN 부여
		List<MemberVO> vos = service.selectAll();

		log.info("{}", vos);

		if (vos.isEmpty()) {
			log.info("ADMIN");
			vo.setRole("ADMIN");
		} else {
			log.info("USER");
			vo.setRole("USER");
		}

		// 1.회원가입 시 부여받을 친구초대코드 = 내 아이디
		vo.setM_invite_code(vo.getM_id());

		// 2.입력한 비밀번호를 랜덤문자열(60자)로 암호화
		vo.setPw(passEncoder.encode(vo.getPw()));
//		log.info("pw : {}",vo.getPw());

		// 3.file 저장 과정
		// 업로드된 file 이름 확인
		String getOriginalFilename = vo.getMultipartFile().getOriginalFilename();
		int fileNameLength = getOriginalFilename.length();
		log.info("getOriginalFilename: {}", getOriginalFilename);
		log.info("fileNameLength: {}", fileNameLength);

		// 업로드 파일 있을 경우와 없을 경우
		if (fileNameLength == 0) {
			vo.setM_img("default.png");
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
		int result = service.insert(vo);
		log.info("result:{}", result);

		if (result == 1) {
			String msg = "회원가입이 완료되었습니다 :)";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/login.do");

			return "alert";
		} else {
			String msg = "입력하신 정보를 다시 확인해 주세요!";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/m_insert.do");

			return "alert";
		}

	} // end m_insertOK......

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Model model) {
		log.info("/myPage.do...");

		MemberVO vo = new MemberVO();

		vo.setM_id((String) session.getAttribute("user_id"));

		MemberVO vo2 = service.myPage(vo);
		log.info("{}", vo2);

		String m_img = vo2.getM_img();

		session.setAttribute("m_img", m_img);

		model.addAttribute("vo2", vo2);

		return "member/myPage";
	} // end myPage...

	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public String findId() {
		log.info("/findId.do...");

		return "member/findId";
	} // end findId......

	@RequestMapping(value = "/findIdOK.do", method = RequestMethod.POST)
	public String findIdOK(MemberVO vo, Model model) {
		log.info("/findIdOK.do...");
		log.info("NAME: {}", vo.getName());
		log.info("EMAIL: {}", vo.getEmail());

		MemberVO vo2 = service.findId(vo);

		// 입력받은 값이 DB와 일치하지 않아 select 결과가 null 인 경우
		if (vo2 == null) {
			log.info("??");
			// 얼럿창 생성 후 아이디찾기 페이지로 이동
			String msg = "입력하신 정보가 일치하지 않습니다!";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/findId.do");

			return "alert";
		}

		// select 성공 > 얼럿창 생성 후 로그인 페이지로 이동
		String msg = "회원님의 아이디는 " + vo2.getM_id() + " 입니다.";
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/login.do");

		return "alert";
	} // end findIdOK......

	@RequestMapping(value = "/findPw.do", method = RequestMethod.GET)
	public String findPw() {
		log.info("/findPw.do...");

		return "member/findPw";
	} // end findPw......

	@RequestMapping(value = "/findPwOK.do", method = RequestMethod.POST)
	public String findPwOK(MemberVO vo, Model model) {
		log.info("/findPwOK.do...{}", vo);

		MemberVO vo2 = service.findPw(vo);

		// 입력받은 값이 DB와 일치하지 않아 select 결과가 null 인 경우
		if (vo2 == null) {
			String msg = "입력하신 정보가 일치하지 않습니다!";
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/findPw.do");
			return "alert";

		}

		// select 성공 > 얼럿창 생성 후 로그인 페이지로 이동
		String msg = "입력하신 주소로 메일이 전송되었습니다!";
		model.addAttribute("msg", msg);
		model.addAttribute("url", "/login.do");
		return "alert";

	} // end findPwOK......

	// 민서님 코드
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/profile.do", method = RequestMethod.GET)
	public String profile(MemberVO vo, Model model) {
		log.info("/profile.do...{}", vo);

		MemberVO vo2 = service.mypage_profile(vo);

		model.addAttribute("vo2", vo2);

		return "member/profile";
	}

	// 친구 프로필
	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/friend_profile.do", method = RequestMethod.GET)
	public String friend_profile(MemberVO vo, Model model) {
		log.info("/friend_profile.do...{}", vo);

		MemberVO vo2 = service.friend_profile(vo);

		model.addAttribute("vo2", vo2);

		return "member/friend/friend_profile";
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_profile.do", method = RequestMethod.GET)
	public String mypage_profile(MemberVO vo, Model model) {
		log.info("/mypage_profile.do...{}", vo);

		MemberVO vo2 = service.mypage_profile(vo);

		model.addAttribute("vo2", vo2);

		return "member/profile_update";
	}

	@RequestMapping(value = "/mypage_profile_updateOK.do", method = RequestMethod.POST)
	public String mypage_profile_updateOK(MemberVO vo) throws IllegalStateException, IOException {
		log.info("/mypage_profile_updateOK.do...{}", vo);

		String getOriginalFilename = vo.getMultipartFile().getOriginalFilename();
		int fileNameLength = vo.getMultipartFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() == 0) {
		} else {
			vo.setM_img(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f = new File(realPath + File.separator + vo.getM_img());
			vo.getMultipartFile().transferTo(f);

		} // end else

		log.info("{}", vo);

		int result = service.mypage_profile_update(vo);
		log.info("result : {}", result);

		if (result == 1) {

			return "redirect:myPage.do?m_id=" + vo.getM_id();
		} else {
			return "redirect:mypage_profile_update.do?m_id=" + vo.getM_id();
		}
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_setting.do", method = RequestMethod.GET)
	public String mypage_setting(MemberVO vo) {
		log.info("/mypage_setting.do...");

		return "member/setting/setting";
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_setting_OK.do", method = RequestMethod.GET)
	public String mypage_setting_OK(MemberVO vo) {
		log.info("/mypage_setting_OK.do...");

		return "member/setting/setting_menu";
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_profile_tel_update.do", method = RequestMethod.GET)
	public String mypage_profile_tel_update(MemberVO vo, Model model) {
		log.info("/mypage_profile_tel_update.do...{}", vo);

		return "member/setting/tel_update";
	}

	@RequestMapping(value = "/mypage_profile_tel_updateOK.do", method = RequestMethod.POST)
	public String mypage_profile_tel_updateOK(MemberVO vo) throws IllegalStateException, IOException {
		log.info("/mypage_profile_tel_updateOK.do...{}", vo);

		log.info("{}", vo);

		int result = service.mypage_profile_tel_update(vo);
		log.info("result : {}", result);

		if (result == 1) {
			return "redirect:mypage_setting_OK.do?m_id=" + vo.getM_id();
		} else {
			return "redirect:mypage_profile_tel_update.do?m_id=" + vo.getM_id();
		}
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_profile_birth_update.do", method = RequestMethod.GET)
	public String mypage_profile_birth_update(MemberVO vo, Model model) {
		log.info("/mypage_profile_birth_update.do...{}", vo);

		return "member/setting/birth_update";
	}

	@RequestMapping(value = "/mypage_profile_birth_updateOK.do", method = RequestMethod.POST)
	public String mypage_profile_birth_updateOK(MemberVO vo) throws IllegalStateException, IOException {
		log.info("/mypage_profile_birth_updateOK.do...{}", vo);

		log.info("{}", vo);

		int result = service.mypage_profile_birth_update(vo);
		log.info("result : {}", result);

		if (result == 1) {
			return "redirect:mypage_setting_OK.do?m_id=" + vo.getM_id();
		} else {
			return "redirect:mypage_profile_birth_update.do?m_id=" + vo.getM_id();
		}
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_profile_location_update.do", method = RequestMethod.GET)
	public String mypage_profile_location_update(MemberVO vo, Model model) {
		log.info("/mypage_profile_location_update.do...{}", vo);

		return "member/setting/location_update";
	}

	@RequestMapping(value = "/mypage_profile_location_updateOK.do", method = RequestMethod.POST)
	public String mypage_profile_location_updateOK(MemberVO vo) throws IllegalStateException, IOException {
		log.info("/mypage_profile_location_updateOK.do...{}", vo);

		log.info("{}", vo);

		int result = service.mypage_profile_location_update(vo);
		log.info("result : {}", result);

		if (result == 1) {
			return "redirect:mypage_setting_OK.do?m_id=" + vo.getM_id();
		} else {
			return "redirect:mypage_profile_location_update.do?m_id=" + vo.getM_id();
		}
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_profile_time_update.do", method = RequestMethod.GET)
	public String mypage_profile_time_update(MemberVO vo, Model model) {
		log.info("/mypage_profile_time_update.do...{}", vo);

		return "member/setting/time_update";
	}

	@RequestMapping(value = "/mypage_profile_time_updateOK.do", method = RequestMethod.POST)
	public String mypage_profile_time_updateOK(MemberVO vo) throws IllegalStateException, IOException {
		log.info("/mypage_profile_time_updateOK.do...{}", vo);

		log.info("{}", vo);

		int result = service.mypage_profile_time_update(vo);
		log.info("result : {}", result);

		if (result == 1) {
			return "redirect:mypage_setting_OK.do?m_id=" + vo.getM_id();
		} else {
			return "redirect:mypage_profile_time_update.do?m_id=" + vo.getM_id();
		}
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_profile_pw_update.do", method = RequestMethod.GET)
	public String mypage_profile_pw_update(MemberVO vo, Model model) {
		log.info("/mypage_profile_pw_update.do...{}", vo);

		return "member/setting/pw_update";
	}

	@RequestMapping(value = "/mypage_profile_pw_updateOK.do", method = RequestMethod.POST)
	public String mypage_profile_pw_updateOK(MemberVO vo) throws IllegalStateException, IOException {

		log.info("/mypage_profile_pw_updateOK.do...{}", vo);

		log.info("{}", vo);

		// 입력한 비밀번호를 랜덤문자열(60자)로 암호화
		vo.setPw(passEncoder.encode(vo.getPw()));
//					log.info("pw : {}",vo.getPw());

		int result = service.mypage_profile_pw_update(vo);
		log.info("result : {}", result);

		if (result == 1) {
			return "redirect:mypage_setting_OK.do?m_id=" + vo.getM_id();
		} else {
			return "redirect:mypage_profile_pw_update.do?m_id=" + vo.getM_id();
		}
	}

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/mypage_friend.do", method = RequestMethod.GET)
	public String mypage_sns() {
		log.info("/mypage_friend.do()...");

		return "member/friend/friend_list";
	}
}
