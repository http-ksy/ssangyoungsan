package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;

public interface FooterMapper {
	@Select("SELECT name,dprice,rownum  FROM (SELECT name,dprice FROM estate_detail WHERE dprice LIKE '__억'||'%' " 
			+ "ORDER BY dprice DESC) "
			+ "WHERE rownum<=7")
	public List<EstateDetailVO> estateTop7();
	
}
