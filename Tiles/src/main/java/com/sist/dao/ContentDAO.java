package com.sist.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import java.util.*;

import com.sist.vo.CleanVO;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.InteVO;
import com.sist.vo.MoveVO;
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
	
	// 청소
/*	@Select("SELECT cno,title,address,poster,carrer,rownum FROM (SELECT cno,title,address,poster,carrer FROM clean_detail ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE rownum <=4")*/
	public List<CleanVO> cleanRandomList(){
		return mapper.cleanRandomList();
	}
		
	// 이사
/*	@Select("SELECT mno,title,address,poster,carrer,rownum FROM (SELECT mno,title,address,poster,carrer FROM move_detail ORDER BY DBMS_RANDOM.RANDOM) "
				+ "WHERE rownum <=4")*/
	public List<MoveVO> moveRandomList(){
		return mapper.moveRandomList();
	}
	
	//인테리어
	public List<InteVO> inteRandomList() {
		return mapper.inteRandomList();
	}
}
