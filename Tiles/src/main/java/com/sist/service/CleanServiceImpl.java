package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.CleanDAO;
import com.sist.vo.CleanJjimVO;
import com.sist.vo.CleanVO;
@Service
public class CleanServiceImpl implements CleanService {
	@Autowired
	private CleanDAO dao;
	@Override
	public List<CleanVO> CleanListData(Map map) {
		return dao.CleanListData(map);
	}

	@Override
	public int CleanTotalPage() {
		return dao.CleanTotalPage();
	}

	@Override
	public CleanVO CleanDetailData(int cno) {
		return dao.CleanDetailData(cno);
	}

	@Override
	public List<CleanVO> cleanFindData(Map map) {
		// TODO Auto-generated method stub
		return dao.cleanFindData(map);
	}

	@Override
	public int cleanFindTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.cleanFindTotalPage(map);
	}

	@Override
	public void cleanJjimInsert(CleanJjimVO vo) {
		// TODO Auto-generated method stub
		dao.cleanJjimInsert(vo);
	}

	@Override
	public void cleanJjimDelete(CleanJjimVO vo) {
		// TODO Auto-generated method stub
		dao.cleanJjimDelete(vo);
	}

	@Override
	public int cleanJjimOk(CleanJjimVO jvo) {
		System.out.println(jvo.getNo());
		return dao.cleanJjimOk(jvo);
	}

}
