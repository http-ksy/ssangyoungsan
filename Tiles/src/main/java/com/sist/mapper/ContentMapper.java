package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;
public interface ContentMapper {
	@Select("SELECT no,img,name,dprice,addr,rownum FROM (SELECT no,img,name,dprice,addr FROM estate_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=4")
	public List<EstateDetailVO> estateRandomList();
	
	
	
	
	// 청소
	@Select("SELECT cno,title,address,poster,carrer,rownum FROM (SELECT cno,title,address,poster,carrer FROM clean_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=4")
	public List<CleanVO> cleanRandomList();
	
	// 이사
	@Select("SELECT mno,title,address,poster,carrer,rownum FROM (SELECT mno,title,address,poster,carrer FROM move_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=4")
	public List<MoveVO> moveRandomList();
}
