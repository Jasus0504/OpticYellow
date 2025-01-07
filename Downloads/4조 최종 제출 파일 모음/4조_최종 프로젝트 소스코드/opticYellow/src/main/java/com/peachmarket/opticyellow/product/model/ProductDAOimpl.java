package com.peachmarket.opticyellow.product.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductDAOimpl implements ProductDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int p_insert(ProductVO vo) {
		log.info("ProductDAOimpl()...{},vo");
		return sqlSession.insert("P_INSERT", vo);
	}

	@Override
	public List<ProductVO> p_selectAll() {
		log.info("ProductDAOimpl()...{}");
		return sqlSession.selectList("P_SELECT_ALL");
	}

	@Override
	public ProductVO p_selectOne(ProductVO vo) {
		log.info("ProductDAOimplz()...{}", vo);
		return sqlSession.selectOne("P_SELECT_ONE", vo);
	}

	@Override
	public int p_update(ProductVO vo) {
		log.info("ProductDAOimpl()...{}", vo);
		return sqlSession.update("P_UPDATE", vo);
	}

	@Override
	public int s_p_final(ProductVO vo) {
		log.info("ProductDAOimpl()...{}", vo);
		return sqlSession.update("S_P_FINAL", vo);
	}

	@Override
	public List<ProductVO> p_searchList(String searchKey, String searchWord) {
		log.info("ProductDAOimpl()...{},{}", searchKey, searchWord);
			
		String newsearchWord = "%" + searchWord + "%";
		if (searchKey.equals("AllProduct")) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("searchWord", newsearchWord);
			log.info("Check!!!!!....{}", parameters);
			return sqlSession.selectList("P_SEARCH_ALL",parameters);
		} else {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("searchKey", searchKey);
			parameters.put("searchWord", newsearchWord);
			log.info("Checking_parameters....{}", parameters);
			return sqlSession.selectList("P_SEARCH", parameters);
		}

	}

	@Override
	public void vcountUp(ProductVO vo) {
		log.info("vcountUp()....{}",vo);
		sqlSession.update("P_VCOUNT_UP",vo);
	}

	@Override
	public int p_delete(ProductVO vo) {
		log.info("ProductDAOimpl()...{}", vo);
		return sqlSession.delete("P_DELETE", vo);
	}

	@Override
	public int b_p_final(ProductVO vo) {
		log.info("ProductDAOimpl()...{}", vo);
		return sqlSession.update("B_P_FINAL", vo);
	}

	@Override
	public List<ProductVO> view_selectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("VIEW_SELECTALL");
	}

	@Override
	public List<ProductVO> view_select8() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("VIEW_SELECT8");
	}

	@Override
	public List<ProductVO> new_select8() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NEW_SELECT8");
	}


}
