package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
import java.util.*;
/*
 * NO
ID
NAME
TYPE
SUBJECT
CONTENT
REGDATE
HIT
 */
public interface notificationMapper {
	
	// list
	@Select("select no,id,name,hit,type,subject,content,to_char(regdate,'yy-mm-dd')as dbday,num"
			+ " from (select no,id,name,hit,type,subject,content,regdate, rownum as num "
			+ "from (select no,id,name,hit,type,subject,content,regdate from "
			+ "land_notice order by no desc)) "
			+ "where num between #{start} and #{end} ")
	public List<notificationVO> noticeList(Map map);
	
	// update 수정
	@Update("update land_notice set content=#{content}, subject=#{subject} where no=#{no}")
	public void landnoticeUpdate(notificationVO vo);
	
	// delete
	@Delete("delete from land_notice where no=#{no}")
	public void landnoticeDelete(int no);
	
	
	// insert 
	@Insert("Insert into land_notice(no,id,name,type,subject,content,regdate,hit) "
			+ "values(ln_no_seq.nextval,#{id},#{name},0,#{subject},#{content},sysdate,0)")
	public void landnoticeInsert(notificationVO vo);
	
	// detail
	@Update("update land_notice set hit=hit+1 where no=#{no}")
	public void landnoticeHitIncre(int no);
	
	@Select("select no,id,name,type,subject,content,to_char(regdate,'yy-mm-dd')as dbday, hit from land_notice where no=#{no}")
	public notificationVO landnoticeDetail(int no);
	
	// totalpage
	@Select("select ceil(count(*)/10.0) from land_notice")
	public int landnoticeTotalpage();
}
