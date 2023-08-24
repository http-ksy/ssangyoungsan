package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * NO NUMBER ,
  id varchar2(100) CONSTRAINT eq_id_nn NOT NULL,
  question CLOB CONSTRAINT eq_qs_nn NOT NULL ,
  company varchar2(100) CONSTRAINT eq_cp_nn NOT NULL,
  answer clob DEFAULT '답변대기',
  CONSTRAINT eq_no_pk PRIMARY KEY(no),
  CONSTRAINT eq_id_fk FOREIGN KEY(id) REFERENCES amem(id) ON DELETE CASCADE
 */
@Getter
@Setter
// answer 디폴트: 답변대기 관리자에서 => 글로 변경
public class EstateQnaVO {
 private int no,cno;
 private String id,question,company,answer;
}
