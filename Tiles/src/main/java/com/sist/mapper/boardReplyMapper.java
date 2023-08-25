package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.landboardReplyVO;

public interface boardReplyMapper {
	
	// group_step -> 밑에 있는 댓글수 0부터 시작
	// group_tap => 들여쓰기
	// root , dept -> 삭제
	@Select("select no,id,nickname,content,to_char(regdate,'yy-mm-dd:hh:mi:ss') as dbday,group_tab"
			+ " from landboardreply "
			+ "where bno=#{bno} "
			+ "order by group_id desc, group_step asc")
	
	public List<landboardReplyVO> boardReply_list(int bno);
	
	@Insert("insert into landboardreply(no,bno,content,id,nickname,regdate,group_id) "
			+ "values(lbr_no_seq.nextval,#{bno},#{content},#{id},#{nickname},sysdate,"
			+ "(select nvl(max(group_id),0)+1 from landboardreply))")
	public void boardReply_insert(landboardReplyVO vo);
	
//	@Delete("delete from landboard where  ")
	
	@Select("select dept,root from landboardreply where no=#{no}")
	public List<landboardReplyVO> checkDeptRoot(int no);
}
