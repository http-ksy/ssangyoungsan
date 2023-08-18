package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.CleanVO;

public interface CleanService {

	public List<CleanVO> CleanListData(Map map);
	
	public int CleanTotalPage();
	
	public CleanVO CleanDetailData(int cno);
	
	public List<CleanVO> cleanFindData(Map map);
	
	public int cleanFindTotalPage(Map map);
}
