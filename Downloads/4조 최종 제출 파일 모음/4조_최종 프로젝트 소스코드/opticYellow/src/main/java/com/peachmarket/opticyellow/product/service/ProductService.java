package com.peachmarket.opticyellow.product.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.product.model.ProductDAO;
import com.peachmarket.opticyellow.product.model.ProductVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ProductService {

	@Autowired
	ProductDAO dao;

	public int p_insert(ProductVO vo) {
		return dao.p_insert(vo);
	}
	
	public List<ProductVO> selectAll() {
		return dao.p_selectAll();
	}

	public ProductVO selectOne(ProductVO vo) {
		log.info("ProductService()...{}",vo);
		return dao.p_selectOne(vo);
	}

	public int p_update(ProductVO vo) {
		log.info("ProductService()_update...{}",vo);
		return dao.p_update(vo);
		
	}

	public int s_p_final(ProductVO vo) {
		log.info("ProductService()_final...{}",vo);
		return dao.s_p_final(vo);
		
	}

	public List<ProductVO> p_searchList(String searchKey, String searchWord) {
		log.info("ProductService()_searchList...{},{}",searchKey,searchWord);
		return dao.p_searchList(searchKey,searchWord);
	}

	public void vcountUp(ProductVO vo) {
		dao.vcountUp(vo);
		
	}

	public int p_delete(ProductVO vo) {
		log.info("ProductService()delete...{}",vo);
		return dao.p_delete(vo);
		
	}

	public int b_p_final(ProductVO vo) {
		log.info("ProductService()_final...{}",vo);
		return dao.b_p_final(vo);
		
	}

	public List<ProductVO> view_selectAll() {
		return dao.view_selectAll();
	}

	public List<ProductVO> json_view_select8() {
		return dao.view_select8();
	}

	public List<ProductVO> json_new_select8() {
		return dao.new_select8();
	}

	

}
