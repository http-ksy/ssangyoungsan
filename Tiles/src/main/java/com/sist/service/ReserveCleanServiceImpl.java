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
	public void reserve_ok(ReserveCleanVO vo) {
		// TODO Auto-generated method stub
		dao.reserve_ok(vo);
	}

}
