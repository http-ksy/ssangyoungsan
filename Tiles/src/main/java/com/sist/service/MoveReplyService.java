package com.sist.service;

import com.sist.vo.CleanReplyVO;
import com.sist.vo.MoveReplyVO;

import java.util.List;

public interface MoveReplyService {
    public int moveStringCount(int mno);

    public List<MoveReplyVO> moveReplyListData(int mno);


    List<MoveReplyVO> moveListData(int mno);

    public void moveReplyInsert(MoveReplyVO vo);


    public MoveReplyVO moveReplyData(int mno);
    // 수정
    public void moveReplyUpdate(MoveReplyVO vo);
    // 삭제

    public void moveReplyDelete(int no);
}
