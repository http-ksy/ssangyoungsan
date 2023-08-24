package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	@Select("SELECT COUNT(*) FROM estate_detail")
	public int estateTotalData();
	// 산집 no목록
	@Select("SELECT no FROM zipbuy WHERE id=#{id}")
	public List<Integer> zipbuy(String id);
	@Insert("INSERT INTO zipbuy VALUES(#{id},#{no})")
	public void zipbuyInsert(Map map);
	@Update("UPDATE estate_detail SET state='매매진행완료' WHERE no=#{no}")
	public void zipbuyTypeUpdate(int no);
	// 찜
	@Insert("INSERT INTO zipZim VALUES(zz_zno_seq.nextval,#{no},#{id})")
	public void zipZim(zipZimVO vo);
	@Select("SELECT COUNT(*) FROM zipZim WHERE id=#{id} AND no=#{no}")
	public int zipZimCheck(zipZimVO vo);	
	@Delete("DELETE FROM zipZim WHERE id=#{id} AND no=#{no}")
	public void zipZimDelete(zipZimVO vo);
//	@Select("SELECT no FROM zipZim WHERE id=#{id}")
//	public List<Integer> zipZimList(String id);
	
	@Select("SELECT no,num "
			+ "FROM (SELECT no,id,rownum as num "
			+ "FROM (SELECT no,id "
			+ "FROM zipZim WHERE id=#{id} ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<Integer> zipZimList(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM zipZim WHERE id=#{id}")
	public int zimTotalPage(Map map);
}
