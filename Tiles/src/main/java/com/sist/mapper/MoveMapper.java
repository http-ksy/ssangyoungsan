package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.CleanVO;
import com.sist.vo.MoveVO;

public interface MoveMapper {
	@Select("SELECT mno,title,poster,carrer, score,num "
			+ "FROM (SELECT mno,title,poster,carrer, score,rownum as num "
			+ "FROM (SELECT mno,title,poster,carrer, score "
			+ "FROM move_detail ORDER BY mno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<MoveVO> MoveListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM move_detail")
	public int MoveTotalPage();
	
	@Select("SELECT mno,title,address,poster,carrer,EMPLO,contanttime,service, score,category,INTRODUCE "
			+ "FROM move_detail "
			+ "WHERE mno=#{mno}")
	public MoveVO MoveDetailData(int mno);
	
	public List<MoveVO> moveFindData(Map map);
	public int moveFindTotalPage(Map map);
}
