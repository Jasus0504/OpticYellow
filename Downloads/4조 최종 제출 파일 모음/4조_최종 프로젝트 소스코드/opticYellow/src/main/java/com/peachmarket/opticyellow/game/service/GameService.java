package com.peachmarket.opticyellow.game.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.facman.model.FacManVO;
import com.peachmarket.opticyellow.game.model.GameDAO;
import com.peachmarket.opticyellow.game.model.GameVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GameService {

	@Autowired
	GameDAO dao;
	
	public GameService() {
		log.info("GameService()...");
	}

	// 민서님 코드
	public List<GameVO> gamelist(GameVO vo) {
		return dao.gamelist(vo);
	}

	// 효림님 코드
	public List<GameVO> selectAll() {
		return dao.selectAll();
	}

	public GameVO selectOne(GameVO vo) {
		return dao.selectOne(vo);
	}

	public int insert(GameVO vo) {
		
		return dao.insert(vo);
	}


	public int update(GameVO vo) {
		return dao.update(vo);
	}

	public int delete(GameVO vo) {
		return dao.delete(vo);
	}


	public int decreaseRemaining(GameVO vo) {
		// TODO Auto-generated method stub
		return dao.remainingupdate(vo);
	}



	public List<GameVO> searchList(String searchKey, String searchWord) {
		// TODO Auto-generated method stub
		return dao.searchList(searchKey, searchWord);
	}

	public List<GameVO> searchByOptions(String region, String subRegion, Double ntrp, String gender, String open) {
		log.info("service");
		return dao.searchByOptions(region, subRegion, ntrp, gender, open);
	}
	//fac_name으로 fac_id 얻어오기 
	public FacManVO getFacility(String facName) {
		return dao.selectFacility(facName);
	}

}
