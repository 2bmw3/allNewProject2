package org.won.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

//s
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.won.domain.AdminVO;
import org.won.domain.CartVO;
import org.won.domain.OrderVO;
import org.won.domain.PinfoVO;
import org.won.domain.ProductsVO;
import org.won.service.AdminService;
import org.won.service.BoardService;
import org.won.service.MemberService;
import org.won.service.OrderService;
import org.won.service.ProductsService;
import org.won.util.CookieUtil;
import org.won.util.PageingUtil;

@RequestMapping("/member/*")
@Controller
public class MemberController {

	@Inject
	private ProductsService pservice;
	@Inject
	private BoardService bservice;
	@Inject
	private OrderService oservice;
	@Inject
	private MemberService mservice;
	@Inject
	private AdminService aservice;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private CookieUtil cookieUtil = new CookieUtil();

	@GetMapping("/index")
	public void index(Model model) throws Exception {
		model.addAttribute("indexList", mservice.indexList());
	}

	/* 멤버 전체 리스트 */
	@GetMapping("/list")
	public void list(Model model) throws Exception {

		model.addAttribute("list", pservice.mTotalList());
	}

	@GetMapping("/genderList")
	public void maleList(Model model, String pgender) throws Exception {

		model.addAttribute("list", pservice.mGenderList(pgender));
	}


	@GetMapping("/categoryList")
	public void topList(Model model, String pkind) throws Exception {

		model.addAttribute("list", pservice.mPkindList(pkind));
	}

	// thema1 start
	@GetMapping("/thema1/index")
	public void thema1Index(String shopname, Model model) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		AdminVO vo = new AdminVO();
		vo.setAdminid(adminid);
		vo.setLimitnum(8);
		List<ProductsVO> viewList = new ArrayList<ProductsVO>();
		List<ProductsVO> hitItem = pservice.hitItem(vo);
		List<ProductsVO> newItem = pservice.newItem(vo);

		int hitItemSize = hitItem.size();
		int newItemSize = newItem.size();

		for (int i = 0; i < hitItemSize; i++) {
			viewList.add(i, hitItem.get(i));
		}
		for (int i = 0; i < newItemSize; i++) {
			viewList.add((i + hitItemSize), newItem.get(i));
		}

		model.addAttribute("viewList", viewList);
		model.addAttribute("hitItem", hitItem);
		model.addAttribute("newItem", newItem);
	}

	@GetMapping("/thema1/categoryList")
	public void thema1categoryList(int pageNum, Model model, String shopname, String pkind) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		ProductsVO vo = new ProductsVO();
		int page = (pageNum - 1) * 9;
		vo.setPage(page);
		vo.setAdminid(adminid);
		vo.setPkind(pkind);

		int totalData = pservice.pkindTotal(vo);
		PageingUtil pageing = new PageingUtil(totalData, pageNum);

		model.addAttribute("list", pservice.pkindList(vo));
		model.addAttribute("page", pageing);
		model.addAttribute("actionName", "topList");
		model.addAttribute("total", totalData);
		model.addAttribute("pageNum", pageNum);
	}

	@GetMapping("/thema1/view")
	public void thema1View(int pno, Model model) throws Exception {
		model.addAttribute("view", pservice.read(pno));
		model.addAttribute("review", bservice.reviewRead(pno));
		model.addAttribute("qna", pservice.question(pno));
		model.addAttribute("answer", pservice.answerRead(pno));
		model.addAttribute("infoColor", pservice.infoColor(pno));
	}

	@GetMapping("/thema1/faq")
	public void thema1Faq() {
	}

	@GetMapping("/thema1/account")
	public void thema1Account() {
	}

	@GetMapping("/thema1/cart")
	public void thema1Cart(String shopname, Model model,HttpServletRequest request) throws Exception {
		CartVO vo = new CartVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));
		model.addAttribute("cart", oservice.cartList(vo));
	}

	@GetMapping("/thema1/checkout")
	public void thema1Checkout() {
	}
	
	@GetMapping("/thema1/order")
	public void thema1Order(String shopname, Model model, HttpServletRequest request) throws Exception {
		
		OrderVO vo = new OrderVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));
		
		model.addAttribute("order", oservice.memberOrderList(vo));
	}
	// thema1 end!

	// thema2 start
	@GetMapping("/thema2/index")
	public void thema2Index(String shopname, Model model) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		AdminVO vo = new AdminVO();
		vo.setAdminid(adminid);
		vo.setLimitnum(8);

		model.addAttribute("hitItem", pservice.hitItem(vo));
		model.addAttribute("newItem", pservice.newItem(vo));
	}

	// 전체 리스트
	@GetMapping("/thema2/list")
	public void thema2List(int pageNum, Model model, String shopname) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		int totalData = pservice.total(adminid);
		PageingUtil pageing = new PageingUtil(totalData, pageNum);
		ProductsVO vo = new ProductsVO();

		int page = (pageNum - 1) * 9;
		vo.setPage(page);
		vo.setAdminid(adminid);

		model.addAttribute("list", pservice.list(vo));
		model.addAttribute("page", pageing);
		model.addAttribute("actionName", "list");
		model.addAttribute("total", totalData);
		model.addAttribute("pageNum", pageNum);
	}

	@GetMapping("/thema2/categoryList")
	public void thema2categoryList(int pageNum, Model model, String shopname, String pkind) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		ProductsVO vo = new ProductsVO();
		int page = (pageNum - 1) * 9;
		vo.setPage(page);
		vo.setAdminid(adminid);
		vo.setPkind(pkind);

		int totalData = pservice.pkindTotal(vo);
		PageingUtil pageing = new PageingUtil(totalData, pageNum);

		model.addAttribute("list", pservice.pkindList(vo));
		model.addAttribute("page", pageing);
		model.addAttribute("actionName", "topList");
		model.addAttribute("total", totalData);
		model.addAttribute("pageNum", pageNum);
	}


	@GetMapping("/thema2/view")
	public void thema2View(int pno, Model model) throws Exception {
		model.addAttribute("view", pservice.read(pno));
		model.addAttribute("review", bservice.reviewRead(pno));
		model.addAttribute("qna", pservice.question(pno));
		model.addAttribute("answer", pservice.answerRead(pno));
		model.addAttribute("infoColor", pservice.infoColor(pno));
	
	}

	// cart
	@GetMapping("/thema2/cart")
	public void thema2Cart(String shopname, Model model,HttpServletRequest request) throws Exception {

		CartVO vo = new CartVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));

		model.addAttribute("cart", oservice.cartList(vo));

	}

	@GetMapping("/thema2/order")
	public void thema2Order(String shopname, Model model,HttpServletRequest request) throws Exception {
		
		OrderVO vo = new OrderVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));
		
		model.addAttribute("order", oservice.memberOrderList(vo));
	}
	// thema2 end

	// thema3 start
	@GetMapping("/thema3/index")
	public void thema3Index(String shopname, Model model) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		AdminVO vo = new AdminVO();
		vo.setAdminid(adminid);
		vo.setLimitnum(6);

		model.addAttribute("hitItem", pservice.hitItem(vo));
	}

	@GetMapping("/thema3/list")
	public void thema3List(int pageNum, Model model, String shopname) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		int totalData = pservice.total(adminid);
		PageingUtil pageing = new PageingUtil(totalData, pageNum);
		ProductsVO vo = new ProductsVO();

		int page = (pageNum - 1) * 9;
		vo.setPage(page);
		vo.setAdminid(adminid);

		model.addAttribute("list", pservice.list(vo));
		model.addAttribute("page", pageing);
		model.addAttribute("actionName", "list");
		model.addAttribute("total", totalData);
		model.addAttribute("pageNum", pageNum);
	}

	@GetMapping("/thema3/categoryList")
	public void thema3topList(int pageNum, Model model, String shopname, String pkind) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		ProductsVO vo = new ProductsVO();
		int page = (pageNum - 1) * 9;
		vo.setPage(page);
		vo.setAdminid(adminid);
		vo.setPkind(pkind);

		int totalData = pservice.pkindTotal(vo);
		PageingUtil pageing = new PageingUtil(totalData, pageNum);

		model.addAttribute("list", pservice.pkindList(vo));
		model.addAttribute("page", pageing);
		model.addAttribute("actionName", "topList");
		model.addAttribute("total", totalData);
		model.addAttribute("pageNum", pageNum);
	}

	@GetMapping("/thema3/view")
	public void thema3View(int pno, Model model) throws Exception {
		model.addAttribute("view", pservice.read(pno));
		model.addAttribute("review", bservice.reviewRead(pno));
		model.addAttribute("qna", pservice.question(pno));
		model.addAttribute("answer", pservice.answerRead(pno));
		model.addAttribute("infoColor", pservice.infoColor(pno));
	}

	@GetMapping("/thema3/order")
	public void thema3Order(String shopname, Model model, HttpServletRequest request) throws Exception {
		
		OrderVO vo = new OrderVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));
		
		model.addAttribute("order", oservice.memberOrderList(vo));
	}

	@GetMapping("/thema3/cart")
	public void thema3Cart(String shopname, Model model, HttpServletRequest request) throws Exception {

		CartVO vo = new CartVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));

		model.addAttribute("cart", oservice.cartList(vo));
	}

	// thema3 end

	// thema4 strat
	@GetMapping("/thema4/categoryList")
	public void thema4topList(int pageNum, Model model, String shopname, String pkind) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		ProductsVO vo = new ProductsVO();
		int page = (pageNum - 1) * 9;
		vo.setPage(page);
		vo.setAdminid(adminid);
		vo.setPkind(pkind);

		int totalData = pservice.pkindTotal(vo);
		PageingUtil pageing = new PageingUtil(totalData, pageNum);

		model.addAttribute("list", pservice.pkindList(vo));
		model.addAttribute("page", pageing);
		model.addAttribute("actionName", "topList");
		model.addAttribute("total", totalData);
		model.addAttribute("pageNum", pageNum);
	}

	// thema4 view
	@GetMapping("/thema4/view")
	public void thema4View(int pno, Model model) throws Exception {
		model.addAttribute("view", pservice.read(pno));
		model.addAttribute("review", bservice.reviewRead(pno));
		model.addAttribute("qna", pservice.question(pno));
		model.addAttribute("answer", pservice.answerRead(pno));
		model.addAttribute("infoColor", pservice.infoColor(pno));
	}

	@GetMapping("/thema4/index")
	public void thema4Index(String shopname, Model model) throws Exception {
		String adminid = aservice.getAdminId(shopname);
		AdminVO vo = new AdminVO();
		vo.setAdminid(adminid);
		vo.setLimitnum(6);

		model.addAttribute("newItem", pservice.newItem(vo));
	}
	@GetMapping("/thema4/cart")
	public void thema4Cart(String shopname, Model model, HttpServletRequest request) throws Exception {

		CartVO vo = new CartVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));

		model.addAttribute("cart", oservice.cartList(vo));
	}
	
	@GetMapping("/thema4/order")
	public void thema4SOrder(String shopname, Model model, HttpServletRequest request) throws Exception {
		
		OrderVO vo = new OrderVO();
		vo.setShopname(shopname);
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));
		
		model.addAttribute("order", oservice.memberOrderList(vo));
	}
	// thema4 end

	// cart
	@PostMapping("/cartDelete")
	public @ResponseBody void cartDelete(int cno) throws Exception {

		
		oservice.cartDelete(cno);
	}

	@PostMapping("/cartAdd")
	public void cartAdd(CartVO vo, HttpServletRequest request) throws Exception {
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));
		oservice.cartAdd(vo);
	}

	@GetMapping("/infoSize")
	public @ResponseBody List<PinfoVO> infoSize(PinfoVO vo) throws Exception {
		List<PinfoVO> list = pservice.infoSize(vo);
		return list;
	}
	@PostMapping("/orderWrite")
	public String orderWrite(OrderVO vo,String userid, HttpServletRequest request) throws Exception {
		logger.info("ssssssssssssssssssssssssssssssssss"+vo);
		AdminVO themaNum = pservice.themaGet(vo.getPno());
		vo.setUserid(cookieUtil.cookieUtil(request,"userid"));
		if(vo.getList() == null){
			List<OrderVO> ovo = new ArrayList<>();
			ovo.add(0, vo);
			vo.setList(ovo);
		
		}
		String shopname = URLEncoder.encode(vo.getShopname(), "UTF-8");
	
		oservice.memberOrderWrite(vo);
		
		return "redirect:thema"+themaNum.getThema()+"/order?shopname="+shopname;
	}
	@PostMapping("/memberOrderAction")
	public void memberOrderAction(int odno) throws Exception {
		oservice.memberOrderUpdate(odno);
	}

}