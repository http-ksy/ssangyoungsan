package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class EstateQnaDAO {
	@Autowired
	private EstateQnaMapper mapper;
//	@Insert("INSERT INTO EstateQna VALUES(eq_no_seq.nextval,#{id},#{question},#{company},'답변대기')")
	public void estateQnaInsert(Map map)
	{
		mapper.estateQnaInsert(map);
	}
//	@Update("UPDATE EstateQna SET answer=#{answer} WHERE no=#{no}")
	public void estateQnaUpdate(Map map)
	{
		mapper.estateQnaUpdate(map);
	}
//	@Select("SELECT no,id,question,company,answer,num FROM "
//			+ "(SELECT no,id,question,company,answer,rownum as num FROM"
//			+ "(SELECT no,id,question,company,answer FROM estateQna WHERE company=#{company})) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EstateQnaVO> estateQnaCompanyListData(Map map)
	{
		return mapper.estateQnaCompanyListData(map);
	}
//	@Select("SELECT no,id,question,company,answer,num FROM "
//			+ "(SELECT no,id,question,company,answer,rownum as num FROM"
//			+ "(SELECT no,id,question,company,answer FROM estateQna WHERE id=#{id})) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EstateQnaVO> estateQnaUserListData(Map map)
	{
		return mapper.estateQnaUserListData(map);
	}
}
