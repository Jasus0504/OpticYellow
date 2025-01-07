package com.peachmarket.opticyellow.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.admin.model.AdminDAO;
import com.peachmarket.opticyellow.admin.model.AdminVO;
import com.peachmarket.opticyellow.member.model.MemberVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminService {

	@Autowired
	AdminDAO dao;
	
	public AdminService() {
		log.info("MemberService...");
	}

	public AdminVO adminPage(AdminVO vo) {
		return dao.adminPage(vo);
	}

	public List<AdminVO> memberList(PaginationVO pagination) {
		return dao.memberList(pagination);
	}

	public List<AdminVO> gameResList(String m_num, PaginationVO pagination) {
		return dao.gameResList(m_num,pagination);
	}

	public List<AdminVO> courtResList(String m_num, PaginationVO pagination) {
		return dao.courtResList(m_num,pagination);
	}

	public int memberDel(MemberVO vo) {
		return dao.memberDel(vo);
	}

	public AdminVO memberInfo(AdminVO vo) {
		return dao.memberInfo(vo);
	}

	public int memberUpdate(AdminVO vo) {
		return dao.memberUpdate(vo);
	}

	public List<AdminVO> memberSearch(String searchKey, String searchWord) {
		return dao.memberSearch(searchKey,searchWord);
	}

	public int totalMember() {
		return dao.totalMember();
	}

	public int totalGameRes(String m_num) {
		return dao.totalGameRes(m_num);
	}

	public int totalCourtRes(String m_num) {
		return dao.totalCourtRes(m_num);
	}
}
