package com.sist.service;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ReserveCleanVO;

public interface ReserveCleanService {
	
	public String cleanReserveDay(int cno);
	
	
	public String reserve_day_time(int rno);
	
	
	public String reserve_get_time(int tno);
	
	
	public void reserve_ok(ReserveCleanVO vo);
	
	public List<ReserveCleanVO> reserveCleanInfoData(String rcid);
}
