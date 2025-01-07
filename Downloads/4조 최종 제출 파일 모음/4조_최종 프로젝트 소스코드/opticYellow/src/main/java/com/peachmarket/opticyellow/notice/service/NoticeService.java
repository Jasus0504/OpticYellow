package com.peachmarket.opticyellow.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.faq.model.FAQDAO;
import com.peachmarket.opticyellow.faq.model.FAQVO;
import com.peachmarket.opticyellow.notice.model.NoticeDAO;
import com.peachmarket.opticyellow.notice.model.NoticeVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeService {

	@Autowired
	NoticeDAO dao;

	public NoticeService() {
		log.info("NoticeService...");
	}

	// 효림님 코드
	public int insert(NoticeVO vo) {
		return dao.insert(vo);
	}

	public int update(NoticeVO vo) {
		return dao.update(vo);
	}

	public int delete(NoticeVO vo) {
		return dao.delete(vo);
	}

	public List<NoticeVO> selectAll(PaginationVO pagination) {
		return dao.selectAll(pagination);
	}

	public NoticeVO selectOne(NoticeVO vo) {
		return dao.selectOne(vo);
	}

	public List<NoticeVO> searchList(String searchWord, int startList, int endList) {
		return dao.searchList(searchWord,startList,endList);
	}

	public void vcountUp(NoticeVO vo) {
		dao.vcountUp(vo);
	}

	public int totalNotice() {
		return dao.totalNotice();
	}

}
