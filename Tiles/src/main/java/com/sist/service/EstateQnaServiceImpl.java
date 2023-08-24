package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
@Service
public class EstateQnaServiceImpl implements EstateQnaService{
	@Autowired
	private EstateQnaDAO dao;

	@Override
	public String estateQnaInsert(Map map) {
		// TODO Auto-generated method stub
		dao.estateQnaInsert(map);
		String result="ok";
		return result;
	}

	@Override
	public String estateQnaUpdate(Map map) {
		// TODO Auto-generated method stub
		dao.estateQnaUpdate(map);
		String result="ok";
		return result;
	}

	@Override
	public List<EstateQnaVO> estateQnaCompanyListData(Map map) {
		// TODO Auto-generated method stub
		return dao.estateQnaCompanyListData(map);
	}

	@Override
	public List<EstateQnaVO> estateQnaUserListData(Map map) {
		// TODO Auto-generated method stub
		return dao.estateQnaUserListData(map);
	}

	@Override
	public int customerTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.customerTotalPage(map);
	}
	
}
