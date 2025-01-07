package com.peachmarket.opticyellow.join.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.game.model.GameDAO;
import com.peachmarket.opticyellow.game.model.GameVO;
import com.peachmarket.opticyellow.join.model.JoinDAO;
import com.peachmarket.opticyellow.join.model.JoinVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class JoinService {

	@Autowired
	JoinDAO dao;

	// 효림님 코드
	public int insert(JoinVO vo) {
		return dao.insert(vo);
	}

	public int update(JoinVO vo) {
		return dao.update(vo);
	}

	public int delete(JoinVO vo) {
		return dao.delete(vo);
	}

	public List<JoinVO> selectAll(JoinVO vo) {
		return dao.selectAll(vo);
	}

	public List<JoinVO> searchList(JoinVO jvo, String user_id) {
		return dao.searchList(jvo, user_id);
	}
	
	public boolean hasUserApplied(String userId, int gameNum) {
        int count = dao.countApplicationsByUserAndGame(userId, gameNum);
        return count > 0;
    }

}
