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
	
	/*@Select("SELECT + INDEX_DESC(product_reply pdr_pno_pk)pno,no,id,name,msg,TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday "
			+ "FROM product_reply "
			+ "WHERE no=#{no}")*/
	public List<ProductReplyVO> replyListData(Map map)
	{
		return mapper.replyListData(map);
	}
	
	/*@Insert("INSERT INTO product_reply VALUES("
			+ "pdr_pno_seq.nextval,#{no},#{id},#{name},#{msg},SYSDATE)")*/
	public void replyInsert(ProductReplyVO vo)
	{
		mapper.replyInsert(vo);
	}
	
	//@Delete("DELETE FROM product_reply WHERE pno=#{pno}")
	public void replyDelete(int pno)
	{
		mapper.replyDelete(pno);
	}
	
	/*@Update("UPDATE product_reply SET "
			+ "msg=#{msg} "
			+ "WHERE pno=#{pno}")*/
	public void replyUpdate(ProductReplyVO vo)
	{
		mapper.replyUpdate(vo);
	}
}
