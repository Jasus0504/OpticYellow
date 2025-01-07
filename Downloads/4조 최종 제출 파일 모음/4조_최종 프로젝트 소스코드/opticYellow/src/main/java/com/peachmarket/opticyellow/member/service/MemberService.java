package com.peachmarket.opticyellow.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.member.model.MemberDAO;
import com.peachmarket.opticyellow.member.model.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {

	@Autowired
	MemberDAO dao;
	
	// 서준 코드
	public MemberService() {
		log.info("MemberService...");
	}

	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	public MemberVO idCheck(MemberVO vo) {
		return dao.idCheck(vo);
	}

	public MemberVO pwCheck(MemberVO vo) {
		return dao.pwCheck(vo);
	}

	public MemberVO myPage(MemberVO vo) {
		return dao.myPage(vo);
	}

	public MemberVO selectRole(MemberVO vo) {
		return dao.selectRole(vo);
	}

	public MemberVO findId(MemberVO vo) {
		return dao.findId(vo);
	}

	public MemberVO findPw(MemberVO vo) {
		return dao.findPw(vo);
		
	}

	public int ntrpUpdate(MemberVO vo) {
		return dao.ntrpUpdate(vo);
	}

	public MemberVO emailCheck(MemberVO vo) {
		return dao.emailCheck(vo);
	}
	
	// 민서님 코드
	public int mypage_profile_update(MemberVO vo) {
		return dao.mypage_profile_update(vo);
	}

	public MemberVO mypage_profile(MemberVO vo) {
		return dao.mypage_profile(vo);
	}

	public int mypage_profile_tel_update(MemberVO vo) {
		return dao.mypage_profile_tel_update(vo);
	}

	public int mypage_profile_birth_update(MemberVO vo) {
		return dao.mypage_profile_birth_update(vo);
	}

	public int mypage_profile_location_update(MemberVO vo) {
		return dao.mypage_profile_location_update(vo);
	}

	public int mypage_profile_time_update(MemberVO vo) {
		return dao.mypage_profile_time_update(vo);
	}

	public int mypage_profile_pw_update(MemberVO vo) {
		return dao.mypage_profile_pw_update(vo);
	}

	public boolean updatePassword(String user_id, String newPassword) {
		return dao.updatePassword(user_id, newPassword);
	}

	public MemberVO inviteCode(MemberVO vo) {
		return dao.inviteCode(vo);
	}
	
	public MemberVO friend_profile(MemberVO vo) {
		return dao.friend_profile(vo);
	}

	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}

}
