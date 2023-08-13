package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
@Service
public class MemberServiceImpl implements MemberService{
  @Autowired
  private MemberDAO dao;
	@Override
	public void MemberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.MemberInsert(vo);
	}

	@Override
	public MemberVO memberLogin(String id) {
		return dao.memberLogin(id);
	}

	@Override
	public int memberIdCheck(String id) {
		// TODO Auto-generated method stub
		return dao.memberIdCheck(id);
	}

	@Override
	public int memberNickCheck(String nickname) {
		// TODO Auto-generated method stub
		return dao.memberNickCheck(nickname);
	}

	@Override
	public int memberEmailCheck(String email) {
		// TODO Auto-generated method stub
		return dao.memberEmailCheck(email);
	}
 
}
