package org.won.persistence;

import java.util.List;

import org.won.domain.AdminVO;
import org.won.domain.PinfoVO;
import org.won.domain.ProductsVO;
import org.won.domain.QuestionVO;
import org.won.domain.ShopimgVO;

public interface AdminDAO {

	public void create(AdminVO vo) throws Exception;

	public void update(AdminVO vo) throws Exception;

	public void delete(String adminid) throws Exception;

	public List<AdminVO> shopTotal(String adminid) throws Exception;
	
	public List<PinfoVO> infoEdit(ProductsVO pvo) throws Exception;

	public List<ProductsVO> categorySearch(ProductsVO pvo) throws Exception;

	public int categorySearchTotal(ProductsVO pvo) throws Exception;

	// 중복체크
	public String idCheck(String adminid) throws Exception;
	
	//질문 알림
	public List<QuestionVO> latter(String adminid) throws Exception;
	
	// 가게이름으로 adminid 가져오기
	public String getAdminId(String shopname) throws Exception;
	
	// title image update
	public void titleImgUpdate(AdminVO vo) throws Exception;
	
	// shop defaultImg insert
	public void defaultBanner(ShopimgVO vo) throws Exception;
	
	// bannerList
	public List<ShopimgVO> bannerList(String adminid) throws Exception;
	
	// bannerUpdate
	public void bannerUpdate (ShopimgVO vo) throws Exception;	
}
