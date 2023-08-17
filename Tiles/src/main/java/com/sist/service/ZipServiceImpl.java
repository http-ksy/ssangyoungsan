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
	public List<AptVO> aptListData(Map map) {
		// TODO Auto-generated method stub
		return dao.aptListData(map);
	}

	@Override
	public AptVO aptDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.aptDetailData(no);
	}

	@Override
	public int aptTotalPage() {
		// TODO Auto-generated method stub
		return dao.aptTotalPage();
	}

	@Override
	public int apttotaldata() {
		// TODO Auto-generated method stub
		return dao.apttotaldata();
	}

	@Override
	public List<OpVO> opListData(Map map) {
		// TODO Auto-generated method stub
		return dao.opListData(map);
	}

	@Override
	public List<BunVO> bunListData(Map map) {
		// TODO Auto-generated method stub
		return dao.bunListData(map);
	}

	@Override
	public List<HouseVO> houseListData(Map map) {
		// TODO Auto-generated method stub
		return dao.houseListData(map);
	}

	@Override
	public List<RoomVO> roomListData(Map map) {
		// TODO Auto-generated method stub
		return dao.roomListData(map);
	}

}
