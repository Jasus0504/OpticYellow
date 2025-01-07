package com.peachmarket.opticyellow.join.model;

import java.util.List;

import com.peachmarket.opticyellow.game.model.GameVO;


public interface JoinDAO {

	// 효림님 코드
	public int insert(JoinVO vo);

	public int update(JoinVO vo);

	public int delete(JoinVO vo);

	public List<JoinVO> selectAll(JoinVO vo);


	public List<JoinVO> searchList(JoinVO vo, String user_id);

	public int countApplicationsByUserAndGame(String userId, int gameNum);



}
