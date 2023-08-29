package com.sist.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.CompanyReviewVO;

public interface CompanyReviewService {
	public List<CompanyReviewVO> companyReviewListData(int no);
	
	public void companyReviewInsert(CompanyReviewVO vo);
//	@Delete("DELETE FROM company_review WHERE no=#{no}")
	public void companyReviewDelete(int rno);
	// 비밀번호 확인
//	@Select("SELECT pwd FROM amem WHERE id=#{id}")
	public String companyReviewPwd(String id);
}
