package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

//	삭제 !!!!!!!!!!!!!!
	@Override
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
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
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void replyAddReply(int no,landboardReplyVO addvo) {
		// 댓글달 댓글번호 no , 내용(content)+id(session), nickname(session),bno -> map
		// TODO Auto-generated method stub
		// 위에 댓글 정보 읽어오기
		landboardReplyVO vo = dao.reply_info(no);
		
		// 중간에 삽입시 step 증가//
		Map step_up = new HashMap();
		step_up.put("group_id",vo.getGroup_id());
		step_up.put("group_step",vo.getGroup_step());
		step_up.put("group_tab",vo.getGroup_tab());
		// update 
		dao.landboardReplyreUpdate(step_up);
		//////////////////////////////////////
		
		
		// insert 댓글 추가
		// #{group_id},#{group_step},#{group_tab},#{root})이 값들을 최신화 해서 올려야함
		/*
		 *  ps.setInt(7, gi);
			ps.setInt(8, gs+1);
			ps.setInt(9, gt+1);
			ps.setInt(10, pno);
		 */
		addvo.setGroup_id(vo.getGroup_id());
		addvo.setGroup_step(vo.getGroup_step()+1);
		addvo.setGroup_tab(vo.getGroup_tab()+1);
		addvo.setRoot(no);
		dao.landboardReplyreInsert(addvo);
		
		// 위에 댓글에 depth 증가 -> 직계 댓글 갯수
		dao.landboardReplyreDepthIncrement(no);
	}

}
