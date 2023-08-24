package com.sist.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.CleanReplyDAO;
import com.sist.service.CleanReplyService;
import com.sist.vo.CleanReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.*;

@RestController
public class CleanReplyRestController {
    @Autowired
    private CleanReplyService service;

    public String clean_reply_list_data(int cno) {
        String json="";
        try {
            List<CleanReplyVO> list=service.cleanReplyListData(cno);
            ObjectMapper mapper=new ObjectMapper();
            json=mapper.writeValueAsString(list);
        } catch (Exception e) {}
        return json;
    }

    @GetMapping(value = "reply/clean_reply_read_vue.do",produces = "text/plain;charset=UTF-8")
    public String clean_reply_read(int cno) {
        return clean_reply_list_data(cno);
    }

    @PostMapping(value = "reply/clean_reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
    public String clean_reply_insert(CleanReplyVO vo, HttpSession session) {
        String id=(String)session.getAttribute("id");
        String name=(String)session.getAttribute("name");
        vo.setId(id);
        vo.setName(name);
        System.out.println(id);
        System.out.println(name);
        service.cleanReplyInsert(vo);
        return clean_reply_list_data(vo.getCno());
    }
    @GetMapping(value = "reply/clean_reply_delete_vue.do",produces = "text/plain;charset=UTF-8")
    public String clean_reply_delete(int no,int cno) {
        service.cleanReplyDelete(no);
        return clean_reply_list_data(cno);
    }

    @PostMapping(value = "reply/clean_reply_update_vue.do",produces = "text/plain;charset=UTF-8")
    public String clean_reply_update(CleanReplyVO vo) {
        System.out.println("msg="+vo.getMsg());
        service.cleanReplyUpdate(vo);
        return clean_reply_list_data(vo.getCno());
    }
}
