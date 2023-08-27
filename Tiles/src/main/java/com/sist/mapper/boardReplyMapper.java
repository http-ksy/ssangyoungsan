package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	//////////////////////// 삭제 ///////////////////////////
	@Select("select depth,root from landboardreply where no=#{no}")
	public landboardReplyVO checkDepthRoot(int no);
	
	@Update("update landboardreply set content='관리자가 삭제한 댓글입니다.' where no=#{no}")
	public void replyDeleteYesDepth(int no);
	
	
	@Delete("delete from landboardreply where no=#{no}") 
	public void replyDeleteNoDepth(int no);
	
	@Update("update landboardreply set depth=depth-1 where no=#{no}")
	public void replyDecrementDepth(int no);
	//////////////////////// 삭제 ///////////////////////////
	
	//////////////////////// 수정 ///////////////////////////
	@Update("update landboardreply set content=#{content} where no=#{no}")
	public void replyUpdate(Map map);
	
	/////////////////////////////////////////////////////////
	// 대댓글 추가 
	// 바로 댓글달 댓글 바로위
	@Select("select * from landboardreply where no=#{no}")
	public landboardReplyVO reply_info(int no);
	
	// 중간에 대댓글 들어오면 중간아래것들은 +1 해줘야 출력 순서가 밀린다.
	@Update("update landboardreply set group_step=group_step where group_id=#{group_id} and group_step>#{group_step}")
	public void landboardReplyreUpdate(Map map);
	
	// insert @@@@
	@Insert("insert into landboardreply(no,bno,id,nickname,content,group_id,group_step,"
			+ "group_tab,root) values(lbr_no_seq.nextval,#{bno},#{id},#{nickname},#{content},"
			+ "#{group_id},#{group_step},#{group_tab},#{root})")
	public void landboardReplyreInsert(landboardReplyVO vo);
	
	//depth -> +1 자기 댓글 밑에 대댓글 갯수
	@Update("update landboardreply set depth=depth+1 where no=#{no}")
	public void landboardReplyreDepthIncrement(int no);
}
