package org.won.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.won.domain.AdminVO;
import org.won.domain.ParamVO;
import org.won.domain.PinfoVO;
import org.won.domain.PphotosVO;
import org.won.domain.ProductsVO;
import org.won.domain.ReviewVO;
import org.won.service.BoardService;
import org.won.domain.QuestionVO;
import org.won.service.EditorService;
import org.won.service.MemberService;
import org.won.service.ProductsService;
import org.won.util.CookieUtil;

import com.google.gson.Gson;

@Controller
public class ProductsController {

	private static final Logger logger = LoggerFactory.getLogger(ProductsController.class);

	@Inject
	private ProductsService service;

	@Inject
	private BoardService bservice;

	@Inject
	private EditorService eservice;

	@Inject
	private MemberService mservice;

	private CookieUtil cookieUtil = new CookieUtil();

	// 상품 삭제
	@PostMapping("/productsDelete")
	public @ResponseBody void productsDelete(int pno) throws Exception {
		System.out.println("cccccccpno=" + pno);
		service.delete(pno);
	}

	@GetMapping("/admin/productsUpdate")
	public void adminupdate(int pno, int pageNum, ParamVO vo, Model model) throws Exception {
		List<ProductsVO> list = service.updateProductsRead(pno);
		List<String> pname = new ArrayList<String>();
		for (ProductsVO productsVO : list) {
			pname.add(productsVO.getPphoto());
		}
		Gson gson = new Gson();
		model.addAttribute("pname", gson.toJson(pname));
		model.addAttribute("updateProductsRead", list);
		model.addAttribute("updateInfoRead", service.updateInfoRead(pno));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("param", vo);
	}

	@PostMapping("/adminUpdateAction")
	public String adminUpdateAction(ParamVO vo, HttpServletRequest request, ProductsVO pvo, PinfoVO ivo, PphotosVO phvo,
			int pageNum) throws Exception {
		pvo.setAdminid(cookieUtil.cookieUtil(request));
		service.update(pvo, ivo, phvo);
		service.containDelete();

		String str = null;
		if (vo.getJspName().equals("/list")) {
			str = vo.getJspName() + "?pageNum=" + pageNum;
		} else if (vo.getJspName().equals("/adminListSearch")) {
			String keyword = URLEncoder.encode(vo.getKeyword(), "UTF-8");
			str = vo.getJspName() + "?pageNum=" + pageNum + "&sType=" + vo.getsType() + "&keyword=" + keyword;
		} else if (vo.getJspName().equals("/index")) {
			str = "/index";
		} else {
			String pkind = URLEncoder.encode(vo.getPkind(), "UTF-8");
			str = vo.getJspName() + "?page=" + pageNum + "&pkind=" + pkind;
		}
		System.out.println("pull name = " + str);
		return "redirect:" + "/admin" + str;
	}

	@PostMapping(value = "/fbFileDelete", produces = "application/text; charset=utf8")
	public @ResponseBody String fbFileDelete(int pno) throws Exception {

		List<PphotosVO> list = service.pphotoRead(pno);
		String fileNames = "";

		for (int i = 0; i < list.size(); i++) {
			String fileName = list.get(i).getPphotostr();
			fileNames += fileName + "/";
		}

		return fileNames;
	}

	@GetMapping("/themaGet")
	public @ResponseBody AdminVO themaGet(int pno) throws Exception {
		AdminVO adminVO = new AdminVO();
		String shoplogo = null;
		String str = null;
		try {
			adminVO = service.themaGet(pno);
			shoplogo = "https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shoplogo%2F"
					+ adminVO.getShoplogo() + "?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e";
			str = "/member/thema" + adminVO.getThema() + "/view?pno=" + pno;
			adminVO.setShoplogo(shoplogo);
			adminVO.setThema(str);
		} catch (Exception e) {
			str = "fail";
			adminVO.setThema(str);
		}
		return adminVO;
	}

	@PostMapping("/questionWrite")
	public @ResponseBody String questionWrite(QuestionVO vo) throws Exception {
		mservice.questionWrite(vo);
		String result = service.question(vo.getPno()).get(0).getQregdate() + "#"
				+ service.question(vo.getPno()).get(0).getQno();

		return result;
	}

	@PostMapping(value = "/questionPwCheck", produces = "application/text; charset=utf8")
	public @ResponseBody String questionPwCheck(int qno, String qpw) throws Exception {
		List<String> answerList = mservice.answerList(qno);
		String originQpw = mservice.questionPwCheck(qno);
		String result = "F#";
		if (originQpw.equals(qpw)) {
			result = "T#";
			for (int i = 0; i < answerList.size(); i++) {
				result += mservice.answerList(qno).get(i) + "#";
			}
		}
		return result;
	}

	@PostMapping("/review")
	public @ResponseBody String review(ReviewVO rvo) throws Exception {
		rvo.setUserid("testUser");
		bservice.rCreate(rvo);
		String rno = bservice.reviewRead(rvo.getPno()).get(0).getRno()+"#";
		String date = bservice.reviewRead(rvo.getPno()).get(0).getRregdate().toString();
		String result = rno + date;
		logger.info("result... : " + result);
		// 스플릿해서
		return result;
	}

}