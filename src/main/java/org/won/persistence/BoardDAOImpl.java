package org.won.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.won.domain.ReviewVO;
@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	protected SqlSession sqlSession;

	protected String NAME = "org.won.dao.ProductsMapper";

	@Override
	public List<ReviewVO> reviewRead(int pno) throws Exception {
		return sqlSession.selectList(NAME +".review", pno);
		
	}

	@Override
	public void rCreate(ReviewVO vo) throws Exception {
		sqlSession.insert(NAME + ".rCreate", vo);
	}

}
