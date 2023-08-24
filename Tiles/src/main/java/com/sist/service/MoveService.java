package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.CleanVO;
import com.sist.vo.MoveJjimVO;
import com.sist.vo.MoveVO;

public interface MoveService {

	public List<MoveVO> MoveListData(Map map);
	
	public int MoveTotalPage();
	
	public MoveVO MoveDetailData(int mno);
	
	public List<MoveVO> moveFindData(Map map);
	
	public int moveFindTotalPage(Map map);
	
	public void moveJjimInsert(MoveJjimVO vo);
	
	public void moveJjimDelete(MoveJjimVO vo);
	
	public int moveJjimOk(MoveJjimVO vo);
	
}
