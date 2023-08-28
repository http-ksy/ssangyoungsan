package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ProductCartVO;
import com.sist.vo.ProductOrderVO;
import com.sist.vo.ProductReplyVO;
import com.sist.vo.ProductVO;

public interface ProductMapper {
	// 목록
	public List<ProductVO> productListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/21.0) FROM ${table_name}")
	public int productTotalPage(Map map);
	
	// 검색
	public List<ProductVO> productFindData(Map map);
	public int productFindCount(Map map);
	 
	// 상세
	public ProductVO productDetailData(Map map);

	// 장바구니	
	@Insert("INSERT INTO product_cart VALUES("
			+ "pdc_cno_seq.nextval,#{no},#{type},#{id},#{poster},#{title},#{brand},#{delivery_pri},#{total_pri},#{amount},#{original_pri},#{priced_sale})")
	public void cartInsert(ProductCartVO vo);
		
	@Select("SELECT /*+ INDEX_DESC(product_cart pdc_cno_pk)*/cno,no,type,id,poster,title,brand,delivery_pri,total_pri,amount,original_pri,priced_sale "
			+ "FROM product_cart "
			+ "WHERE id=#{id}")
	public List<ProductCartVO> cartListData(Map map);
	
	@Delete("DELETE FROM product_cart WHERE cno=#{cno}")
	public void cartDelete(int cno);
	
	@Delete("DELETE FROM product_cart WHERE id=#{id}")
	public void cartAllDelete(String id);
	
	// 결제
	@Insert("INSERT INTO product_order VALUES("
			+ "pdo_ono_seq.nextval,#{no},#{type},#{title},#{brand},#{poster},#{id},#{addr1},#{addr2},#{name},#{email},#{phone},#{select_pri},#{del_pri},#{final_pri})")
	public void orderInsert(ProductOrderVO vo);
	
	@Select("SELECT /*+ INDEX_DESC(product_order pdo_ono_pk)*/ono,no,type,title,brand,poster,id,addr1,addr2,name,email,phone,select_pri,del_pri,final_pri "
			+ "FROM product_order "
			+ "WHERE id=#{id}")
	public List<ProductOrderVO> orderListData(Map map);	

}