package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.dao.MemberDAO;
import com.sist.vo.CleanJjimVO;
import com.sist.vo.CleanVO;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.InteLikeVO;
import com.sist.vo.InteReserveVO;
import com.sist.vo.InteVO;
import com.sist.vo.MemberVO;
import com.sist.vo.MoveJjimVO;
import com.sist.vo.MoveVO;
import com.sist.vo.ProductCartVO;
import com.sist.vo.ReserveCleanVO;
import com.sist.vo.ReserveMoveVO;

public interface MemberService {
	public void MemberInsert(MemberVO vo);
	// 로그인 
//	@Select("SELECT pwd,name,sex,admin FROM amem "
//			+ "WHERE id=#{id}")
	public MemberVO memberLogin(String id);
	// 아이디 췌크
//	@Select("SELECT COUNT(*) FROM amem WHERE id=#{id}")
	public int memberIdCheck(String id);
    //닉네임 체크
	public int memberNickCheck(String nickname);
	// 이메일 체크
		//	@Select("SELECT COUNT(*) FROM amem WHERE email=#{email}")
	public int memberEmailCheck(String email);
	 // 핸드폰 번호 체크
	//@Select("SELECT COUNT(*) FROM amem WHERE phone=${phone}")
	public int memberPhoneCheck(String phone);
	/*@Select("SELECT id,pwd,email,name,nickname,sex,birthday,phone,addr1,addr2,post,admin FROM amem"
			+ "WHERE id=#{id}")*/
	public MemberVO memberInfo(String id);
	//@Select("SELECT pwd FROM amem WHERE id=#{id}")
	public String memberPwdCheck(String id);
	/*@Update("UPDATE amem SET nickname=#{nickname},email=#{email},post=#{post},addr1=#{addr1},addr2=#{addr2},phone=#{phone},pwd=#{pwd} "
			+ "WHERE id=#{id}")*/
	public void memberUpdate(MemberVO vo);
	//@Delete("DELETE FROM amem WHERE id=#{id}")
	public void memberDelete(String id);
	
	public List<MemberVO> memberFindData(Map map);
	public int memberTotalPage(Map map);
	// 부동산 매물리스트 
	public List<EstateDetailVO> zipTypeData(Map map);
	public int zipBuyTotalPage(Map map);
	// 인테리어 찜 리스트
	public List<InteVO> inteLike(Map map);
	public int inteLikeTotalPage(Map map); 
	
	public void inteZimDelete(InteLikeVO vo);
	
	// 이사 찜
	public List<MoveVO> moveZzim(Map map);
	public int moveZzimTotalPage(Map map);
	public void moveZimDelete(MoveJjimVO vo);
	
	// 청소 찜
	public List<CleanVO> cleanZzim(Map map);
	//@Select("SELECT CEIL(COUNT(*)/8) FROM clean_jjim WHERE id=#{id}")
	public int cleanZzimTotalPage(Map map);
	public void cleanZimDelete(CleanJjimVO vo);
	
	////////// 인테리어 사장님 페이지에 출력
	// 인테리어 사장님 예약 목록 // 사용자 인테리어 예약 목록
//		@Select("SELECT no,id,ino,reserve_date,reserve_time,num "
//				+ "FROM (SELECT no,id,ino,reserve_date,reserve_time,rownum as num "
//				+ "FROM (SELECT no,id,ino,reserve_date,reserve_time "
//				+ "FROM reserve_info_inte ORDER BY no ASC)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<InteReserveVO> inte_reserve(Map map);
//		@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_inte ")
		public int inte_reserve_totalPage(Map map);
 ////// 사용자 예약
//		@Select("SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,num "
//				+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,rownum as num "
//				+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time "
//				+ "FROM reserve_info_inte WHERE id=#{id} ORDER BY no ASC)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<InteReserveVO> inte_user_reserve(Map map);
//		@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_inte WHERE id=#{id} ")
		public int inte_user_reserve_totalPage(Map map);
		
//		@Select("SELECT moveGetTitle(mno) as title,no,id,mno,reserve_date,reserve_time,num "
//				+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,reserve_date,reserve_time,rownum as num "
//				+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,reserve_date,reserve_time "
//				+ "FROM reserve_info_move OREDER BY no desc)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<ReserveMoveVO> move_admin_reserve(Map map);
//		@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_move ")
		public int move_admin_reserve_totalPage(Map map);
		
//		@Select("SELECT cleanGetTitle(mno) as title,no,id,mno,rday,rtime,num "
//				+ "FROM (SELECT cleanGetTitle(mno) as title,no,id,mno,rday,rtime,rownum as num "
//				+ "FROM (SELECT cleanGetTitle(mno) as title,no,id,mno,rday,rtime "
//				+ "FROM clean_info_move ORDER BY no desc)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<ReserveCleanVO> clean_admin_reserve(Map map);
//		@Select("SELECT CEIL(COUNT(*)/8) FROM clean_info_move ")
		public int clean_admin_reserve_totalPage(Map map);
		
		// 이사 사용자

	   public List<ReserveMoveVO> move_user_reserve(Map map);

	  public int move_user_reserve_totalPage(Map map);
				
		////청소 사용자 예약목록 

	  public List<ReserveCleanVO> clean_user_reserve(Map map);

	  public int clean_admin_user_totalPage(Map map);
	  
	  /// 부동산 사장님 구매현황 
//	  @Select("SELECT no,etype,dprice,name,type,addr,state,num "
//				+ "FROM (SELECT no,etype,dprice,name,type,addr,state,rownum as num "
//				+ "FROM (SELECT no,etype,dprice,name,type,addr,state "
//				+ "FROM estate_detail WHERE company=#{id} AND state='매매진행완료'")
		public List<EstateDetailVO> customer_zip_buy(Map map);
		
/////////// 관리자 장바구니s 
//	@Select("SELECT cno,no,type,id,poster,title,total_pri,amount,num "
//			+ "FROM (SELECT cno,no,type,id,poster,title,total_pri,amount,rownum as num "
//			+ "FROM (SELECT cno,no,type,id,poster,title,total_pri,amount "
//			+ "FROM product_cart where type=#{type} ORDER BY cno desc)) "
//			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<ProductCartVO> admin_cart(Map map);
//	@Select("SELECT CEIL(COUNT(*)/8 FROM product_cart WHERE type=#{type} ")
	public int admin_cart_totalpage(Map map);
	
//	@Select("SELECT cno,no,type,id,poster,title,total_pri,amount,num "
//			+ "FROM (SELECT cno,no,type,id,poster,title,total_pri,amount,rownum as num "
//			+ "FROM (SELECT cno,no,type,id,poster,title,total_pri,amount "
//			+ "FROM product_cart WHERE id=#{id} ORDER BY cno desc)) "
//			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<ProductCartVO> user_cart(Map map);
//	@Select("SELECT CEIL(COUNT(*)/8) FROM product_cart WHERE id=#{id}  ")
	public int user_cart_totalpage(Map map);
//	@Delete("DELETE FROM product_cart WHERE id=#{id} and cno=#{cno}")
	public void user_cart_delete(ProductCartVO vo);
	// 비밀번호 수정
	public void memberPwdUpdate(MemberVO vo);
	
//	@Select("SELECT id,pwd,email,name,nickname,sex,birthday,phone,addr1,addr2,post,admin FROM amem "
//			+ "WHERE email=#{email}")
	// 아이디 찾기 
	public MemberVO memberId(String email);
}
