package com.sist.mapper;

import com.sist.vo.MoveReplyVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface MoveReplyMapper {
    @Select("SELECT COUNT(*) FROM moveSpringRelpy WHERE mno=#{mno}")
    public int moveStringCount(int mno);
    @Select("SELECT /*+ INDEX_DESC(moveSpringRelpy csr_no_pk)*/no,mno,id,name,msg,TO_CHAR(regdate,'yyyy\"년\" mm\"월\" dd\"일\" hh24\"시\" mi\"분\" ss\"초\"') as dbday "
            + "FROM moveSpringRelpy "
            + "WHERE mno=#{mno}")
    public List<MoveReplyVO> moveReplyListData(int mno);

    @Insert("INSERT INTO moveSpringRelpy VALUES("
            + "csr_no_seq.nextval,#{mno},#{id},#{name},"
            + "#{msg},null,SYSDATE)")
    public void moveReplyInsert(MoveReplyVO vo);

    @Select("SELECT name,msg,user,rownum "
            + "FROM moveSpringRelpy "
            + "WHERE mno=#{mno} AND rownum<=1")
    public MoveReplyVO moveReplyData(int mno);
    // 수정
    @Update("UPDATE moveSpringRelpy SET "
            + "msg=#{msg} "
            + "WHERE no=#{no}")
    public void moveReplyUpdate(MoveReplyVO vo);
    // 삭제
    @Delete("DELETE FROM moveSpringRelpy WHERE no=#{no}")
    public void moveReplyDelete(int no);
}
