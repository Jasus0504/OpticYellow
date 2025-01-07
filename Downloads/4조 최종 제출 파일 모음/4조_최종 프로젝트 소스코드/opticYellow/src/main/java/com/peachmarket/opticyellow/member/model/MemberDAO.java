package com.peachmarket.opticyellow.member.model;

import java.util.List;

public interface MemberDAO {
	
	// 서준 코드
	MemberVO login(MemberVO vo);

	int insert(MemberVO vo);

	MemberVO idCheck(MemberVO vo);

	MemberVO pwCheck(MemberVO vo);

	MemberVO myPage(MemberVO vo);

	MemberVO selectRole(MemberVO vo);

	MemberVO findId(MemberVO vo);
	
	int sendEmail(MemberVO vo, String sendPw);

	MemberVO findPw(MemberVO vo);
	
	int updatePw(MemberVO vo);

	int ntrpUpdate(MemberVO vo);
	
	MemberVO emailCheck(MemberVO vo);
	
	// 민서님 코드
	int mypage_profile_update(MemberVO vo);
	
	MemberVO friend_profile(MemberVO vo);

	MemberVO mypage_profile(MemberVO vo);

	int mypage_profile_tel_update(MemberVO vo);

	int mypage_profile_birth_update(MemberVO vo);

	int mypage_profile_location_update(MemberVO vo);

	int mypage_profile_time_update(MemberVO vo);

	int mypage_profile_pw_update(MemberVO vo);

	boolean updatePassword(String user_id, String newPassword);

	MemberVO inviteCode(MemberVO vo);

	List<MemberVO> selectAll();

}
