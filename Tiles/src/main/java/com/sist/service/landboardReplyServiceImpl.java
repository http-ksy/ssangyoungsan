package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.landboardReplyDAO;
import com.sist.vo.landboardReplyVO;

@Service
public class landboardReplyServiceImpl implements landboardReplyService{
	@Autowired
	private landboardReplyDAO dao;
	@Override
	public List<landboardReplyVO> boardReply_list(int bno) {
		// TODO Auto-generated method stub
		return dao.boardReply_list(bno);
	}

	// 그냥 댓글 입력
	@Override
	public void boardReply_insert(landboardReplyVO vo) {
		dao.boardReply_insert(vo);		
	}

	@Override
	public void boardReply_delete(int no, int root) {
		// TODO Auto-generated method stub
		landboardReplyVO vo = dao.checkDepthRoot(no);
		if(vo.getDepth()==0) {
			dao.replyDeleteNoDepth(no);
		} else {
			dao.replyDeleteYesDepth(no);
		}
		// depth 감소
		dao.replyDecrementDepth(root);
	}

	@Override
	public void replyUpdate(Map map) {
		// TODO Auto-generated method stub
		dao.replyUpdate(map);
	}

	@Override
	public void replyAddReply(Map map) {
		// TODO Auto-generated method stub
		landboardReplyVO vo = dao.reply_info(map);
		
	}

}
