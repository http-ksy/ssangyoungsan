package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.landboardDAO;
import com.sist.vo.landboardVO;

@Service
public class landboardServiceImpl implements landboardService{
	@Autowired
	private landboardDAO dao;
	
	@Override
	public void landboardInsert(landboardVO vo) {
		// TODO Auto-generated method stub
		dao.landboardInsert(vo);
	}

	@Override
	public List<landboardVO> landboard_list(Map map) {
		// TODO Auto-generated method stub
		return dao.landboard_list(map);
	}

	@Override
	public landboardVO landboard_detail(int no) {
		// TODO Auto-generated method stub
		dao.incrementHit(no);
		return dao.landboard_detail(no);
	}

	@Override
	public void landboard_update(landboardVO vo) {
		// TODO Auto-generated method stub
		dao.landboard_update(vo);
	}

	@Override
	public void landboard_delete(int no) {
		// TODO Auto-generated method stub
		dao.landboard_delete(no);
	}
	

}
