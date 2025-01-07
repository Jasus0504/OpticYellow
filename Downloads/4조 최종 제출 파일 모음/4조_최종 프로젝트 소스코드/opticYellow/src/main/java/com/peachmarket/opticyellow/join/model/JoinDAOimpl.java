package com.peachmarket.opticyellow.join.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.game.model.GameVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class JoinDAOimpl implements JoinDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 효림님 코드
	@Override
	public int insert(JoinVO vo) {
		log.info("insert()...{}");
		return sqlSession.insert("J_INSERT",vo);
	}

	@Override
	public int update(JoinVO vo) {
		log.info("update()...{}",vo);
		return sqlSession.update("J_UPDATE",vo);
	}

	@Override
	public int delete(JoinVO vo) {
		log.info("delete()...{}",vo);
		return sqlSession.delete("J_DELETE",vo);
	}

	@Override
	public List<JoinVO> selectAll(JoinVO vo) {
		log.info("selectAll()...{}",vo);
		return sqlSession.selectList("J_SELECT_ALL", vo);
	}

	@Override
	public List<JoinVO> searchList(JoinVO jvo, String user_id)
	
	{
		Map<String,Object> searchJoins = new HashMap<String, Object>();
		searchJoins.put("g_num", jvo.getG_num());
		searchJoins.put("user_id", user_id);
		
		List<JoinVO> vos = null;
        vos = sqlSession.selectList("JOIN", searchJoins);
        return vos;
		
	}
	
	 public int countApplicationsByUserAndGame(String userId, int gameNum) {
	        Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("userId", userId);
	        parameters.put("gameNum", gameNum);
	        return sqlSession.selectOne("countApplicationsByUserAndGame", parameters);
	    }

}
