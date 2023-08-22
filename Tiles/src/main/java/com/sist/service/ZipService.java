package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;


public interface ZipService {
	// 리스트 데이터
//		@Select("SELECT name,type,addr1,payment,compony,num "
//				+ "FROM (SELECT name,type,addr1,payment,compony,rownum as num "
//				+ "FROM (SELECT name,type,addr1,payment,compony "
//				+ "FROM apt_estate)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} "
//				+ "ORDER BY no ASC")
		public List<EstateDetailVO> EstateListData(Map map);
	
//		@Select("SELECT no,name,type,completion,room,floor,addr1,addr2,area,"
//				+ "structure,parking,heating,trafic,payment,people,tel,email,phone,compony,reg,state,moveday,bathroom,img,num "
//				+ "FROM EstateDetail_estate "
//				+ "WHERE no=#{no}")
		public EstateDetailVO EstateDetailData(int no); 
//		@Select("SELECT NVL(COUNT(*)/16) FROM EstateDetail_estate")
		public int EstateTotalPage(int etype);
//		@Select("SELECT COUNT(*) FROM EstateDetail_estate")
		public int EstateTotalData();
}
