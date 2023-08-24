package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;
public interface ContentMapper {
	@Select("SELECT no,img,name,dprice,addr,rownum FROM (SELECT no,img,name,dprice,addr FROM estate_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=4")
	public List<EstateDetailVO> estateRandomList();
}
