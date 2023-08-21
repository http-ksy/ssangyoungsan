package com.sist.service;

import com.sist.dao.CleanReplyDAO;
import com.sist.vo.CleanReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CleanReplyServiceImpl implements CleanReplyService{
    @Autowired
    private CleanReplyDAO dao;
    @Override
    public int cleanStringCount(int cno) {
        return dao.cleanStringCount(cno);
    }

    @Override
    public List<CleanReplyVO> cleanReplyListData(int cno) {
        return dao.cleanReplyListData(cno);
    }

    @Override
    public void cleanReplyInsert(CleanReplyVO vo) {
        dao.cleanReplyInsert(vo);
    }

    @Override
    public CleanReplyVO cleanReplyData(int cno) {
        return dao.cleanReplyData(cno);
    }

    @Override
    public void cleanReplyUpdate(CleanReplyVO vo) {
        dao.cleanReplyUpdate(vo);
    }

    @Override
    public void cleanReplyDelete(int no) {
        dao.cleanReplyDelete(no);
    }
}
