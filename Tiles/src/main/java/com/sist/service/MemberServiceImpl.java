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
  @Autowired
  private InteDAO idao;
  @Autowired
  private MoveDAO mdao;
  @Autowired
  private CleanDAO cdao;
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

	@Override
	public int memberPhoneCheck(String phone) {
		// TODO Auto-generated method stub
		return dao.memberPhoneCheck(phone);
	}

	@Override
	public MemberVO memberInfo(String id) {
		// TODO Auto-generated method stub
		return dao.memberInfo(id);
	}

	@Override
	public String memberPwdCheck(String id) {
		// TODO Auto-generated method stub
		return dao.memberPwdCheck(id);
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.memberUpdate(vo);
	}

	@Override
	public void memberDelete(String id) {
		// TODO Auto-generated method stub
		dao.memberDelete(id);
	}

	@Override
	public List<MemberVO> memberFindData(Map map) {
		// TODO Auto-generated method stub
		return dao.memberFindData(map);
	}

	@Override
	public int memberTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.memberTotalPage(map);
	}

	@Override
	public List<EstateDetailVO> zipTypeData(Map map) {
		// TODO Auto-generated method stub
		return dao.zipTypeData(map);
	}

	@Override
	public int zipBuyTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.zipBuyTotalPage(map);
	}

	@Override
	public List<InteVO> inteLike(Map map) {
		// TODO Auto-generated method stub
		List<InteVO> list=new ArrayList<InteVO>();
		List<Integer> ilist=dao.inteLike(map);
		for(Integer ivo:ilist)
		{
			list.add(idao.inteDetailData(ivo));
		}
		return list;
	}

	@Override
	public int inteLikeTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.inteLikeTotalPage(map);
	}

	@Override
	public void inteZimDelete(InteLikeVO vo) {
		// TODO Auto-generated method stub
		dao.inteZimDelete(vo);
	}

	@Override
	public List<MoveVO> moveZzim(Map map) {
		// TODO Auto-generated method stub
		List<MoveVO> list=new ArrayList<MoveVO>();
		List<Integer> mlist=dao.moveZzim(map);
		for(Integer mvo:mlist)
		{
			list.add(mdao.MoveDetailData(mvo));
		}
		return list;
	}

	@Override
	public int moveZzimTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.moveZzimTotalPage(map);
	}

	@Override
	public List<CleanVO> cleanZzim(Map map) {
		// TODO Auto-generated method stub
		List<CleanVO> list=new ArrayList<CleanVO>();
		List<Integer> clist=dao.cleanZzim(map);
		for(Integer cvo:clist)
		{
			list.add(cdao.CleanDetailData(cvo));
		}
		return list;
	}

	@Override
	public int cleanZzimTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.cleanZzimTotalPage(map);
	}

	@Override
	public void moveZimDelete(MoveJjimVO vo) {
		// TODO Auto-generated method stub
		dao.moveZimDelete(vo);
	}

	@Override
	public void cleanZimDelete(CleanJjimVO vo) {
		// TODO Auto-generated method stub
		dao.cleanZimDelete(vo);
	}

	@Override
	public List<InteReserveVO> inte_reserve(Map map) {
		// TODO Auto-generated method stub
		return dao.inte_reserve(map);
	}

	@Override
	public int inte_reserve_totalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.inte_reserve_totalPage(map);
	}

	@Override
	public List<InteReserveVO> inte_user_reserve(Map map) {
		// TODO Auto-generated method stub
		return dao.inte_user_reserve(map);
	}

	@Override
	public int inte_user_reserve_totalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.inte_user_reserve_totalPage(map);
	}

	@Override
	public List<ReserveMoveVO> move_admin_reserve(Map map) {
		// TODO Auto-generated method stub
		return dao.move_admin_reserve(map);
	}

	@Override
	public int move_admin_reserve_totalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.move_admin_reserve_totalPage(map);
	}

	@Override
	public List<ReserveCleanVO> clean_admin_reserve(Map map) {
		// TODO Auto-generated method stub
		return dao.clean_admin_reserve(map);
	}

	@Override
	public int clean_admin_reserve_totalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.clean_admin_reserve_totalPage(map);
	}

	@Override
	public List<ReserveMoveVO> move_user_reserve(Map map) {
		// TODO Auto-generated method stub
		return dao.move_user_reserve(map);
	}

	@Override
	public int move_user_reserve_totalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.move_user_reserve_totalPage(map);
	}

	@Override
	public List<ReserveCleanVO> clean_user_reserve(Map map) {
		// TODO Auto-generated method stub
		return dao.clean_user_reserve(map);
	}

	@Override
	public int clean_admin_user_totalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.clean_admin_user_totalPage(map);
	}

	@Override
	public List<EstateDetailVO> customer_zip_buy(Map map) {
		// TODO Auto-generated method stub
		return dao.customer_zip_buy(map);
	}

	@Override
	public List<ProductCartVO> admin_cart(Map map) {
		// TODO Auto-generated method stub
		return dao.admin_cart(map);
	}

	@Override
	public int admin_cart_totalpage(Map map) {
		// TODO Auto-generated method stub
		return dao.admin_cart_totalpage(map);
	}

	@Override
	public List<ProductCartVO> user_cart(Map map) {
		// TODO Auto-generated method stub
		return dao.user_cart(map);
	}

	@Override
	public int user_cart_totalpage(Map map) {
		// TODO Auto-generated method stub
		return dao.user_cart_totalpage(map);
	}

	@Override
	public void user_cart_delete(ProductCartVO vo) {
		// TODO Auto-generated method stub
		dao.user_cart_delete(vo);
	}

	@Override
	public void memberPwdUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.memberPwdUpdate(vo);
	}

	@Override
	public MemberVO memberId(String email) {
		// TODO Auto-generated method stub
		return dao.memberId(email);
	}

	@Override
	public List<ProductCartVO> admin_purchase(Map map) {
		// TODO Auto-generated method stub
		return dao.admin_purchase(map);
	}

	@Override
	public int admin_purchase_totalpage(Map map) {
		// TODO Auto-generated method stub
		return dao.admin_purchase_totalpage(map);
	}

	@Override
	public List<ProductCartVO> user_purchase(Map map) {
		// TODO Auto-generated method stub
		return dao.user_purchase(map);
	}

	@Override
	public int user_purchase_totalpage(Map map) {
		// TODO Auto-generated method stub
		return dao.user_purchase_totalpage(map);
	}

	@Override
	public void user_purchase_delete(ProductCartVO vo) {
		// TODO Auto-generated method stub
		dao.user_purchase_delete(vo);
	}

	@Override
	public int customer_zip_buy_totalpage(Map map) {
		// TODO Auto-generated method stub
		return dao.customer_zip_buy_totalpage(map);
	}
 
}
