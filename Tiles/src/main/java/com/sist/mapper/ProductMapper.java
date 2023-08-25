package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.ProductVO;

public interface ProductMapper {
/*
 *   <select id="productListData" resultType="ProductVO" parameterType="hashmap">
	    SELECT no,poster,brand,title,original_pri,num 
	    FROM (SELECT no,poster,brand,title,original_pri,rownum as num
	    FROM (SELECT no,poster,brand,title,original_pri
	    FROM ${table_name} ORDER BY no ASC))
	    WHERE num BETWEEN #{start} AND #{end}
	  </select>
 */
	public List<ProductVO> productListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/21.0) FROM ${table_name}")
	public int productTotalPage(Map map);
	
	public List<ProductVO> productFindData(Map map);
	public int productFindCount(Map map);
	/*
	 *  private String poster,title,original_pri,sale,priced_sale,brand,
		 	delivery_pri,score,detailposters;
		private int no,review_cnt;
	 */
	
//	@Select("SELECT no,title,original_pri FROM ${table_name} WHERE no=#{no}")
	public ProductVO productDetailData(Map map);
	
	public ProductVO productCartData(Map map);
}