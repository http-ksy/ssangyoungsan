package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ReserveCleanMapper;
import com.sist.mapper.ReserveMoveMapper;
import com.sist.vo.ReserveMoveVO;
@Repository
public class ReserveMoveDAO {
	@Autowired
	private ReserveMoveMapper mapper;
	
	public void reserve_ok(ReserveMoveVO vo) {
		mapper.reserve_ok(vo);
	}
}
