package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MoveMapper;
import com.sist.vo.CleanVO;
import com.sist.vo.MoveVO;

@Repository
public class MoveDAO {
	@Autowired
	private MoveMapper mapper;
	
	public List<MoveVO> MoveListData(Map map){
		return mapper.MoveListData(map);
	}
	
	public int MoveTotalPage() {
		return mapper.MoveTotalPage();
	}
	
	public MoveVO MoveDetailData(int mno) {
		return mapper.MoveDetailData(mno);
	}
	
	public List<MoveVO> moveFindData(Map map){
		return mapper.moveFindData(map);
	}
	
	public int moveFindTotalPage(Map map) {
		return mapper.moveFindTotalPage(map);
	}
}
