package com.sist.service;

import java.util.List;

import com.sist.vo.CompanyReviewVO;

public interface CompanyReviewService {
	public List<CompanyReviewVO> companyReviewListData(int no);
	
	public void companyReviewInsert(CompanyReviewVO vo);

}
