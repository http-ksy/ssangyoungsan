package com.sist.service;
import java.util.*;
import com.sist.vo.*;

public interface notificationService {
	public List<notificationVO> noticeList(Map map);
	
	// update 수정
//	@Update("update land_notice set content=#{content}, subject=#{subject} where no=#{no}")
	public void landnoticeUpdate(notificationVO vo);
	
	// delete
//	@Delete("delete from land_notice where no=#{no}")
	public void landnoticeDelete(int no);
	
	
	// insert 
//	@Insert("Insert into land_notice(no,id,name,type,subject,content,regdate,hit) "
//			+ "values(ln_no_seq.nextval,#{id},#{name},#{type},#{subject},#{content},sysdate,0)")
	public void landnoticeInsert(notificationVO vo);
	
	// detail
//	@Update("update land_notice set hit=hit+1 where no=#{no}")
	
	
//	@Select("select * from land_notice where no=#{no}")
	public notificationVO landnoticeDetail(int no);
	
	public PageVO landnotice_page(int page);
}
