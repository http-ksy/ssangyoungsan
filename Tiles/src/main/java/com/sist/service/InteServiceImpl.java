package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.mapper.*;
import com.sist.vo.*;

@Service
public class InteServiceImpl implements InteService {
	@Autowired
	private InteDAO dao;
	
	@Override
	public InteVO inteDetailData(int ino) {
		return dao.inteDetailData(ino);
	}

	@Override
	public List<InteReplyVO> InteReplyListData(int ino) {
		return dao.InteReplyListData(ino);
	}

	@Override
	public void InteReplyInsert(InteReplyVO vo) {
		dao.InteReplyInsert(vo);
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
