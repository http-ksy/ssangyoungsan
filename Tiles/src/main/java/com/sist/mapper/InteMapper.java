package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;

public interface InteMapper {
	
/*	@Select("SELECT no,title,poster,jiyoek,price,gubun,num "
			+ "FROM (SELECT no,title,poster,jiyoek,price,gubun,rownum as num "
			+ "FROM (SELECT no,title,poster,jiyoek,price,gubun "
			+ "FROM inte_detail ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<InteVO> inteListData(Map map); 
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM inte_detail")
	public int inteTotalPage(); */
	
	//<select id="inteListData" resultType="InteVO" parameterType="hashmap">
	public List<InteVO> inteListData(Map map);
	
	//<select id="inteTotalPage" resultType="int" parameterType="hashmap">
	public int inteTotalPage(Map map);
}
