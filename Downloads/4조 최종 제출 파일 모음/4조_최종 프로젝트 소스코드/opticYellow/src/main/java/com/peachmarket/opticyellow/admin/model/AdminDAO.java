package com.peachmarket.opticyellow.admin.model;

import java.util.List;

import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

public interface AdminDAO {

	AdminVO adminPage(AdminVO vo);

	List<AdminVO> memberList(PaginationVO pagination);

	List<AdminVO> gameResList(String m_num, PaginationVO pagination);

	List<AdminVO> courtResList(String m_num, PaginationVO pagination);

	int memberDel(MemberVO vo);

	AdminVO memberInfo(AdminVO vo);

	int memberUpdate(AdminVO vo);

	List<AdminVO> memberSearch(String searchKey, String searchWord);
	
	int totalMember();

	int totalGameRes(String m_num);

	int totalCourtRes(String m_num);

}
