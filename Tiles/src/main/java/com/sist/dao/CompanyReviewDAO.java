package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.CompanyReviewVO;
@Repository
public class CompanyReviewDAO {
	@Autowired
	private CompanyReviewMapper mapper;
	
	// 리스트
//		@Select("SELECT no,id,cno,content,CHAR_TO(regdate,'YYYY-MM-DD') as dbday"
//				+ "FROM company_review "
//				+ "WHERE cno=#{no}")
		public List<CompanyReviewVO> companyReviewListData(int no)
		{
			return mapper.companyReviewListData(no);
		}
		// 인설트
//		@Insert("INSERT INTO company_review VALUE(cr_no_seq.nextval,#{id},#{cno},#{content},SYSDATE)")
		public void companyReviewInsert(CompanyReviewVO vo)
		{
			mapper.companyReviewInsert(vo);
		}
}
