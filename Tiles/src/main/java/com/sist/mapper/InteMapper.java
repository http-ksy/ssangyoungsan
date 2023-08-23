package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface InteMapper {
	
	//<select id="inteListData" resultType="InteVO" parameterType="hashmap">
	public List<InteVO> inteListData(Map map);
	
	//<select id="inteTotalPage" resultType="int" parameterType="hashmap">
	public int inteTotalPage(Map map);
	
//디테일
	@Select("SELECT ino,title,subject,poster,poster2,hashtag,gubun,price,jiyoek "
			+ "FROM inte_detail "
			+ "WHERE ino=#{ino}")
	public InteVO inteDetailData(int ino);

//댓글
	@Select("SELECT /*+ INDEX_DESC(inte_reply ir_no_pk)*/no,ino,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
			+ "FROM inte_reply "
			+ "WHERE ino=#{ino}")
	public List<InteReplyVO> InteReplyListData(int ino);
	
	@Insert("INSERT INTO inte_reply VALUES(ir_no_seq.nextval,#{ino},#{id},#{name},#{msg},SYSDATE)")
	public void InteReplyInsert(InteReplyVO vo);
	
}
