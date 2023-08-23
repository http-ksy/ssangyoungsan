package com.sist.mapper;

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
	
	@Select("select no,title,subject,id,to_char(regdate,'yy-mm-dd')as dbday,hit "
			+"from landboard "
			+ "where bno=#{bno}"
			+ " order by no desc")
	public List<landboardVO> landboard_list(Map map);
	@Update("UPDATE landboard set hit=hit+1 where no=#{no}")
	public void incrementHit(int no);
	@Select("SELECT no,title,id,hit,subject,TO_CHAR(regdate,'yyyy-mm-dd')as dbday "
			+ "FROM landboard where no=#{no}")
	public landboardVO landboard_detail(int no);
}
