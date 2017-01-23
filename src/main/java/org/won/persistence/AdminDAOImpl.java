package org.won.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.won.domain.AdminVO;
import org.won.domain.PinfoVO;
import org.won.domain.ProductsVO;
import org.won.domain.QuestionVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	protected SqlSession sqlSession;

	protected String NAME;

	public AdminDAOImpl() {
		this.NAME = "org.won.dao.AdminMapper";
	}

	@Override
	public void create(AdminVO vo) throws Exception {

		sqlSession.insert(NAME + ".create", vo);

	}

	@Override
	public void update(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String adminid) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<AdminVO> shopTotal(String adminid) throws Exception {

		return sqlSession.selectList(NAME + ".shopTotal", adminid);
	}

	@Override
	public List<PinfoVO> infoEdit(ProductsVO pvo) throws Exception {

		return sqlSession.selectList(NAME + ".infoEdit", pvo);
	}

	@Override
	public List<ProductsVO> categorySearch(ProductsVO pvo) throws Exception {
		return sqlSession.selectList(NAME + ".categorySearch", pvo);
	}

	@Override
	public int categorySearchTotal(ProductsVO pvo) throws Exception {
		return sqlSession.selectOne(NAME + ".categorySearchTotal", pvo);
	}

	// 중복 체크
	@Override
	public String idCheck(String adminid) throws Exception {
		return sqlSession.selectOne(NAME + ".idCheck", adminid);
	}

	@Override
	public List<QuestionVO> latter(String adminid) throws Exception {
		return sqlSession.selectList(NAME + ".latter", adminid);
	}

	@Override
	public String getAdminId(String shopname) throws Exception {
		return sqlSession.selectOne(NAME + ".getAdminId" , shopname);
	}

}
