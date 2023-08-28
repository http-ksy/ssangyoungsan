package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.PageVO;
import com.sist.vo.notificationVO;
import com.sist.dao.*;

@Service
public class notificationServiceImpl implements notificationService{
	
	@Autowired
	private notificationDAO dao;
	
	@Override
	public List<notificationVO> noticeList(Map map) {
		// TODO Auto-generated method stub
		return dao.noticeList(map);
	}

	@Override
	public void landnoticeUpdate(notificationVO vo) {
		// TODO Auto-generated method stub
		dao.landnoticeUpdate(vo);
	}

	@Override
	public void landnoticeDelete(int no) {
		// TODO Auto-generated method stub
		dao.landnoticeDelete(no);
	}

	@Override
	public void landnoticeInsert(notificationVO vo) {
		// TODO Auto-generated method stub
		dao.landnoticeInsert(vo);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public notificationVO landnoticeDetail(int no) {
		// TODO Auto-generated method stub
		dao.landnoticeHitIncre(no);
		return dao.landnoticeDetail(no);
	}
	
	@Override
	public PageVO landnotice_page(int page) {
		// TODO Auto-generated method stub
		// map -> page , bno
		PageVO vo = new PageVO();
		final int BLOCK = 10;
		int startPage = ((page-1)/BLOCK*BLOCK)+1;
		int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		vo.setTotalpage(dao.landnoticeTotalpage());
		vo.setCurpage(page);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		return vo;
	}

}
