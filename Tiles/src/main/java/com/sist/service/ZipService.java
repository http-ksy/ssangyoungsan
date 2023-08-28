package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
//		@Select("SELECT no FROM zipbuy WHERE id=#{id}")
		public List<EstateDetailVO> zipbuy(String id);
//		@Insert("INSERT INTO zipbuy VALUES(#{id},#{no})")
		public void zipbuyInsert(Map map,int no);
//		@Update("UPDATE estate_detail SET type='매매진행완료' WHERE no=#{no}")
//		public void zipbuyTypeUpdate(int no);
//		@Insert("INSERT INTO zipZim VALUES(#{no},#{id}")
		public void zipZim(zipZimVO vo);
//		@Select("SELECT COUNT(*) FROM zipZim WHERE id=#{id} AND no=#{no}")
		public int zipZimCheck(zipZimVO vo);
//		@Delete("DELETE FROM zipZim WHERE id=#{id} AND no=#{no}")
		public void zipZimDelete(zipZimVO vo);
		// 찜 리스트 마이페이지에 출력
		public List<EstateDetailVO> zipZimList(Map map);
		public int zimTotalPage(Map map);
//		@Select("SELECT etype,no,name,type,addr,dprice,company,img,num "
//				+ "FROM (SELECT etype,no,name,type,addr,dprice,company,img,rownum as num "
//				+ "FROM (SELECT etype,no,name,type,addr,dprice,company,img "
//				+ "FROM estate_detail WHERE etype=#{etype} ORDER BY no ASC)"
//				+ "WHERE addr LIKE '%'||#{fd}||'%' or name LIKE '%'||#{fd}||'%' or company LIKE '%'||#{fd}||'%' or dprice LIKE '%'||#{fd}||'%') "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<EstateDetailVO> estateFindData(Map map);
//		@Select("SELECT CEIL(COUNT(*)/16) FROM estate_detail WHERE etype=#{etype} "
//				+ "AND (addr LIKE '%'||#{fd1}||'%' or name LIKE '%'||#{fd2}||'%' or company LIKE '%'||#{fd3}||'%' or dprice LIKE '%'||#{fd4}||'%') ")
		public int estateFindPage(Map map);
}
