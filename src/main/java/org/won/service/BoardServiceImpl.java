package org.won.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.won.domain.ReviewVO;
import org.won.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public List<ReviewVO> reviewRead(int pno) throws Exception {
		return dao.reviewRead(pno);
	}

	@Override
	public void rCreate(ReviewVO vo) throws Exception {
		dao.rCreate(vo);
	}

}
