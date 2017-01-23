package org.won.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.won.domain.AdminVO;
import org.won.domain.AnswerVO;
import org.won.domain.MemberVO;
import org.won.domain.QuestionVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	protected SqlSession sqlSession;

	protected String NAME;

	public MemberDAOImpl() {
		this.NAME = "org.won.dao.MemberMapper";
	}

	@Override
	public void create(MemberVO vo) throws Exception {
		
		sqlSession.insert(NAME+".create",vo);
	}

	@Override
	public List<AdminVO> indexList() throws Exception {
		return sqlSession.selectList(NAME + ".indexList" );
	}

	@Override
	public void questionWrite(QuestionVO vo) throws Exception {
		sqlSession.insert(NAME + ".questionWrite",vo);
	}

	@Override
	public String questionPwCheck(int qno) throws Exception {
		return sqlSession.selectOne(NAME + ".questionPwCheck", qno);
	}

	@Override
	public List<String> answerList(int qno) throws Exception {
		return sqlSession.selectList(NAME + ".answerList", qno);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sqlSession.selectOne(NAME + ".login", vo);
	}
}
