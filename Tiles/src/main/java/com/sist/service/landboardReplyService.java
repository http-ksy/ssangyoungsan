package com.sist.service;

import java.util.*;

import org.apache.ibatis.annotations.Update;

import com.sist.dao.*;
import com.sist.vo.*;

public interface landboardReplyService {
	public List<landboardReplyVO> boardReply_list(int bno);
	
	
	public void boardReply_insert(landboardReplyVO vo);
	
	public void boardReply_delete(int no,int root);
	

//	@Update("update landboardreply set content=${content} where no=#{no}")
	public void replyUpdate(Map map);
	
	public void replyAddReply(Map map);
}
