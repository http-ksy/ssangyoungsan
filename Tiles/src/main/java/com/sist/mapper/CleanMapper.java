package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;

public interface CleanMapper {
	@Select("SELECT cno,title,poster,carrer, score,num "
			+ "FROM (SELECT cno,title,poster,carrer, score,rownum as num "
			+ "FROM (SELECT cno,title,poster,carrer, score "
			+ "FROM clean_detail ORDER BY cno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CleanVO> CleanListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM clean_detail")
	public int CleanTotalPage();
	
	@Select("SELECT cno,title,address,poster,carrer,EMPLO,contanttime,service, score,category,INTRODUCE "
			+ "FROM clean_detail "
			+ "WHERE cno=#{cno}")
	public CleanVO CleanDetailData(int cno);
	
//	<select id="cleanFindData" resultType="CleanVO" parameterType="hashmap">
	public List<CleanVO> cleanFindData(Map map);
// 	<select id="cleanFindTotalPage" resultType="int" parameterType="hashmap">
	public int cleanFindTotalPage(Map map);
	
//	좋아요
	@Insert("INSERT INTO clean_jjim VALUES(cj_no_seq.nextval,#{id},#{cno})")
	public void cleanJjimInsert(CleanJjimVO vo);
	
	@Delete("DELETE FROM clean_jjim WHERE id=#{id} AND cno=#{cno}")
	public void cleanJjimDelete(CleanJjimVO vo);
	
	@Select("SELECT COUNT(*) FROM clean_jjim WHERE cno=#{cno} AND id=#{id}")
	public int cleanJjimOk(CleanJjimVO jvo);
}
