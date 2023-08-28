package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FooterMapper;
import com.sist.vo.EstateDetailVO;
@Repository
public class FooterDAO {
	@Autowired
	private FooterMapper mapper;
//	@Select("SELECT name,dprice,etype,rownum  FROM (SELECT name,dprice,etype FROM estate_detail WHERE dprice LIKE '__억'||'%' " 
//			+ "ORDER BY dprice DESC) "
//			+ "WHERE rownum<=7")
	public List<EstateDetailVO> estateTop7()
	{
		return mapper.estateTop7();
	}
}