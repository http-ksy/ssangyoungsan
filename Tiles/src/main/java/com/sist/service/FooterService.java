package com.sist.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.EstateDetailVO;

public interface FooterService {
//	@Select("SELECT name,dprice,rownum  FROM (SELECT name,dprice FROM estate_detail WHERE dprice LIKE '__억'||'%' " 
//			+ "ORDER BY dprice DESC) "
//			+ "WHERE rownum<=7")
	public List<EstateDetailVO> estateTop7();
}
