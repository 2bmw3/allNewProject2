package org.won.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.won.domain.AdminVO;
import org.won.domain.AnswerVO;
import org.won.domain.EphotosVO;
import org.won.domain.PinfoVO;
import org.won.domain.PphotosVO;
import org.won.domain.ProductsVO;
import org.won.domain.QuestionVO;
import org.won.domain.SearchVO;
import org.won.persistence.EditorDAO;
import org.won.persistence.ProductsDAO;

@Service
public class ProductsServiceImpl implements ProductsService {

	@Inject
	private ProductsDAO dao;
	@Inject
	private EditorDAO edao;

	private static final Logger logger = LoggerFactory.getLogger(ProductsServiceImpl.class);

	@Override
	@Transactional
	public void write(ProductsVO pvo, PinfoVO ivo, PphotosVO phvo) throws Exception {
		dao.productsWrite(pvo);

		phvo.getPphoto().forEach(str -> {
			try {
				dao.productsPhotoWrite(str);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});

		for (int i = 0; i < ivo.getList().size(); i++) {

			if (ivo.getList().get(i).getPicolor() != null) {

				dao.productsDetailWrite(ivo.getList().get(i));
			}
		}

	}

	@Override
	public List<ProductsVO> read(int pno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(pno);
	}

	@Override
	@Transactional
	public void delete(int pno) throws Exception {
		List<PphotosVO> pvo = dao.pphotosRead(pno);

		for (int i = 0; i < pvo.size(); i++) {

			String pphotoFileName = pvo.get(0).getPphotostr();
			logger.info("target fileName... : " + pphotoFileName);
			new File("C:\\productsPhoto\\" + pphotoFileName).delete();
			new File("C:\\productsPhoto\\ts_" + pphotoFileName).delete();
			new File("C:\\productsPhoto\\s_" + pphotoFileName).delete();
		}

		dao.productsDelete(pno);
		dao.pinfoDelete(pno);
		dao.pphotosDelete(pno);
		edao.ephotoPnoDelete(pno);
	}

	@Override
	public List<ProductsVO> list(ProductsVO vo) throws Exception {
		return dao.list(vo);
	}

	@Override
	public List<PinfoVO> info(int pno) throws Exception {
		// TODO Auto-generated method stub
		return dao.info(pno);
	}

	@Override
	public List<QuestionVO> question(int pno) throws Exception {
		return dao.question(pno);
	}

	@Override
	public void answer(AnswerVO vo) throws Exception {
		dao.answer(vo);

	}

	@Override
	public List<AnswerVO> answerRead(int pno) throws Exception {
		return dao.answerRead(pno);
	}

	@Override
	public List<ProductsVO> adminListSearch(SearchVO search) throws Exception {
		return dao.adminListSearch(search);
	}

	@Override
	public int total(String adminid) throws Exception {
		return dao.total(adminid);
	}
	
	@Override
	public int pkindTotal(ProductsVO vo) throws Exception {
		return dao.pkindTotal(vo);
	}

	@Override
	public int searchTotal(SearchVO search) throws Exception {
		return dao.searchTotal(search);
	}

	@Override
	public void containDelete() throws Exception {

		List<String> deleteTarget = new ArrayList<String>();

		int lastPno = dao.lastPnoRead().get(0).getPno();

		for (int i = 0; i < edao.ephotoRead().size(); i++) {

			if (dao.lastPnoRead().get(0).getPcontent().contains(edao.ephotoRead().get(i).getEphotostr())) {
				EphotosVO evo = new EphotosVO();
				evo.setPno(lastPno);
				evo.setEphotostr(edao.ephotoRead().get(i).getEphotostr());
				edao.ephotoUpdate(evo);
			} else {
				deleteTarget.add(edao.ephotoRead().get(i).getEphotostr());
			}
		}

		for (int i = 0; i < deleteTarget.size(); i++) {

			new File("C:\\productsPhoto\\" + deleteTarget.get(i)).delete();
		}
		edao.ephotoDelete();

	}

	@Override
	public List<ProductsVO> updateProductsRead(int pno) throws Exception {
		return dao.updateProductsRead(pno);
	}

	@Override
	public List<PinfoVO> updateInfoRead(int pno) throws Exception {
		return dao.updateInfoRead(pno);
	}

	@Override
	@Transactional
	public void update(ProductsVO pvo, PinfoVO ivo, PphotosVO phvo) throws Exception {
		int pno = pvo.getPno();
		dao.pinfoDelete(pno);
		dao.pphotosDelete(pno);
		edao.ephotoPnoDelete(pno);

		dao.update(pvo);
		List<PphotosVO> list = new ArrayList<PphotosVO>();
		for (int i = 0; i < phvo.getPphoto().size(); i++) {
			PphotosVO vo = new PphotosVO();
			vo.setPphotostr(phvo.getPphoto().get(i));
			vo.setPno(phvo.getPno());
			list.add(vo);
		}

		list.forEach(vo -> {
			try {
				dao.productsPhotoWritePno(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});

		for (int i = 0; i < ivo.getList().size(); i++) {

			if (ivo.getList().get(i).getPicolor() != null) {

				dao.productsDetailWritePno(ivo.getList().get(i));
			}
		}
	}

	@Override
	public List<PphotosVO> pphotoRead(int pno) throws Exception {
		return dao.pphotosRead(pno);
	}

	@Override
	public void qstatus(int qno) throws Exception {
		dao.qstatus(qno);

	}

	
	@Override
	public List<ProductsVO> memberRead(int pno) throws Exception {
		return dao.read(pno);
	}

	// thema번호 가져오는 함수
	@Override
	public AdminVO themaGet(int pno) throws Exception {
		return dao.themaGet(pno);
	}

	@Override
	public List<PinfoVO> infoColor(int pno) throws Exception {
		return dao.infoColor(pno);
	}

	@Override
	public List<PinfoVO> infoSize(PinfoVO vo) throws Exception {
		return dao.infoSize(vo);
	}

	@Override
	public List<ProductsVO> pkindList(ProductsVO vo) throws Exception {
		return dao.pkindList(vo);
	}

	@Override
	public List<ProductsVO> hitItem(AdminVO vo) throws Exception {
		return dao.hitItem(vo);
	}

	@Override
	public List<ProductsVO> newItem(AdminVO vo) throws Exception {
		return dao.newItem(vo);
	}

	@Override
	public List<ProductsVO> mGenderList(String pgender) throws Exception {
		return dao.mGenderList(pgender);
	}

	@Override
	public List<ProductsVO> mPkindList(String pkind) throws Exception {
		return dao.mPkindList(pkind);
	}

	@Override
	public List<ProductsVO> mTotalList() throws Exception {
		return dao.mTotalList();
	}
}