package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.EstateQnaVO;
public interface EstateQnaService {
//	@Insert("INSERT INTO EstateQna VALUES(eq_no_seq.nextval,#{id},#{question},#{company},'답변대기')")
	public String estateQnaInsert(Map map);
//	@Update("UPDATE EstateQna SET answer=#{answer} WHERE no=#{no}")
	public String estateQnaUpdate(Map map);
//	@Select("SELECT no,id,question,company,answer,num FROM "
//			+ "(SELECT no,id,question,company,answer,rownum as num FROM"
//			+ "(SELECT no,id,question,company,answer FROM estateQna WHERE company=#{company})) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EstateQnaVO> estateQnaCompanyListData(Map map);
//	@Select("SELECT no,id,question,company,answer,num FROM "
//			+ "(SELECT no,id,question,company,answer,rownum as num FROM"
//			+ "(SELECT no,id,question,company,answer FROM estateQna WHERE id=#{id})) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EstateQnaVO> estateQnaUserListData(Map map);
	//@Select("SELECT CEIL(COUNT(*)/5) FROM estateqna WHERE answer='답변대기' and company=#{company}")
	public int customerTotalPage(Map map);
}
