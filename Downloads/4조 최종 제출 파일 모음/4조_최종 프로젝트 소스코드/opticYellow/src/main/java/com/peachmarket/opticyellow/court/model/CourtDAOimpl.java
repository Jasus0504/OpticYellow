
package com.peachmarket.opticyellow.court.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.peachmarket.opticyellow.common.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CourtDAOimpl implements CourtDAO {

	@Autowired
	SqlSession sqlSession;

	// 민서님 코드
	@Override
	public List<CourtVO> courtList(CourtVO vo) {
		log.info("courtList()...{}", vo);

		return sqlSession.selectList("MYPAGE_COURT_MYLIST", vo);
	}

	// 병엽님 코드

	@Override
	public FacManwithCourtVO selectOne(FacManwithCourtVO vo) {
		log.info("selectOne()...{}", vo);

		FacManwithCourtVO vo2 = sqlSession.selectOne("COURT_SELECT_ONE", vo);
		
		log.info("{}", vo2);
		
		return vo2;
	}

	@Override
	public int courtAllCnt() {
		log.info("courtAllCnt()...");

		return sqlSession.selectOne("COURT_SELECT_ALL_COUNT");
		
	}

	@Override
	public List<FacManwithCourtVO> selectAll(PaginationVO pagination) {
		log.info("selectAll()...{}",pagination);

		return sqlSession.selectList("COURT_SELECT_ALL",pagination);

		
	}

	@Override
	public List<FacManwithCourtVO> searchList(String region, String subRegion, String in_or_out, String floor_type) {
		log.info("searchList()...{}, {}", region, subRegion);
		log.info("searchList()...{}, {}", in_or_out, floor_type);

		Map<String, Object> searchOptions = new HashMap<String, Object>();
		searchOptions.put("region", region);
		searchOptions.put("subRegion", subRegion);
		searchOptions.put("in_or_out", in_or_out);
		searchOptions.put("floor_type", floor_type);
		List<FacManwithCourtVO> vos = sqlSession.selectList("COURT_SEARCH_LIST", searchOptions);

		return vos;
	}

	@Override
	public int c_reserve(CourtVO vo) {
		log.info("c_reserve()...{}", vo);
		
		int flag = 0;
		
		flag = sqlSession.insert("COURT_RESERVE", vo);
		
		return flag;
	}
	
	@Override
	public FacManwithCourtVO fac_selectOne(FacManwithCourtVO vo) {
		log.info("fac_selectOne()...{}", vo);
		
		FacManwithCourtVO vo2 = sqlSession.selectOne("FAC_SELECT_ONE", vo);
		
		return vo2;
	}

	@Override
	public List<FacManwithCourtVO> courtAll(FacManwithCourtVO vo) {
		log.info("courtAll()...{}", vo);
		
		List<FacManwithCourtVO> vos = sqlSession.selectList("COURT_NAME_LIST", vo);
		
		return vos;
	}

	@Override
	public List<CourtResVO> getinfo(String court_id, String start_date, String end_date) {
		log.info("getinfo()...{}, {}", court_id, start_date);
		log.info("getinfo()...{}", end_date);
		
		Map<String, Object> searchOptions = new HashMap<String, Object>();
        searchOptions.put("court_id", court_id);
        searchOptions.put("start_date", start_date);
        searchOptions.put("end_date", end_date);
        List<CourtResVO> vos = sqlSession.selectList("RESERVATION_INFO", searchOptions);
		log.info("vos : {}", vos);
		
		return vos;
	}

	@Override
	public int c_delete(CourtVO vo) {
		log.info("c_delete()...{}", vo);
		
		int flag = 0;

		flag = sqlSession.delete("COURT_RESERVE_DELETE", vo);

		return flag;
	}
}
