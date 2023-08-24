package com.sist.dao;

import com.sist.mapper.CleanReplyMapper;
import com.sist.vo.CleanReplyVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CleanReplyDAO {
    @Autowired
    private CleanReplyMapper mapper;

    public int cleanStringCount(int cno){
        return mapper.cleanStringCount(cno);
    }

    public List<CleanReplyVO> cleanReplyListData(int cno){
        return mapper.cleanReplyListData(cno);
    }

    public void cleanReplyInsert(CleanReplyVO vo){
        mapper.cleanReplyInsert(vo);
    }

    public CleanReplyVO cleanReplyData(int cno){
        return mapper.cleanReplyData(cno);
    }
    // 수정

    public void cleanReplyUpdate(CleanReplyVO vo){
        mapper.cleanReplyUpdate(vo);
    }
    // 삭제

    public void cleanReplyDelete(int no){
        mapper.cleanReplyDelete(no);
    }

}
