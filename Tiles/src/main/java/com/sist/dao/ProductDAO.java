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
	
	public List<ProductVO> productListData(Map map)
	{
		return mapper.productListData(map);
	}
	
	public int productTotalPage(Map map)
	{
		return mapper.productTotalPage(map);
	}
	
	public List<ProductVO> productFindData(Map map)
	{
		return mapper.productFindData(map);
	}
	public int productFindCount(Map map)
	{
		return mapper.productFindCount(map);
	}
	
	public ProductVO productDetailData(Map map)
	{
		return mapper.productDetailData(map);
	}
}