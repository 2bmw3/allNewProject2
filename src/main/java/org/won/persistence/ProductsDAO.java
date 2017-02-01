package org.won.persistence;

import java.util.List;

import org.won.domain.AdminVO;
import org.won.domain.AnswerVO;
import org.won.domain.PinfoVO;
import org.won.domain.PphotosVO;
import org.won.domain.ProductsVO;
import org.won.domain.QuestionVO;
import org.won.domain.SearchVO;

public interface ProductsDAO {

	/* write */
	public void productsWrite(ProductsVO vo) throws Exception;

	public void productsDetailWrite(PinfoVO vo) throws Exception;

	public void productsPhotoWrite(String photo) throws Exception;

	/* delete */
	public void productsDelete(int pno) throws Exception;

	public void pinfoDelete(int pno) throws Exception;

	public void pphotosDelete(int pno) throws Exception;

	public List<ProductsVO> list(ProductsVO vo) throws Exception;

	public List<PinfoVO> info(int pno) throws Exception;

	public List<PinfoVO> infoColor(int pno) throws Exception;

	public List<PinfoVO> infoSize(PinfoVO vo) throws Exception;

	public List<QuestionVO> question(int pno) throws Exception;

	public void answer(AnswerVO vo) throws Exception;

	public List<AnswerVO> answerRead(int pno) throws Exception;

	public List<ProductsVO> adminListSearch(SearchVO search) throws Exception;

	public int searchTotal(SearchVO search) throws Exception;

	public int total(String adminid) throws Exception;

	public int pkindTotal(ProductsVO vo) throws Exception;

	public List<ProductsVO> lastPnoRead() throws Exception;

	public List<PphotosVO> pphotosRead(int pno) throws Exception;

	public List<ProductsVO> updateProductsRead(int pno) throws Exception;

	public List<PinfoVO> updateInfoRead(int pno) throws Exception;

	public void productsDetailWritePno(PinfoVO vo) throws Exception;

	public void productsPhotoWritePno(PphotosVO vo) throws Exception;

	public void qstatus(int qno) throws Exception;

	public List<ProductsVO> read(int pno) throws Exception;

	public void update(ProductsVO vo) throws Exception;

	//
	public List<ProductsVO> memberRead(int pno) throws Exception;

	// thema 번호 가져오는 함수
	public AdminVO themaGet(int pno) throws Exception;

	// pkindList
	public List<ProductsVO> pkindList(ProductsVO vo) throws Exception;

	// 인기상품
	public List<ProductsVO> hitItem(AdminVO vo) throws Exception;

	// 최신상품
	public List<ProductsVO> newItem(AdminVO vo) throws Exception;

	// 멤버 전체 상품
	public List<ProductsVO> mTotalList() throws Exception;

	// 멤버 성별 전체 상품
	public List<ProductsVO> mGenderList(String pgender) throws Exception;

	// 멤버 종류별 전체 상품
	public List<ProductsVO> mPkindList(String pkind) throws Exception;
	
	// pno로 adminId 찾기
	public String adminidGet(int pno)throws Exception;
	
	// adminid로 shopName, thema 찾기
	public AdminVO allListSearch(String adminid)throws Exception;

}