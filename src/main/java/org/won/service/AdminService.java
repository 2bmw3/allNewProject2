package org.won.service;

import java.util.List;

import org.won.domain.AdminVO;
import org.won.domain.PinfoVO;
import org.won.domain.ProductsVO;
import org.won.domain.QuestionVO;

public interface AdminService {

	public void create(AdminVO vo) throws Exception;

	public void update(AdminVO vo) throws Exception;

	public void delete(String adminid) throws Exception;

	public List<AdminVO> shopTotal(String adminid) throws Exception;
	
	public List<PinfoVO> infoEdit(ProductsVO pvo) throws Exception;

	public List<ProductsVO> categorySearch(ProductsVO pvo) throws Exception;

	public int categorySearchTotal(ProductsVO pvo) throws Exception;

	// 중복 체크
	public String idCheck(String adminid) throws Exception;
	//알림 확인
	public List<QuestionVO> latter(String adminid) throws Exception;
	
	// shoname으로 adminid 가져오기
	public String getAdminId(String shopname) throws Exception;
}
