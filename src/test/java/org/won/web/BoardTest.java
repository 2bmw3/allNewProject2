package org.won.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.won.domain.ReviewVO;
import org.won.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardTest.class);

	@Inject
	private BoardService service;

	@Test
	public void rCreate() {
		
		ReviewVO vo = new ReviewVO();
		
		vo.setPno(357);
		vo.setRcontent("편해요");
		vo.setRphoto("aaa.jpg");
		vo.setUserid("kkk");
		vo.setRgrade(4);
		try {
			service.rCreate(vo);	
			logger.info("성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
