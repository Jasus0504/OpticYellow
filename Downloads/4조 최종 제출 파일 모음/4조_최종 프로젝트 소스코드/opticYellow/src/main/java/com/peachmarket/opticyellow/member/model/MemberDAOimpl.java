package com.peachmarket.opticyellow.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOimpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 서준 코드
	// 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	public MemberDAOimpl() {
		log.info("MemberDAOimpl...");
	}
	
	@Override
	public MemberVO login(MemberVO vo) {
		log.info("login...{}",vo);
		return sqlSession.selectOne("LOGIN",vo);
	}

	@Override
	public int insert(MemberVO vo) {
		log.info("insert...{}",vo);
		return sqlSession.insert("M_INSERT",vo);
	}

	@Override
	public MemberVO idCheck(MemberVO vo) {
		log.info("idCheck...{}",vo);
		return sqlSession.selectOne("ID_CHECK",vo);
	}

	@Override
	public MemberVO pwCheck(MemberVO vo) {
		log.info("pwCheck...{}",vo);
		return sqlSession.selectOne("PW_CHECK",vo);
	}

	@Override
	public MemberVO myPage(MemberVO vo) {
		log.info("myPage...{}",vo);
		return sqlSession.selectOne("MYPAGE_SELECT_ONE",vo);
	}

	@Override
	public MemberVO selectRole(MemberVO vo) {
		log.info("selectRole...{}",vo);
		return sqlSession.selectOne("SELECT_ROLE", vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		log.info("findId...{}",vo);
		return sqlSession.selectOne("FIND_ID",vo);
	}
	
	// 메일 보내기
	@Override
	public int sendEmail(MemberVO vo, String sendPw) {
		log.info("sendEmail...{}",vo);
		log.info("sendPw: {}",sendPw);
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; // 구글은 smtp.gmail.com
		String hostSMTPid = ""; // 보내는 사람 이메일 주소
		String hostSMTPpw = ""; // 보내는 사람 이메일 비밀번호
		
		// 보내는 사람 정보 및 메일 내용 입력
		String fromEmail = "tjwnsz@naver.com"; // 보내는 사람 이메일 주소 (받는 사람 이메일에 표시됨)
		String fromName = "OpticYellow"; // 보내는 사람 이름
		String subject = ""; // 메일 제목
		String msg = ""; // 메일 내용
		
		// 1. 비밀번호 찾기 메일 내용
		if(sendPw.equals("sendPw")) {
			subject = "[OpticYellow] "+vo.getM_id()+" 님의 임시 비밀번호 입니다.";
			msg += "<div font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_id() + "님의 임시 비밀번호 입니다.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPw() + "</p>";
			msg += " <h3 style='color: blue;'>비밀번호를 변경하여 사용하세요.</h3></div>";
		}
		
		// 받는 사람 이메일 주소
		String email_addr = vo.getEmail();
		String email_name = vo.getName();
		
		int result = 1;
		
		try {
			HtmlEmail email = new HtmlEmail(); // Html 형식의 이메일을 생성하기 위한 HtmlEmail 객체
			email.setDebug(true); // // 디버그 모드를 활성화하여 디버그 로그를 출력
			email.setCharset(charSet);
			email.setSSL(true); //  SSL을 사용하여 보안 연결을 설정
			email.setHostName(hostSMTP); // SMTP 호스트(메일 서버)의 호스트 이름을 설정
			email.setSmtpPort(587); // SMTP 포트 번호를 설정, 구글은 465
			
			email.setAuthentication(hostSMTPid, hostSMTPpw); // SMTP 서버에 인증하기 위해 아이디와 비밀번호를 설정
			email.setTLS(true); // TLS(Transport Layer Security)를 사용하여 보안 연결 설정
			email.addTo(email_addr, email_name); // 수신자 이메일 주소와 캐릭터셋을 설정
			email.setFrom(fromEmail, fromName, charSet); // 발신자 이메일 주소, 발신자 이름, 캐릭터셋을 설정
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send(); // 이메일 전송
		} catch (EmailException e) {
			e.printStackTrace();
			log.info("메일발송 실패: {}",e);
			result = 0;
		}
		
		return result;
	}

	// 비밀번호 찾기
	@Override
	public MemberVO findPw(MemberVO vo) {
		log.info("findPw...{}",vo);
		
		MemberVO vo2 = sqlSession.selectOne("FIND_PW", vo);
		log.info("{}",vo2);
		// 입력한 아이디가 없거나, 입력한 아이디가 DB와 다르다면
		if(vo2 == null || !(vo2.getM_id().equals(vo.getM_id()))) {
			log.info("1?");
			return null;
		}
		// 입력한 이메일과 이름이 DB와 다르면
		if(!(vo2.getName().equals(vo.getName()))
				|| !(vo2.getEmail().equals(vo.getEmail()))) {
			log.info("2?");
			return null;
		}
		
		// 위에서 유효성 검사 완료 > 임시비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char)((Math.random()*26)+97);
		}
		// 임시 비밀번호로 비밀번호 변경
		vo2.setPw(pw);
		// => 메일전송 함수 호출
		int emailResult = sendEmail(vo2, "sendPw");
		if(emailResult == 0) {
			return null;
		}
		log.info("메일 발송 성공");
		
		// 생성된 임시 비밀번호를 랜덤문자열(60자)로 암호화
		vo2.setPw(passEncoder.encode(vo2.getPw()));
		
		// 임시 비밀번호로 DB 업데이트
		int updateResult = updatePw(vo2);
		log.info("{}",updateResult);
		
		if(updateResult == 0) {
			return null;
		}
		
		return vo2;
	}
	
	@Override
	public int updatePw(MemberVO vo) {
		log.info("updatePw...{}",vo);
		
		return sqlSession.update("UPDATE_PW",vo);
	}

	@Override
	public int ntrpUpdate(MemberVO vo) {
		log.info("updatePw...{}",vo);
		
		return sqlSession.update("UPDATE_NTRP",vo);
	}

	@Override
	public MemberVO emailCheck(MemberVO vo) {
		log.info("emailCheck()...{}", vo);
		return sqlSession.selectOne("EMAIL_CHECK",vo);
	}
	
	@Override
	public List<MemberVO> selectAll() {
		log.info("selectAll()...");
		return sqlSession.selectList("SELECT_ALL");
	}
	
	// 민서님 코드
	@Override
	public MemberVO mypage_profile(MemberVO vo) {
		log.info("mypage_profile()...{}", vo);

		return sqlSession.selectOne("MYPAGE_PROFILE_INFO", vo);
	}
	
	@Override
	public MemberVO friend_profile(MemberVO vo) {
		log.info("friend_profile()...{}", vo);

		return sqlSession.selectOne("FRIEND_PROFILE", vo);
	}

	@Override
	public int mypage_profile_update(MemberVO vo) {
		log.info("mypage_profile_update()...{}", vo);

		return sqlSession.update("MYPAGE_PROFILE_UPDATE", vo);
	}


	@Override
	public int mypage_profile_tel_update(MemberVO vo) {
		log.info("mypage_profile_tel_update()...{}", vo);

		return sqlSession.update("MYPAGE_TEL_UPDATE", vo);
	}

	@Override
	public int mypage_profile_birth_update(MemberVO vo) {
		log.info("mypage_profile_birth_update()...{}", vo);

		return sqlSession.update("MYPAGE_BIRTH_UPDATE", vo);
	}

	@Override
	public int mypage_profile_location_update(MemberVO vo) {
		log.info("mypage_profile_location_update()...{}", vo);

		return sqlSession.update("MYPAGE_LOCATION_UPDATE", vo);
	}

	@Override
	public int mypage_profile_time_update(MemberVO vo) {
		log.info("mypage_profile_time_update()...{}", vo);

		return sqlSession.update("MYPAGE_TIME_UPDATE", vo);
	}

	@Override
	public int mypage_profile_pw_update(MemberVO vo) {
		log.info("mypage_profile_pw_update()...{}", vo);

		return sqlSession.update("MYPAGE_PW_UPDATE", vo);
	}

	@Override
	public boolean updatePassword(String user_id, String newPassword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_id", user_id);
		params.put("newPassword", newPassword);

		int result = sqlSession.update("MYPAGE_PW_UPDATE", params);
		return result == 1;
	}

	@Override
	public MemberVO inviteCode(MemberVO vo) {
		log.info("mypage_profile()...{}", vo);

		return sqlSession.selectOne("INVITE_CODE", vo);
	}

}
