package com.peachmarket.opticyellow.qnaanswer.model;

import java.util.List;

public interface QnaAnswerDAO {

	// 효림님 코드
	public int insert(QnaAnswerVO vo);

	public int update(QnaAnswerVO vo);

	public int delete(QnaAnswerVO vo);

	public List<QnaAnswerVO> selectAll(QnaAnswerVO vo);


}
