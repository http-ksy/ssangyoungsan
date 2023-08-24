package com.sist.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import java.util.*;
import com.sist.vo.EstateDetailVO;
@Repository
public class ContentDAO {
	@Autowired
	private ContentMapper mapper;
//	@Select("SELECT img,name,dprice,addr,rownum FROM (SELECT img,name,dprice,addr estate_detail ORDER BY DBMS_RANDOM.RANDOM) "
//			+ "WHERE rownum <=4")
	public List<EstateDetailVO> estateRandomList()
	{
		return mapper.estateRandomList();
	}
}
