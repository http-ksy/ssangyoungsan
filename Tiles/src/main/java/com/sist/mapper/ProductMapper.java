package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	 
	// 상세페이지
	public ProductVO productDetailData(Map map);

	// 장바구니	
	@Insert("INSERT INTO product_cart VALUES("
			+ "pdc_cno_seq.nextval,#{no},#{type},#{id},#{poster},#{title},#{brand},#{delivery_pri},#{total_pri},#{amount},#{original_pri},#{priced_sale},'n')")
	public void cartInsert(ProductCartVO vo);
		
	@Select("SELECT /*+ INDEX_DESC(product_cart pdc_cno_pk)*/cno,no,type,id,poster,title,brand,delivery_pri,total_pri,amount,original_pri,priced_sale,buy "
			+ "FROM product_cart "
			+ "WHERE id=#{id} AND buy='n'")
	public List<ProductCartVO> cartListData(Map map);
	
	// 장바구니 삭제
	@Delete("DELETE FROM product_cart WHERE cno=#{cno}")
	public void cartDelete(int cno);
	
	@Delete("DELETE FROM product_cart WHERE id=#{id}")
	public void cartAllDelete(String id);
	
	// 장바구니 중복체크
	@Update("UPDATE product_cart SET "
			+ "amount=(amount+#{amount}),total_pri=(total_pri+#{total_pri}) "
			+ "WHERE no=#{no} AND type=#{type}")
	public void cartUpdate(ProductCartVO vo);
	
	@Select("SELECT count(amount) FROM product_cart WHERE no=#{no} AND type=#{type}")
	public int cartCheck(Map map);

    // 장바구니 => 결제화면
	@Update("UPDATE product_cart SET buy='d' WHERE cno=#{cno}")
	public void cartBuyUpdate(int cno);
	
	// 결제화면 => 결제완료
	@Update("UPDATE product_cart SET buy='y' WHERE id=#{id} AND buy='d'")
	public void finalBuyUpdate(String id);
	
	
	@Select("SELECT cno,no,type,id,poster,title,brand,total_pri,amount "
			+ "FROM product_cart WHERE id=#{id} and buy='y'")
	public List<ProductCartVO> buyListData(Map map);
}