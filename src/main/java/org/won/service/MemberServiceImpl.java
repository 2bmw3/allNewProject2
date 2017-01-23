package org.won.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.won.domain.AdminVO;
import org.won.domain.AnswerVO;
import org.won.domain.MemberVO;
import org.won.domain.QuestionVO;
import org.won.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Override
	public void create(MemberVO vo) throws Exception {
		dao.create(vo);

	}

	@Override
	public List<AdminVO> indexList() throws Exception {
		return dao.indexList();
	}

	@Override
	public String questionWrite(QuestionVO vo) throws Exception {
		dao.questionWrite(vo);
		return "success";
	}

	@Override
	public String questionPwCheck(int qno) throws Exception {
		return dao.questionPwCheck(qno);
	}

	@Override
	public List<String> answerList(int qno) throws Exception {
		return dao.answerList(qno);
	}
	
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

}
