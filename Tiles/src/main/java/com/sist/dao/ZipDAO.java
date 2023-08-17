package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Select;
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
		public List<AptVO> aptListData(Map map)
		{
			return mapper.aptListData(map);
		}
		public List<OpVO> opListData(Map map)
		{
			return mapper.opListData(map);
		}
		public List<BunVO> bunListData(Map map)
		{
			return mapper.bunListData(map);
		}
		public List<HouseVO> houseListData(Map map)
		{
			return mapper.houseListData(map);
		}
		public List<RoomVO> roomListData(Map map)
		{
			return mapper.roomListData(map);
		}
		// 아파트 상세 정보
//		@Select("SELECT no,name,type,completion,room,floor,addr1,addr2,area,"
//				+ "structure,parking,heating,trafic,payment,people,tel,email,phone,compony,reg,state,moveday,bathroom,img,num "
//				+ "FROM apt_estate "
//				+ "WHERE no=#{no}")
		public AptVO aptDetailData(int no)
		{
			return mapper.aptDetailData(no);
		}
//		@Select("SELECT NVL(COUNT(*)/16) FROM apt_estate")
		public int aptTotalPage()
		{
			return mapper.aptTotalPage();
		}
//		@Select("SELECT COUNT(*) FROM apt_estate")
		public int apttotaldata()
		{
			return mapper.apttotaldata();
		}
}
