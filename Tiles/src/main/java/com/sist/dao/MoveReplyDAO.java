package com.sist.dao;

import com.sist.mapper.MoveReplyMapper;
import com.sist.vo.CleanReplyVO;
import com.sist.vo.MoveReplyVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MoveReplyDAO {
    @Autowired
    private MoveReplyMapper mapper;

    public int moveStringCount(int mno){
        return mapper.moveStringCount(mno);
    }

    public List<MoveReplyVO> moveReplyListData(int mno){
        return mapper.moveReplyListData(mno);
    }


    public void moveReplyInsert(MoveReplyVO vo){
        mapper.moveReplyInsert(vo);
    }


    public MoveReplyVO moveReplyData(int mno){
        return mapper.moveReplyData(mno);
    }
    // 수정
    public void moveReplyUpdate(MoveReplyVO vo){
        mapper.moveReplyUpdate(vo);
    }
    // 삭제

    public void moveReplyDelete(int no){
        mapper.moveReplyDelete(no);
    }

}
