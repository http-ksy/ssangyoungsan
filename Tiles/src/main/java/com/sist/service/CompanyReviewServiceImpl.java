package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.CompanyReviewDAO;
import com.sist.vo.CompanyReviewVO;

@Service
public class CompanyReviewServiceImpl implements CompanyReviewService{
	@Autowired
	private CompanyReviewDAO dao;

	@Override
	public List<CompanyReviewVO> companyReviewListData(int no) {
		// TODO Auto-generated method stub
		return dao.companyReviewListData(no);
	}

	@Override
	public void companyReviewInsert(CompanyReviewVO vo) {
		// TODO Auto-generated method stub
		dao.companyReviewInsert(vo);
	}

	@Override
	public void companyReviewDelete(int rno) {
		// TODO Auto-generated method stub
		dao.companyReviewDelete(rno);
	}

	@Override
	public String companyReviewPwd(String id) {
		// TODO Auto-generated method stub
		return dao.companyReviewPwd(id);
	}
	
}
