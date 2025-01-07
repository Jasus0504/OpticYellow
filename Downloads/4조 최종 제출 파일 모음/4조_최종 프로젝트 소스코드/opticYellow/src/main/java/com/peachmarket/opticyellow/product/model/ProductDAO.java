package com.peachmarket.opticyellow.product.model;

import java.util.List;

public interface ProductDAO {

	int p_insert(ProductVO vo);
	
	List<ProductVO> p_selectAll();

	ProductVO p_selectOne(ProductVO vo);

	int p_update(ProductVO vo);

	int s_p_final(ProductVO vo);

	List<ProductVO> p_searchList(String searchKey, String searchWord);

	void vcountUp(ProductVO vo);

	int p_delete(ProductVO vo);

	int b_p_final(ProductVO vo);

	List<ProductVO> view_selectAll();

	List<ProductVO> view_select8();

	List<ProductVO> new_select8();

//	ProductVO selectOne(ProductVO vo);
//
//	int insert(ProductVO vo);

}
