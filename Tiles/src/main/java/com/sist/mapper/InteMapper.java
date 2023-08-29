package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface InteMapper {
	
	//<select id="inteListData" resultType="InteVO" parameterType="hashmap">
	public List<InteVO> inteListData(Map map);
	
	//<select id="inteTotalPage" resultType="int" parameterType="hashmap">
	public int inteTotalPage(Map map);
	
//디테일
	@Select("SELECT ino,title,subject,poster,poster2,hashtag,gubun,price,jiyoek,suggest "
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
	
	@Delete("DELETE FROM inte_reply WHERE no=#{no}")
	public void inteReplyDelete(int no);
	
	@Update("UPDATE inte_reply SET msg=#{msg} WHERE no=#{no}")
	public void inteReplyUpdate(InteReplyVO vo);

//좋아요
	@Insert("INSERT INTO interior_like VALUES(il_no_seq.nextval,#{id},#{ino})")
	public void inteLikeInsert(InteLikeVO vo);
	
	@Delete("DELETE FROM interior_like WHERE id=#{id} AND ino=#{ino} ")
	public void inteLikeDelete(InteLikeVO vo);
	
	@Select("SELECT COUNT(*) FROM interior_like WHERE ino=#{ino} AND id=#{id}")
	public int inteLikeOk(InteLikeVO vo);

//예약 >> 안씀
	@Select("SELECT reserve_day FROM inte_detail WHERE ino={ino}")
	public String InteReserveDay(int ino);
	
	@Select("SELECT time FROM reserve_time WHERE rno=#{rno}")
	public String reserve_day_time(int rno);
	
	@Select("SELECT time FROM reserve_day WHERE tno=#{tno}")
	public String  reserve_get_time(int tno);
//예약하기
	@Insert("INSERT INTO reserve_info_inte VALUES(rii_no_seq.nextval,"
			+ "#{id},#{ino},#{reserve_date},#{reserve_time},'y',SYSDATE)")
	public void reserveOk(InteReserveVO vo);
	
	@Select("SELECT no,reserve_date,reserve_time FROM reserve_info_inte WHERE id=#{id}")
	public List<InteReserveVO> reserveNo(String id);
	
	/*
	 * @Select("SELECT no FROM reserve_info_inte WHERE id=#{id}") public int
	 * reserveOkNo(String id);
	 */
	
	@Select("SELECT no,reserve_date,reserve_time FROM reserve_info_inte WHERE ino=#{ino} AND id=#{id}")
	public InteReserveVO reserveDate(InteReserveVO vo);
	
	@Select("SELECT count(*) FROM RESERVE_INFO_INTE WHERE ino=#{ino} AND id=#{id}")
	public int reserveCheck(InteReserveVO vo);
	 
}
