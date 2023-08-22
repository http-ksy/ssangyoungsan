package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class ProductReplyDAO {
	@Autowired
	private ProductReplyMapper mapper;
	
	/*@Select("SELECT prno,no,id,name,msg,TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday "
			+ "FROM product_reply "
			+ "WHERE no=#{no}")*/
	public List<ProductReplyVO> replyListData(int no)
	{
		return mapper.replyListData(no);
	}
	
	/*@Insert("INSERT INTO product_reply VALUES("
			+ "pdr_prno_seq.nextval,#{no},#{id},#{name},#{msg},SYSDATE)")*/
	public void replyInsert(ProductReplyVO vo)
	{
		mapper.replyInsert(vo);
	}
	
	/*@Select("SELECT name,msg,rownum "
			+ "FROM product_reply "
			+ "WHERE no=#{no} AND rownum<=1")*/
	public ProductReplyVO productReplyData(int no)
	{
		return mapper.productReplyData(no);
	}
	
	//@Select("SELECT COUNT(*) FROM product_reply WHERE no=#{no}")
	public int productReplyCount(int no)
	{
		return mapper.productReplyCount(no);
	}
	
	//@Delete("DELETE FROM product_reply WHERE prno=#{prno}")
	public void replyDelete(int prno)
	{
		mapper.replyDelete(prno);
	}
	
	/*@Update("UPDATE product_reply SET "
			+ "msg=#{msg} "
			+ "WHERE prno=#{prno}")*/
	public void replyUpdate(ProductReplyVO vo)
	{
		mapper.replyUpdate(vo);
	}
	
}
