package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class ZipServiceImpl implements ZipService{
	@Autowired
	private ZipDAO dao;

	@Override
	public List<EstateDetailVO> EstateListData(Map map) {
		// TODO Auto-generated method stub
		return dao.estateListData(map);
	}

	@Override
	public EstateDetailVO EstateDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.estateDetailData(no);
	}

	@Override
	public int EstateTotalPage(int etype) {
		// TODO Auto-generated method stub
		return dao.estateTotalPage(etype);
	}

	@Override
	public int EstateTotalData() {
		// TODO Auto-generated method stub
		return dao.estateTotalData();
	}

	
	
	

}
