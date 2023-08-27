package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.landboardReplyService;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
@RestController
public class landboardReplyRestController {
	@Autowired
	private landboardReplyService service;
	@GetMapping(value = "landboard/landboardreply_list.do", produces = "text/plain;charset=utf-8")
	public String landboardReply_list(int bno) throws Exception{
		List<landboardReplyVO> list = service.boardReply_list(bno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@PostMapping(value = "landboard/landboardreply_insert.do", produces = "text/plain;charset=utf-8")
	public String landboardReply_Insert(landboardReplyVO vo,HttpSession session)throws Exception {
		String nickname = (String)session.getAttribute("nickname");
		vo.setNickname(nickname);
		service.boardReply_insert(vo);
		ObjectMapper mapper = new ObjectMapper();
		List<landboardReplyVO> list = service.boardReply_list(vo.getBno());
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@PostMapping(value = "landboard/landboardreply_add.do", produces = "text/plain;charset=utf-8")
	public String landboardReply_Add(int rootno,landboardReplyVO vo,HttpSession session)throws Exception {
		String nickname = (String)session.getAttribute("nickname");
		vo.setNickname(nickname);
		service.replyAddReply(rootno,vo);
		ObjectMapper mapper = new ObjectMapper();
		List<landboardReplyVO> list = service.boardReply_list(vo.getBno());
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "landboard/landboardreply_update.do", produces = "text/plain;charset=utf-8")
	public String landboardReply_Update(int no, String content,int bno)throws Exception {
		Map map = new HashMap();
		map.put("no", no);
		map.put("content", content);
		service.replyUpdate(map);
		List<landboardReplyVO> list = service.boardReply_list(bno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "landboard/landboardreply_delete.do", produces = "text/plain;charset=utf-8")
	public String landboardReply_Delete(int no, int root,int bno)throws Exception {
		service.boardReply_delete(no, root);
		List<landboardReplyVO> list = service.boardReply_list(bno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
}
