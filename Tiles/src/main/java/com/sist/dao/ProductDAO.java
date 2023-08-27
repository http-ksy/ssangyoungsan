package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class ProductDAO {
	@Autowired
	private ProductMapper mapper;
	// 목록
	public List<ProductVO> productListData(Map map)
	{
		return mapper.productListData(map);
	}
	
	public int productTotalPage(Map map)
	{
		return mapper.productTotalPage(map);
	}
	
	// 검색
	public List<ProductVO> productFindData(Map map)
	{
		return mapper.productFindData(map);
	}
	public int productFindCount(Map map)
	{
		return mapper.productFindCount(map);
	}
	
	// 상세페이지
	public ProductVO productDetailData(Map map)
	{
		return mapper.productDetailData(map);
	}
	
	// 장바구니
	public void cartInsert(ProductCartVO vo)
	{
		mapper.cartInsert(vo);
	}
	public List<ProductCartVO> cartListData(Map map)
	{
		return mapper.cartListData(map);
	}
	public void cartDelete(String id)
	{
		mapper.cartDelete(id);
	}



}