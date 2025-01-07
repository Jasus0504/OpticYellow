package com.peachmarket.opticyellow.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.faq.model.FAQDAO;
import com.peachmarket.opticyellow.faq.model.FAQVO;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FAQService {

	@Autowired
	FAQDAO dao;

	// 효림님 코드
	public FAQService() {
		log.info("FAQService...");
	}

	public int insert(FAQVO vo) {
		log.info("서비스에 insert");
		return dao.insert(vo);
	}

	public int update(FAQVO vo) {
		return dao.update(vo);
	}

	public int delete(FAQVO vo) {
		return dao.delete(vo);
	}

	public List<FAQVO> selectAll(PaginationVO pagination) {
		return dao.selectAll(pagination);
	}

	public FAQVO selectOne(FAQVO vo) {
		return dao.selectOne(vo);
	}

	public List<FAQVO> searchList(String searchKey, String searchWord,int startList, int endList) {
		return dao.searchList(searchKey, searchWord,startList,endList);
	}

	public void vcountUp(FAQVO vo) {
		log.info("vcountUP서비스{}",vo);
		dao.vcountUp(vo);
	}

	public int totalFaq() {
		return dao.totalFaq();
	}

}
