package com.sist.service;

import java.util.ArrayList;
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

	@Override
	public List<EstateDetailVO> zipbuy(String id) {
		// TODO Auto-generated method stub
		List<EstateDetailVO> list=new ArrayList<EstateDetailVO>();
		List<Integer> zlist=dao.zipbuy(id);
		for(Integer zvo:zlist)
		{
			list.add(dao.estateDetailData(zvo));
		}
		return list;
	}

	@Override
	public void zipbuyInsert(Map map,int no) {
		// TODO Auto-generated method stub
		dao.zipbuyInsert(map);
		dao.zipbuyTypeUpdate(no);
	}

	@Override
	public void zipZim(zipZimVO vo) {
		// TODO Auto-generated method stub
		dao.zipZim(vo);
	}

	@Override
	public int zipZimCheck(zipZimVO vo) {
		// TODO Auto-generated method stub
		return dao.zipZimCheck(vo);
	}

	@Override
	public void zipZimDelete(zipZimVO vo) {
		// TODO Auto-generated method stub
		dao.zipZimDelete(vo);
	}

	@Override
	public List<EstateDetailVO> zipZimList(String id) {
		// TODO Auto-generated method stub
		List<EstateDetailVO> list=new ArrayList<EstateDetailVO>();
		List<Integer> zlist=dao.zipZimList(id);
		for(Integer zvo:zlist)
		{
			list.add(dao.estateDetailData(zvo));
		}
		return list;
	}

	
	
	
	
}
