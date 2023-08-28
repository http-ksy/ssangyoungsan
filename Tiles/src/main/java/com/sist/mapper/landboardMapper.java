package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.landboardDAO;
import com.sist.vo.landboardVO;
import java.util.*;

public interface landboardMapper {
	@Insert("insert into landboard(no,bno,title,subject,id,filesize,filename,filecount) "
			+ "values(lb_no_seq.nextVal, #{bno}, #{title}, #{subject}, #{id},#{filesize},#{filename},#{filecount})")
	public void landboardInsert(landboardVO vo);
	
//	@Select("select no,title,subject,id,to_char(regdate,'yy-mm-dd')as dbday,hit "
//			+"from landboard "
//			+ "where bno=#{bno}"
//			+ " order by no desc")
	@Select("select no,bno,title,subject,id,to_char(regdate,'yy-mm-dd')as dbday,hit,num "
			+"from (select no,bno,title,subject,id,regdate,hit,rownum as num "
			+ "from (select no,bno,title,subject,id,regdate,hit "
			+ "from landboard where bno=#{bno} "
			+ "order by no desc)) where num between #{start} and #{end}")
	public List<landboardVO> landboard_list(Map map);
	
	// totalpage
	@Select("select ceil(count(*)/10.0) from landboard where bno=#{bno}")
	public int boardListTotalPage(int bno);
	
	@Update("UPDATE landboard set hit=hit+1 where no=#{no}")
	public void incrementHit(int no);
	
	@Select("SELECT no,title,id,hit,subject,TO_CHAR(regdate,'yyyy-mm-dd')as dbday,"
			+ "filename,filesize,filecount "
			+ "FROM landboard where no=#{no}")
	public landboardVO landboard_detail(int no);
	
	@Update("update landboard set title=#{title}, subject=#{subject} where no=#{no}")
	public void landboard_update(landboardVO vo);
	
	@Delete("delete from landboard where no=#{no}")
	public void landboard_delete(int no);
}
