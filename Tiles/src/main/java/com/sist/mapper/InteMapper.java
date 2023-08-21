package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;

public interface InteMapper {
	
	//<select id="inteListData" resultType="InteVO" parameterType="hashmap">
	public List<InteVO> inteListData(Map map);
	
	//<select id="inteTotalPage" resultType="int" parameterType="hashmap">
	public int inteTotalPage(Map map);
	
//디테일
	@Select("SELECT no,title,subject,poster,poster2,hashtag,gubun,price,jiyoek "
			+ "FROM inte_detail "
			+ "WHERE no=#{no}")
	public InteVO inteDetailData(int no);
}
