package com.peachmarket.opticyellow.game.model;

import java.util.List;

import com.peachmarket.opticyellow.facman.model.FacManVO;

public interface GameDAO {
	
	// 민서님 코드
	List<GameVO> gamelist(GameVO vo);

	// 효림님 코드
	List<GameVO> selectAll();

	GameVO selectOne(GameVO vo);

	int insert(GameVO vo);

	int update(GameVO vo);

	int delete(GameVO vo);

	int remainingupdate(GameVO vo);

	List<GameVO> searchList(String searchKey, String searchWord);

	List<GameVO> searchByOptions(String region, String subRegion, Double ntrp, String gender, String open);
	
	//fac_name으로 fac_id 얻어오기 
	FacManVO selectFacility(String facName);
	

}
