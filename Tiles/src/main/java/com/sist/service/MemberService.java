package com.sist.service;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.dao.MemberDAO;
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
}
