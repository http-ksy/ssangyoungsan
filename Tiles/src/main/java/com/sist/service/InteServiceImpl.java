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

	@Override
	public void inteReplyDelete(int no) {
		dao.inteReplyDelete(no);
		
	}

	@Override
	public void inteReplyUpdate(InteReplyVO vo) {
		dao.inteReplyUpdate(vo);
	}

	@Override
	public void inteLikeInsert(InteLikeVO vo) {
		dao.inteLikeInsert(vo);
		
	}

	@Override
	public void inteLikeDelete(InteLikeVO vo) {
		dao.inteLikeDelete(vo);
		
	}

	@Override
	public int inteLikeOk(InteLikeVO vo) {
		return dao.inteLikeOk(vo);
	}

	@Override
	public String InteReserveDay(int ino) {
		return dao.InteReserveDay(ino);
	}

	@Override
	public String reserve_day_time(int rno) {
		return dao.reserve_day_time(rno);
	}

	@Override
	public String reserve_get_time(int tno) {
		return dao.reserve_get_time(tno);
	}

	@Override
	public void reserveOk(InteReserveVO vo) {
		dao.reserveOk(vo);
		//return dao.reserveNo(vo.getId());
	}

	@Override
	public String reserveNo(String id) {
		return dao.reserveNo(id);
	}

	@Override
	public int reserveCheck(InteReserveVO vo) {
		return dao.reserveCheck(vo);
	}

	@Override
	public InteReserveVO reserveDate(String id) {
		return dao.reserveDate(id);
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
