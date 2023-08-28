package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;
public interface ContentMapper {
	@Select("SELECT no,img,name,dprice,addr,rownum FROM (SELECT no,img,name,dprice,addr FROM estate_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=5")
	public List<EstateDetailVO> estateRandomList();
	
	
	
	
	// 청소
	@Select("SELECT cno,title,address,poster,carrer,rownum FROM (SELECT cno,title,address,poster,carrer FROM clean_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=5")
	public List<CleanVO> cleanRandomList();
	
	// 이사
	@Select("SELECT mno,title,address,poster,carrer,rownum FROM (SELECT mno,title,address,poster,carrer FROM move_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=5")
	public List<MoveVO> moveRandomList();
	
	//인테리어
	@Select("SELECT ino,title,poster,gubun,price,rownum FROM (SELECT ino,title,poster,gubun,price FROM inte_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <= 5")
	public List<InteVO> inteRandomList();
	
	// 스토어
	@Select("SELECT no,title,poster,brand,original_pri,rownum FROM (SELECT no,title,poster,brand,original_pri FROM gagu_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <= 5")
	public List<ProductVO> productRandomList();
}
