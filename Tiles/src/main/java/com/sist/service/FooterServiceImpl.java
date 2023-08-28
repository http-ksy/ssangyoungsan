package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;

@Service
public class FooterServiceImpl implements FooterService{
	@Autowired
	private FooterDAO dao;

	@Override
	public List<EstateDetailVO> estateTop7() {
		// TODO Auto-generated method stub
		return dao.estateTop7();
	}
	
}
