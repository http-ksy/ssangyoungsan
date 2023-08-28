package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.notificationVO;
import com.sist.mapper.*;
@Repository
public class notificationDAO {
	@Autowired
	private notificationMapper mapper;
//	@Select("select no,id,name,hit,type,subject,content,to_char(regdate,'yy-mm-dd')as dbday,num"
//			+ " from (select no,id,name,hit,type,subject,content,regdate, rownum as num "
//			+ "from (select no,id,name,hit,type,subject,content,regdate from "
//			+ "land_notice order by no desc)) "
//			+ "where num between #{start} and #{end} ")
	public List<notificationVO> noticeList(Map map){
		return mapper.noticeList(map);
	}
	
	// update 수정
//	@Update("update land_notice set content=#{content}, subject=#{subject} where no=#{no}")
	public void landnoticeUpdate(notificationVO vo) {
		mapper.landnoticeUpdate(vo);
	}
	
	// delete
//	@Delete("delete from land_notice where no=#{no}")
	public void landnoticeDelete(int no) {
		mapper.landnoticeDelete(no);
	}
	
	
	// insert 
//	@Insert("Insert into land_notice(no,id,name,type,subject,content,regdate,hit) "
//			+ "values(ln_no_seq.nextval,#{id},#{name},#{type},#{subject},#{content},sysdate,0)")
	public void landnoticeInsert(notificationVO vo) {
		mapper.landnoticeInsert(vo);
	}
	
	// detail
//	@Update("update land_notice set hit=hit+1 where no=#{no}")
	public void landnoticeHitIncre(int no) {
		mapper.landnoticeHitIncre(no);
	}
	
//	@Select("select * from land_notice where no=#{no}")
	public notificationVO landnoticeDetail(int no) {
		return mapper.landnoticeDetail(no);
	}
//	@Select("select ceil(count(*)/10.0) from land_notice")
	public int landnoticeTotalpage() {
		return mapper.landnoticeTotalpage();
	}
}
