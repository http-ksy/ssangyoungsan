package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class ContentServiceImpl implements ContentService{
	@Autowired
	private ContentDAO dao;

	@Override
	public List<EstateDetailVO> estateRandomList() {
		// TODO Auto-generated method stub
		return dao.estateRandomList();
	}
	
}
