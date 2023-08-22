package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
