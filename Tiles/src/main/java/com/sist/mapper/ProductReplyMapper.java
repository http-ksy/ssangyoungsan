package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ProductReplyVO;
public interface ProductReplyMapper {
	@Select("SELECT COUNT(*) FROM product_reply WHERE no=#{no}")
	public int productReplyCount(int no);
	
	@Select("SELECT name,msg,rownum "
			+ "FROM product_reply "
			+ "WHERE no=#{no} AND rownum<=1")
	public ProductReplyVO productReplyData(int no);
	
	@Select("SELECT /*+ INDEX_DESC(product_reply pdr_prno_pk)*/prno,no,id,name,msg,TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday "
			+ "FROM product_reply "
			+ "WHERE no=#{no}")
	public List<ProductReplyVO> replyListData(int no);
	
	@Insert("INSERT INTO product_reply VALUES("
			+ "pdr_prno_seq.nextval,#{no},#{id},#{name},#{msg},SYSDATE)")
	public void replyInsert(ProductReplyVO vo);
	
	@Update("UPDATE product_reply SET "
			+ "msg=#{msg} "
			+ "WHERE prno=#{prno}")
	public void replyUpdate(ProductReplyVO vo);
	
	@Delete("DELETE FROM product_reply WHERE prno=#{prno}")
	public void replyDelete(int prno);
}
