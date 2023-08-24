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

	
	
/*	@Insert("INSERT INTO reserve_info_food VALUES("
			+ "RIC_NO_SEQ,rcid=#{rcid},cno=#{cno},rday=#{rday},rtime=#{rtime},rinwon=#{rinwon},'y',SYSDATE)") */
	public void reserve_ok(ReserveCleanVO vo) {
		mapper.reserve_ok(vo);
	}
	
}
