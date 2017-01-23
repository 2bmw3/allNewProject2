package org.won.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.won.domain.AdminVO;
import org.won.domain.AnswerVO;
import org.won.domain.PinfoVO;
import org.won.domain.PphotosVO;
import org.won.domain.ProductsVO;
import org.won.domain.QuestionVO;
import org.won.domain.SearchVO;

@Repository
public class ProductsDAOImpl implements ProductsDAO {

	@Inject
	protected SqlSession sqlSession;

	protected String NAME = "org.won.dao.ProductsMapper";

	@Override
	public void productsWrite(ProductsVO vo) throws Exception {
		sqlSession.insert(NAME + ".productsWrite", vo);
	}

	@Override
	public void productsDetailWrite(PinfoVO vo) throws Exception {
		sqlSession.insert(NAME + ".productsDetailWrite", vo);
	}

	@Override
	public void productsPhotoWrite(String photo) throws Exception {
		sqlSession.insert(NAME + ".productsPhotoWrite", photo);
	}

	@Override
	public List<ProductsVO> read(int pno) throws Exception {

		return sqlSession.selectList(NAME + ".adminRead", pno);

	}

	@Override
	public void productsDelete(int pno) throws Exception {
		sqlSession.delete(NAME + ".productsDelete", pno);
	}

	@Override
	public void pinfoDelete(int pno) throws Exception {
		sqlSession.delete(NAME + ".pinfoDelete", pno);
	}

	@Override
	public void pphotosDelete(int pno) throws Exception {
		sqlSession.delete(NAME + ".pphotosDelete", pno);
	}

	@Override
	public List<ProductsVO> list(ProductsVO vo) throws Exception {
		return sqlSession.selectList(NAME + ".list", vo);
	}

	@Override
	public List<PinfoVO> info(int pno) throws Exception {

		return sqlSession.selectList(NAME + ".info", pno);
	}

	@Override
	public List<QuestionVO> question(int pno) throws Exception { //
		return sqlSession.selectList(NAME + ".question", pno);
	}

	@Override
	public void answer(AnswerVO vo) throws Exception {
		sqlSession.insert(NAME + ".answer", vo);

	}

	@Override
	public List<AnswerVO> answerRead(int pno) throws Exception {
		return sqlSession.selectList(NAME + ".answerRead", pno);
	}

	@Override
	public List<ProductsVO> adminListSearch(SearchVO search) throws Exception {
		return sqlSession.selectList(NAME + ".adminListSearch", search);
	}

	@Override
	public int total(String adminid) throws Exception {
		return sqlSession.selectOne(NAME + ".total", adminid);
	}

	@Override
	public int pkindTotal(ProductsVO vo) throws Exception {
		return sqlSession.selectOne(NAME + ".pkindTotal", vo);
	}

	@Override
	public int searchTotal(SearchVO search) throws Exception {

		return sqlSession.selectOne(NAME + ".searchTotal", search);
	}

	@Override
	public List<ProductsVO> lastPnoRead() throws Exception {
		return sqlSession.selectList(NAME + ".lastPnoRead");
	}

	@Override
	public List<PphotosVO> pphotosRead(int pno) throws Exception {
		return sqlSession.selectList(NAME + ".pphotosRead", pno);

	}

	@Override
	public List<ProductsVO> updateProductsRead(int pno) throws Exception {
		return sqlSession.selectList(NAME + ".updateProductsRead", pno);

	}

	@Override
	public List<PinfoVO> updateInfoRead(int pno) throws Exception {
		return sqlSession.selectList(NAME + ".updateInfoRead", pno);
	}

	@Override
	public void productsDetailWritePno(PinfoVO vo) throws Exception {
		sqlSession.insert(NAME + ".productsDetailWritePno", vo);

	}

	@Override
	public void productsPhotoWritePno(PphotosVO vo) throws Exception {
		sqlSession.insert(NAME + ".productsPhotoWritePno", vo);

	}

	@Override
	public void update(ProductsVO vo) throws Exception {
		sqlSession.delete(NAME + ".update", vo);

	}

	@Override
	public void qstatus(int qno) throws Exception {
		sqlSession.update(NAME + ".qstatus", qno);

	}

	@Override
	public List<ProductsVO> memberRead(int pno) throws Exception {

		return sqlSession.selectList(NAME + ".memberRead", pno);

	}

	// thema번호 가져오는 함수
	@Override
	public AdminVO themaGet(int pno) throws Exception {
		return sqlSession.selectOne(NAME + ".themaGet", pno);
	}

	@Override
	public List<PinfoVO> infoColor(int pno) throws Exception {
		return sqlSession.selectList(NAME + ".infoColor", pno);
	}

	@Override
	public List<PinfoVO> infoSize(PinfoVO vo) throws Exception {
		return sqlSession.selectList(NAME + ".infoSize", vo);
	}

	@Override
	public List<ProductsVO> pkindList(ProductsVO vo) throws Exception {
		return sqlSession.selectList(NAME + ".pkindList", vo);
	}

	@Override
	public List<ProductsVO> hitItem(AdminVO vo) throws Exception {
		return sqlSession.selectList(NAME + ".hitItem", vo);
	}

	@Override
	public List<ProductsVO> newItem(AdminVO vo) throws Exception {
		return sqlSession.selectList(NAME + ".newItem", vo);
	}

	@Override
	public List<ProductsVO> mGenderList(String pgender) throws Exception {
		return sqlSession.selectList(NAME + ".mGenderList", pgender);
	}

	@Override
	public List<ProductsVO> mPkindList(String pkind) throws Exception {
		return sqlSession.selectList(NAME + ".mPkindList", pkind);
	}

	@Override
	public List<ProductsVO> mTotalList() throws Exception {
		return sqlSession.selectList(NAME + ".mTotalList");
	}
}
