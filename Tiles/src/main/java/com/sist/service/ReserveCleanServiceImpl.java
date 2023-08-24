package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.ReserveCleanDAO;
import com.sist.vo.ReserveCleanVO;
@Service
public class ReserveCleanServiceImpl implements ReserveCleanService{
	@Autowired
	private ReserveCleanDAO dao;
	@Override
	public String cleanReserveDay(int cno) {
		return dao.cleanReserveDay(cno);
	}

	@Override
	public String reserve_day_time(int rno) {
		// TODO Auto-generated method stub
		return dao.reserve_day_time(rno);
	}

	@Override
	public String reserve_get_time(int tno) {
		// TODO Auto-generated method stub
		return dao.reserve_get_time(tno);
	}

	@Override
	public void reserve_ok(ReserveCleanVO vo) {
		// TODO Auto-generated method stub
		dao.reserve_ok(vo);
	}

	@Override
	public List<ReserveCleanVO> reserveCleanInfoData(String rcid) {
		// TODO Auto-generated method stub
		return dao.reserveCleanInfoData(rcid);
	}

}
