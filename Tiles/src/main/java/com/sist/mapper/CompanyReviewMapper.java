package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;

public interface CompanyReviewMapper {
	// 리스트
	@Select("SELECT no,id,cno,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
			+ "FROM company_review "
			+ "WHERE cno=#{no}")
	public List<CompanyReviewVO> companyReviewListData(int no);
	// 인설트
	@Insert("INSERT INTO company_review VALUES(cr_no_seq.nextval,#{id},#{cno},#{content},SYSDATE)")
	public void companyReviewInsert(CompanyReviewVO vo);
	// 딜리트
	@Delete("DELETE FROM company_review WHERE no=#{rno}")
	public void companyReviewDelete(int no);
	// 비밀번호 확인
	@Select("SELECT pwd FROM amem WHERE id=#{id}")
	public String companyReviewPwd(String id);
}
