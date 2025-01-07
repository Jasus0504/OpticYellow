
package com.peachmarket.opticyellow.game.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.facman.model.FacManVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class GameDAOimpl implements GameDAO {

	@Autowired
	SqlSession sqlSession;

	public GameDAOimpl() {
		log.info("GameDAOimpl()...");
	}
	
	// 민서님 코드
	@Override
	public List<GameVO> gamelist(GameVO vo) {
		log.info("gamelist()...{}", vo);

		return sqlSession.selectList("MYPAGE_GAME_MYLIST", vo);
	}

	// 효림님 코드
	@Override
	public List<GameVO> selectAll() {
		log.info("selectAll()...");

		return sqlSession.selectList("G_SELECT_ALL");
	}

	@Override
	public GameVO selectOne(GameVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("G_SELECT_ONE", vo);
	}

	@Override
	public int insert(GameVO vo) {
		log.info("insert()...{}", vo);
	

		return sqlSession.insert("G_INSERT", vo);
	}

	@Override
	public int update(GameVO vo) {
		log.info("update()...{}", vo);

		return sqlSession.update("G_UPDATE", vo);
	}
	
	@Override
	public int delete(GameVO vo) {
		log.info("delete()...{}", vo);

		return sqlSession.delete("G_DELETE", vo);
	}


	@Override
	public List<GameVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...searchKey:{}", searchKey);
		log.info("searchList()...searchWord:{}", searchWord);
		
		List<GameVO> vos = null;
		if (searchKey.equals("날짜")) {
			vos = sqlSession.selectList("G_SEARCH_LIST_DATE", "%" + searchWord + "%");}
//		else{
//			vos = sqlSession.selectList("G_SEARCH_LIST_REST");
//		}
		
		return vos;
	}
	
	 public List<GameVO> searchByOptions(String region, String subRegion, Double ntrp, String gender, String open) {
			log.info("searchByOptions region:{}",region);
			log.info("searchByOptions region:{}",subRegion);
			log.info("searchByOptions ntrp:{}",ntrp);
			log.info("searchByOptions gender:{}",gender);
			log.info("searchByOptions open:{}",open);

	        Map<String, Object> searchOptions = new HashMap<String, Object>();
	        searchOptions.put("region", region);
	        searchOptions.put("subRegion", subRegion);
	        searchOptions.put("ntrp", ntrp);
	        searchOptions.put("gender", gender);
	        searchOptions.put("open", open);
	        List<GameVO> vos = null;
	        vos = sqlSession.selectList("G_SEARCH_LIST_REST", searchOptions);
	        return vos;
	    }



	@Override
	public int remainingupdate(GameVO vo) {
		log.info("remainingupdate()...{}", vo);

		return sqlSession.update("REMAINING_UPDATE", vo);
	}
	//fac_name으로 fac_id 얻어오기 
	@Override
	public FacManVO selectFacility(String facName) {
		return sqlSession.selectOne("FACILITY_BY_FACNAME", facName);
	}
}


