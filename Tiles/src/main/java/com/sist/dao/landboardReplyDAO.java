package com.sist.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.boardReplyMapper;
import com.sist.vo.landboardReplyVO;

@Repository
public class landboardReplyDAO {
	@Autowired
	private boardReplyMapper mapper;
//	@Select("select no,nickname,content,to_char(regdate,'yy-mm-dd') as dbday,group_tab"
//			+ " from landboardreply"
//			+ "where bno=#{bno} "
//			+ "order by group_id desc and group_step")
	
	public List<landboardReplyVO> boardReply_list(int bno) {
		return mapper.boardReply_list(bno);
	}

	
//	@Insert("insert into landboardreply(no,bno,content,nickname,regdate) "
//			+ "values(lbr_no_seq.nextval,#{bno},#{content},#{nickname},#{regdate})")
	public void boardReply_insert(landboardReplyVO vo) {
		mapper.boardReply_insert(vo);
	}
	public landboardReplyVO checkDepthRoot(int no){
		return mapper.checkDepthRoot(no);
	}
//	@Update("update landboardreply set content='관리자가 삭제한 댓글입니다.' where no=#{no}")
	public void replyDeleteYesDepth(int no) {
		mapper.replyDeleteYesDepth(no);
	}
	
//	@Delete("delete from landboardreply where no=#{no}") 
	public void replyDeleteNoDepth(int no) {
		mapper.replyDeleteNoDepth(no);
	}
	
//	@Update("update landboardreply set depth=depth-1 where no=#{no}")
	public void replyDecrementDepth(int no) {
		mapper.replyDecrementDepth(no);
	}
	
//	@Update("update landboardreply set content=${content} where no=#{no}")
	public void replyUpdate(Map map) {
		mapper.replyUpdate(map);
	}
	
	////////////////////// 대댓글 ///////////////////////////// 
//	@Select("select group_id,group_step,group_tab from landboardreply where no=#{no}")
	public landboardReplyVO reply_info(int no) {
		return mapper.reply_info(no);
	}
//	@Update("update landboardreply set group_step=group_step where group_id=#{group_id} and group_step>#{group_step}")
	public void landboardReplyreUpdate(Map map) {
		mapper.landboardReplyreUpdate(map);
	}
	
	// insert @@@@
//	@Insert("insert into landboardreply(no,bno,id,nickname,content,group_id,group_step,"
//			+ "group_tab,root) values(lbr_no_seq.nextval,#{bno},#{id},#{nickname},#{content},"
//			+ "#{group_id},#{group_step},#{group_tab},#{root})")
	public void landboardReplyreInsert(landboardReplyVO vo) {
		mapper.landboardReplyreInsert(vo);
	}
	
	//depth -> +1 자기 댓글 밑에 대댓글 갯수
//	@Update("update landboardreply depth = depth+1 where no=#{no}")
	public void landboardReplyreDepthIncrement(int no) {
		mapper.landboardReplyreDepthIncrement(no);
	}
}
