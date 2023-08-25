package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ProductReplyVO;
public interface ProductReplyMapper {
//	@Select("SELECT COUNT(*) FROM product_reply WHERE no=#{no}")
//	public int productReplyCount(int no);
	
//	@Select("SELECT name,msg,rownum "
//			+ "FROM product_reply "
//			+ "WHERE no=#{no} AND rownum<=1")
//	public ProductReplyVO productReplyData(int no);
	
	@Select("SELECT /*+ INDEX_DESC(product_reply pdr_pno_pk)*/pno,no,id,name,msg,TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday,type "
			+ "FROM product_reply "
			+ "WHERE no=#{no} AND type=#{type}")
	public List<ProductReplyVO> replyListData(Map map);
	
	@Insert("INSERT INTO product_reply VALUES("
			+ "pdr_pno_seq.nextval,#{no},#{id},#{name},#{msg},SYSDATE,#{type})")
	public void replyInsert(ProductReplyVO vo);

	@Delete("DELETE FROM product_reply WHERE pno=#{pno}")
	public void replyDelete(int pno);
	
	@Update("UPDATE product_reply SET "
			+ "msg=#{msg} "
			+ "WHERE pno=#{pno}")
	public void replyUpdate(ProductReplyVO vo);	
}
