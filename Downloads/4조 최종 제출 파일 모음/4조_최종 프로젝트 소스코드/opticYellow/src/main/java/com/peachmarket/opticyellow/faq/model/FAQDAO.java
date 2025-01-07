package com.peachmarket.opticyellow.faq.model;

import java.util.List;

import com.peachmarket.opticyellow.pagination.PaginationVO;

public interface FAQDAO {

	// 효림님 코드
	public int insert(FAQVO vo);

	public int update(FAQVO vo);

	public int delete(FAQVO vo);

	public List<FAQVO> selectAll(PaginationVO pagination);

	public FAQVO selectOne(FAQVO vo);

	public List<FAQVO> searchList(String searchKey, String searchWord,int startList, int endList);

	public void vcountUp(FAQVO vo);

	public int totalFaq();

}
