package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.dao.MemberDAO;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.InteVO;
import com.sist.vo.MemberVO;

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
}
