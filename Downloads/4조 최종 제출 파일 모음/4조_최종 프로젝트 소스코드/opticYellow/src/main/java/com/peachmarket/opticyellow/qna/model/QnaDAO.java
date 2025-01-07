package com.peachmarket.opticyellow.qna.model;

import java.util.List;

import com.peachmarket.opticyellow.pagination.PaginationVO;

public interface QnaDAO {

	// 효림님 코드
	public int insert(QnaVO vo);

	public int update(QnaVO vo);

	public int delete(QnaVO vo);

	public List<QnaVO> selectAll(PaginationVO pagination,String m_id);

	public QnaVO selectOne(QnaVO vo);

	public int totalQna(String m_id);

	public List<QnaVO> selectAllAdmin(PaginationVO pagination);

}
