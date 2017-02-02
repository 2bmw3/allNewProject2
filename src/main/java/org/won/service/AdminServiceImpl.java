package org.won.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.won.domain.AdminVO;
import org.won.domain.PinfoVO;
import org.won.domain.ProductsVO;
import org.won.domain.QuestionVO;
import org.won.domain.ShopimgVO;
import org.won.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public void create(AdminVO vo) throws Exception {

		dao.create(vo);
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

		return dao.shopTotal(adminid);
	}

	@Override
	public List<PinfoVO> infoEdit(ProductsVO pvo) throws Exception {

		return dao.infoEdit(pvo);
	}

	@Override
	public List<ProductsVO> categorySearch(ProductsVO pvo) throws Exception {
		return dao.categorySearch(pvo);
	}

	@Override
	public int categorySearchTotal(ProductsVO pvo) throws Exception {
		return dao.categorySearchTotal(pvo);
	}

	// 증복 체크
	@Override
	public String idCheck(String adminid) throws Exception {
		return dao.idCheck(adminid);
	}

	@Override
	public List<QuestionVO> latter(String adminid) throws Exception {
		return dao.latter(adminid);
	}

	@Override
	public String getAdminId(String shopname) throws Exception {
		return dao.getAdminId(shopname);
	}

	@Override
	public void titleImgUpdate(AdminVO vo) throws Exception {
		dao.titleImgUpdate(vo);
	}

	@Override
	public void defaultBanner(ShopimgVO vo) throws Exception {
		
		for (int i = 0; i < vo.getBanner().size(); i++) {
			ShopimgVO svo = new ShopimgVO();
			svo.setAdminid(vo.getAdminid());
			svo.setBannerstr(vo.getBanner().get(i));
			svo.setBannersize(vo.getBannersize());

			dao.defaultBanner(svo);
		}
	}

	@Override
	public List<ShopimgVO> bannerList(String adminid) throws Exception {
		return dao.bannerList(adminid);
	}

	@Override
	public void bannerUpdate(ShopimgVO vo) throws Exception {
		dao.bannerUpdate(vo);
	}
}
