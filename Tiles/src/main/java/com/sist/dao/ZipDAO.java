package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class ZipDAO {
	@Autowired
	private ZipMapper mapper;
	// 리스트 데이터
//		@Select("SELECT name,type,addr1,payment,compony,num "
//				+ "FROM (SELECT name,type,addr1,payment,compony,rownum as num "
//				+ "FROM (SELECT name,type,addr1,payment,compony "
//				+ "FROM apt_estate)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} "
//				+ "ORDER BY no ASC")
//	@Select("SELECT no,name,type,addr,dprice,compony,img,num "
//			+ "FROM (SELECT no,name,type,addr,dprice,compony,img,rownum as num "
//			+ "FROM (SELECT no,name,type,addr,dprice,compony,img "
//			+ "FROM estate_detail ORDER BY no ASC)) "
//			+ "WHERE etype=#{etype} AND num BETWEEN #{start} AND #{end} ")
	public List<EstateDetailVO> estateListData(Map map)
	{
		return mapper.estateListData(map);
	}
	
	// 아파트 상세 정보
//	@Select("SELECT * FROM estate_detail "
//			+ "WHERE no=#{no}")
	public EstateDetailVO estateDetailData(int no)
	{
		return mapper.estateDetailData(no);
	}
//	@Select("SELECT CEIL(COUNT(*)/16) FROM estate_detail WHERE etype=#{etype}")
	public int estateTotalPage(int etype)
	{
		return mapper.estateTotalPage(etype);
	}
//	@Select("SELECT COUNT(*) FROM estate_detail WHERE etype=#{etype}")
	public int estateTotalData()
	{
		return mapper.estateTotalData();
	}
//	@Select("SELECT no FROM zipbuy WHERE id=#{id}")
	public List<Integer> zipbuy(String id)
	{
		return mapper.zipbuy(id);
	}
//	@Insert("INSERT INTO zipbuy VALUES(#{id},#{no})")
	public void zipbuyInsert(Map map)
	{
		mapper.zipbuyInsert(map);
	}
//	@Update("UPDATE estate_detail SET type='매매진행완료' WHERE no=#{no}")
	public void zipbuyTypeUpdate(int no)
	{
		mapper.zipbuyTypeUpdate(no);
	}
//	@Insert("INSERT INTO zipZim VALUES(#{no},#{id}")
	public void zipZim(zipZimVO vo)
	{
		mapper.zipZim(vo);
	}
//	@Select("SELECT COUNT(*) FROM zipZim WHERE id=#{id} AND no=#{no}")
	public int zipZimCheck(zipZimVO vo)
	{
		return mapper.zipZimCheck(vo);
	}
//	@Delete("DELETE FROM zipZim WHERE id=#{id} AND no=#{no}")
	public void zipZimDelete(zipZimVO vo)
	{
		mapper.zipZimDelete(vo);
	}
	//@Select("SELECT no FROM zipZim WHERE id=#{id}")
	public List<Integer> zipZimList(String id)
	{
		return mapper.zipZimList(id);
	}
}
