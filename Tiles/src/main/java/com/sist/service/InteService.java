package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.InteVO;

public interface InteService {
	
/*	@Select("SELECT no,title,poster,jiyoek,price,gubun,num "
			+ "FROM (SELECT no,title,poster,jiyoek,price,gubun,rownum as num "
			+ "FROM (SELECT no,title,poster,jiyoek,price,gubun "
			+ "FROM inte_detail ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}") */
	//public List<InteVO> inteListData(Map map);
	
	
	/*@Select("SELECT no,title,subject,poster,poster2,hashtag,gubun,price,jiyoek "
			+ "FROM inte_detail "
			+ "WHERE no=#{no}") */
	public InteVO inteDetailData(int no);
	
}
