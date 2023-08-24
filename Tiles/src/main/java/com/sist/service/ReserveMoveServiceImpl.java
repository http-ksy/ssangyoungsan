package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.ReserveMoveDAO;
import com.sist.vo.ReserveMoveVO;
@Service
public class ReserveMoveServiceImpl implements ReserveMoveService {
	@Autowired
	private ReserveMoveDAO dao;
	@Override
	public void reserve_ok(ReserveMoveVO vo) {
		// TODO Auto-generated method stub
		dao.reserve_ok(vo);
	}

}
