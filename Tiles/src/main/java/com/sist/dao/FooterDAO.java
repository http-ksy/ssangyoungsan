package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FooterMapper;
import com.sist.vo.CleanVO;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.InteVO;
import com.sist.vo.MoveVO;
import com.sist.vo.ProductVO;
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
	
	public List<InteVO> InteTop7(){
		return mapper.InteTop7();
	}
	
	public List<ProductVO> GaguTop7(){
		return mapper.GaguTop7();
	}
	
	public List<CleanVO> cleanTop7(){
		return mapper.cleanTop7();
	}
	
	public List<MoveVO> moveTop7(){
		return mapper.moveTop7();
	}
}
