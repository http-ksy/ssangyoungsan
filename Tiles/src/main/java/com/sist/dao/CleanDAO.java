package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CleanMapper;
import com.sist.vo.CleanJjimVO;
import com.sist.vo.CleanVO;

@Repository
public class CleanDAO {
	@Autowired
	private CleanMapper mapper;
	
	public List<CleanVO> CleanListData(Map map){
		return mapper.CleanListData(map);
	}
	
	public int CleanTotalPage() {
		return mapper.CleanTotalPage();
	}

	public CleanVO CleanDetailData(int cno) {
		return mapper.CleanDetailData(cno);
	}
	
	public List<CleanVO> cleanFindData(Map map){
		return mapper.cleanFindData(map);
	}
	public int cleanFindTotalPage(Map map) {
		return mapper.cleanFindTotalPage(map);
	}
	
	public void cleanJjimInsert(CleanJjimVO vo) {
		mapper.cleanJjimInsert(vo);
	}
	
	public void cleanJjimDelete(CleanJjimVO vo) {
		mapper.cleanJjimDelete(vo);
	}
	
	public int cleanJjimOk(CleanJjimVO jvo) {
		return mapper.cleanJjimOk(jvo);
	}
}
