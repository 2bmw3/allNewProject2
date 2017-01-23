package org.won.service;

import java.util.List;

import org.won.domain.AdminVO;
import org.won.domain.AnswerVO;
import org.won.domain.MemberVO;
import org.won.domain.QuestionVO;

public interface MemberService {

	public void create(MemberVO vo) throws Exception;

	public List<AdminVO> indexList() throws Exception;

	// 질문 등록데스
	public String questionWrite(QuestionVO vo) throws Exception;

	// 질문 pw check
	public String questionPwCheck(int qno) throws Exception;

	// 답변 여러개 가져오기
	public List<String> answerList(int qno) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
}
