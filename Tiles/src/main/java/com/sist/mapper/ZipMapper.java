package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface ZipMapper {
	// 리스트 데이터
	// apt
	@Select("SELECT etype,no,name,type,addr,dprice,company,img,num "
			+ "FROM (SELECT etype,no,name,type,addr,dprice,company,img,rownum as num "
			+ "FROM (SELECT etype,no,name,type,addr,dprice,company,img "
			+ "FROM estate_detail WHERE etype=#{etype} ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<EstateDetailVO> estateListData(Map map);
	
	// 아파트 상세 정보
	@Select("SELECT * FROM estate_detail "
			+ "WHERE no=#{no}")
	public EstateDetailVO estateDetailData(int no); 
	@Select("SELECT CEIL(COUNT(*)/16) FROM estate_detail WHERE etype=#{etype}")
	public int estateTotalPage(int etype);
	@Select("SELECT COUNT(*) FROM estate_detail WHERE etype=#{etype}")
	public int estateTotalData(int etype);
}
