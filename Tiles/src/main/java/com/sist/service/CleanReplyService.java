package com.sist.service;

import com.sist.vo.CleanReplyVO;

import java.util.List;

public interface CleanReplyService {
    public int cleanStringCount(int cno);

    public List<CleanReplyVO> cleanReplyListData(int cno);

    public void cleanReplyInsert(CleanReplyVO vo);

    public CleanReplyVO cleanReplyData(int cno);

    public void cleanReplyUpdate(CleanReplyVO vo);

    public void cleanReplyDelete(int no);
}
