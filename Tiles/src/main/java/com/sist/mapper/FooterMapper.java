package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;

public interface FooterMapper {
	@Select("SELECT name,dprice,rownum  FROM (SELECT name,dprice FROM estate_detail WHERE dprice LIKE '__억'||'%' " 
			+ "ORDER BY dprice DESC) "
			+ "WHERE rownum<=7")
	public List<EstateDetailVO> estateTop7();
	
	@Select("SELECT cno,TITLE,SCORE,rownum FROM (SELECT cno,TITLE,SCORE FROM CLEAN_DETAIL ORDER BY SCORE DESC) WHERE ROWNUM <=7")
	public List<CleanVO> cleanTop7();
	
}
