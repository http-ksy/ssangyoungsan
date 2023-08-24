package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.CleanDAO;
import com.sist.dao.MoveDAO;
import com.sist.vo.CleanVO;
import com.sist.vo.MoveJjimVO;
import com.sist.vo.MoveVO;
@Service
public class MoveServiceImpl implements MoveService {
	@Autowired
	private MoveDAO dao;
	@Override
	public List<MoveVO> MoveListData(Map map) {
		return dao.MoveListData(map);
	}

	@Override
	public int MoveTotalPage() {
		return dao.MoveTotalPage();
	}

	@Override
	public MoveVO MoveDetailData(int mno) {
		return dao.MoveDetailData(mno);
	}

	@Override
	public List<MoveVO> moveFindData(Map map) {
		// TODO Auto-generated method stub
		return dao.moveFindData(map);
	}

	@Override
	public int moveFindTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.moveFindTotalPage(map);
	}

	@Override
	public void moveJjimInsert(MoveJjimVO vo) {
		// TODO Auto-generated method stub
		dao.moveJjimInsert(vo);
	}

	@Override
	public void moveJjimDelete(MoveJjimVO vo) {
		// TODO Auto-generated method stub
		dao.moveJjimDelete(vo);
	}

	@Override
	public int moveJjimOk(MoveJjimVO vo) {
		// TODO Auto-generated method stub
		return dao.moveJjimOk(vo);
	}
}
