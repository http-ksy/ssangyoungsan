package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface EstateQnaMapper {
	@Insert("INSERT INTO EstateQna VALUES(eq_no_seq.nextval,#{cno},#{id},#{question},#{company},'답변대기')")
	public void estateQnaInsert(Map map);
	@Update("UPDATE EstateQna SET answer=#{content} WHERE no=#{no}")
	public void estateQnaUpdate(Map map);
	@Select("SELECT no,cno,id,question,company,answer,num FROM "
			+ "(SELECT no,cno,id,question,company,answer,rownum as num FROM"
			+ "(SELECT no,cno,id,question,company,answer FROM estateQna WHERE answer LIKE '%'||'답변대기'||'%' AND company=#{company})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EstateQnaVO> estateQnaCompanyListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/5) FROM estateqna WHERE answer LIKE '%'||'답변대기'||'%' AND company=#{company}")
	public int customerTotalPage(Map map);
	@Select("SELECT no,cno,id,question,company,answer,num FROM "
			+ "(SELECT no,cno,id,question,company,answer,rownum as num FROM"
			+ "(SELECT no,cno,id,question,company,answer FROM estateQna WHERE id=#{id} "
			+ "ORDER BY NO DESC )) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EstateQnaVO> estateQnaUserListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/5) FROM estateqna WHERE id=#{id}")
	public int userTotalPage(Map map);
	/*
  id varchar2(100) CONSTRAINT eq_id_nn NOT NULL,
  question CLOB CONSTRAINT eq_qs_nn NOT NULL ,
  company varchar2(100) CONSTRAINT eq_cp_nn NOT NULL,
  answer clob DEFAULT '답변대기',
  CONSTRAINT eq_no_pk PRIMARY KEY(no),
  CONSTRAINT eq_id_fk FOREIGN KEY(id) REFERENCES amem(id) ON DELETE CASCADE
  int no;
  String id,question,company,answer;
	 */
}
