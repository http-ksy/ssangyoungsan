package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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
	public List<landboardReplyVO> checkDeptRoot(int no){
		return mapper.checkDeptRoot(no);
	}
}
