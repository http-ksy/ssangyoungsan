package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.InteVO;

@Service
public class InteServiceImpl implements InteService {
	@Autowired
	private InteDAO dao;
	
	@Override
	public InteVO inteDetailData(int no) {
		return dao.inteDetailData(no);
	}
	

/*	@Override
	public List<InteVO> inteListData(Map map) {
		return dao.inteListData(map);
	}

	@Override
	public int inteTotalPage() {
		return dao.inteTotalPage();
	}
	*/
	
}
