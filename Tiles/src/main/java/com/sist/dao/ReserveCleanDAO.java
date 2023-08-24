package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ReserveCleanMapper;
import com.sist.vo.ReserveCleanVO;

@Repository
public class ReserveCleanDAO {
	@Autowired
	private ReserveCleanMapper mapper;

	
/*	@Select("SELECT reserve_day FROM clean_detail "
			+ "WHERE cno=#{cno}") */
	public String cleanReserveDay(int cno) {
		return mapper.cleanReserveDay(cno);
	}
	
/*	@Select("SELECT time FROM reserve_day "
			+ "WHERE rno=#{rno}") */
	public String reserve_day_time(int rno) {
		return mapper.reserve_day_time(rno);
	}
	
/*	@Select("SELECT time FROM reserve_time "
			+ "WHERE tno=#{tno}")*/
	public String reserve_get_time(int tno) {
		return mapper.reserve_get_time(tno);
	}
	
/*	@Insert("INSERT INTO reserve_info_food VALUES("
			+ "RIC_NO_SEQ,rcid=#{rcid},cno=#{cno},rday=#{rday},rtime=#{rtime},rinwon=#{rinwon},'y',SYSDATE)") */
	public void reserve_ok(ReserveCleanVO vo) {
		mapper.reserve_ok(vo);
	}
	
/*	@Select("SELECT rcno,cno,rday,rtime,inwon,TO_CHAR(regdate,'yyyy-MM-dd hh24:mi:ss'),"
			+ "cleanGetPoster(cno),cleanGetTitle(cno),foodGetAddress(cno),rok,rcid "
			+ "FROM reserve_info_clean "
			+ "WHERE rcid=#{rcid} "
			+ "ORDER BY rcno DESC")*/
	public List<ReserveCleanVO> reserveCleanInfoData(String rcid){
		return mapper.reserveCleanInfoData(rcid);
	}
}
