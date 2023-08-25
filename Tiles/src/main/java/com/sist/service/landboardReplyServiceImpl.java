package com.sist.service;

import java.util.List;

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

	@Override
	public void boardReply_insert(landboardReplyVO vo) {
		dao.boardReply_insert(vo);		
	}

}
