package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ReserveCleanVO;

public interface ReserveCleanMapper {
	@Select("SELECT reserve_day FROM clean_detail "
			+ "WHERE cno=#{cno}")
	public String cleanReserveDay(int cno);
	
	@Select("SELECT time FROM reserve_day "
			+ "WHERE rno=#{rno}")
	public String reserve_day_time(int rno);
	
	@Select("SELECT time FROM reserve_time "
			+ "WHERE tno=#{tno}")
	public String reserve_get_time(int tno);
	
	@Insert("INSERT INTO reserve_info_food VALUES("
			+ "RIC_NO_SEQ,rcid=#{rcid},cno=#{cno},rday=#{rday},rtime=#{rtime},rinwon=#{rinwon},'y',SYSDATE)")
	public void reserve_ok(ReserveCleanVO vo);
	
	@Select("SELECT rcno,cno,rday,rtime,inwon,TO_CHAR(regdate,'yyyy-MM-dd hh24:mi:ss'),"
			+ "cleanGetPoster(cno),cleanGetTitle(cno),foodGetAddress(cno),rok,rcid "
			+ "FROM reserve_info_clean "
			+ "WHERE rcid=#{rcid} "
			+ "ORDER BY rcno DESC")
	public List<ReserveCleanVO> reserveCleanInfoData(String rcid);
}
