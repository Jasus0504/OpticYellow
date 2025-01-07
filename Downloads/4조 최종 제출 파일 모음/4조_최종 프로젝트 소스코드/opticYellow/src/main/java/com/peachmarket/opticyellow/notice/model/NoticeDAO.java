package com.peachmarket.opticyellow.notice.model;

import java.util.List;

import com.peachmarket.opticyellow.pagination.PaginationVO;

public interface NoticeDAO {

	// 효림님 코드
	public int insert(NoticeVO vo);

	public int update(NoticeVO vo);

	public int delete(NoticeVO vo);

	public List<NoticeVO> selectAll(PaginationVO pagination);

	public NoticeVO selectOne(NoticeVO vo);

	public void vcountUp(NoticeVO vo);

	public List<NoticeVO> searchList(String searchWord, int startList, int endList);

	public int totalNotice();

}
