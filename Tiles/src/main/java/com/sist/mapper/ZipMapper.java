package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface ZipMapper {
	// 리스트 데이터
	// apt
	@Select("SELECT no,name,type,addr1,payment,compony,img,num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img,rownum as num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img "
			+ "FROM apt_estate ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<AptVO> aptListData(Map map);
	// op
	@Select("SELECT no,name,type,addr1,payment,compony,img,num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img,rownum as num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img "
			+ "FROM op_estate ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<OpVO> opListData(Map map);
	// bun
	@Select("SELECT no,name,type,addr1,cost,saletype,img,num "
			+ "FROM (SELECT no,name,type,addr1,cost,saletype,img,rownum as num "
			+ "FROM (SELECT no,name,type,addr1,cost,saletype,img "
			+ "FROM bun_estate ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<BunVO> bunListData(Map map);
	// house
	@Select("SELECT no,name,type,addr1,payment,compony,img,num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img,rownum as num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img "
			+ "FROM house_estate ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<HouseVO> houseListData(Map map);
	// room
	@Select("SELECT no,name,type,addr1,payment,compony,img,num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img,rownum as num "
			+ "FROM (SELECT no,name,type,addr1,payment,compony,img "
			+ "FROM room_estate ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<RoomVO> roomListData(Map map);
	// 아파트 상세 정보
	@Select("SELECT no,name,type,completion,room,floor,addr1,addr2,area,"
			+ "structure,parking,heating,trafic,payment,people,tel,email,phone,compony,reg,state,moveday,bathroom,img "
			+ "FROM apt_estate "
			+ "WHERE no=#{no}")
	public AptVO aptDetailData(int no); 
	@Select("SELECT CEIL(COUNT(*)/16) FROM apt_estate")
	public int aptTotalPage();
	@Select("SELECT COUNT(*) FROM apt_estate")
	public int apttotaldata();
}
