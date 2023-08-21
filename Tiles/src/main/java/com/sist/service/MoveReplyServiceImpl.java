package com.sist.service;

import com.sist.dao.MoveReplyDAO;
import com.sist.vo.MoveReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoveReplyServiceImpl implements MoveReplyService{
    @Autowired
    private MoveReplyDAO dao;

    @Override
    public int moveStringCount(int mno) {
        return dao.moveStringCount(mno);
    }

    @Override
    public List<MoveReplyVO> moveReplyListData(int mno) {
        return dao.moveReplyListData(mno);
    }

    @Override
    public List<MoveReplyVO> moveListData(int mno) {
        return dao.moveReplyListData(mno);
    }

    @Override
    public void moveReplyInsert(MoveReplyVO vo) {
        dao.moveReplyInsert(vo);
    }

    @Override
    public MoveReplyVO moveReplyData(int mno) {
        return dao.moveReplyData(mno);
    }

    @Override
    public void moveReplyUpdate(MoveReplyVO vo) {
        dao.moveReplyUpdate(vo);
    }

    @Override
    public void moveReplyDelete(int no) {
        dao.moveReplyDelete(no);
    }
}
