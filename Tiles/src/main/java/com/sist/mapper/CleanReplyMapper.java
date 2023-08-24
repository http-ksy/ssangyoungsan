package com.sist.mapper;
import java.util.*;

import com.sist.vo.CleanReplyVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CleanReplyMapper {
    @Select("SELECT COUNT(*) FROM cleanSpringRelpy WHERE cno=#{cno}")
    public int cleanStringCount(int cno);
    @Select("SELECT /*+ INDEX_DESC(cleanSpringRelpy csr_no_pk)*/no,cno,id,name,msg,TO_CHAR(regdate,'yyyy\"년\" mm\"월\" dd\"일\" hh24\"시\" mi\"분\" ss\"초\"') as dbday "
            + "FROM cleanSpringRelpy "
            + "WHERE cno=#{cno}")
    public List<CleanReplyVO> cleanReplyListData(int cno);

    @Insert("INSERT INTO cleanSpringRelpy VALUES("
            + "csr_no_seq.nextval,#{cno},#{id},#{name},"
            + "#{msg},null,SYSDATE)")
    public void cleanReplyInsert(CleanReplyVO vo);

    @Select("SELECT name,msg,user,rownum "
            + "FROM cleanSpringRelpy "
            + "WHERE cno=#{cno} AND rownum<=1")
    public CleanReplyVO cleanReplyData(int cno);
    // 수정
    @Update("UPDATE cleanSpringRelpy SET "
            + "msg=#{msg} "
            + "WHERE no=#{no}")
    public void cleanReplyUpdate(CleanReplyVO vo);
    // 삭제
    @Delete("DELETE FROM cleanSpringRelpy WHERE no=#{no}")
    public void cleanReplyDelete(int no);
}
