package com.sist.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.CleanVO;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.InteVO;
import com.sist.vo.ProductVO;

public interface FooterService {
//	@Select("SELECT name,dprice,rownum  FROM (SELECT name,dprice FROM estate_detail WHERE dprice LIKE '__억'||'%' " 
//			+ "ORDER BY dprice DESC) "
//			+ "WHERE rownum<=7")
	public List<EstateDetailVO> estateTop7();
	
	public List<InteVO> InteTop7();
	
	public List<ProductVO> GaguTop7();
	
	public List<CleanVO> cleanTop7();
}
