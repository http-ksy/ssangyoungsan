package com.sist.service;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public interface landboardReplyService {
	public List<landboardReplyVO> boardReply_list(int bno);
	
	
	public void boardReply_insert(landboardReplyVO vo);
}
