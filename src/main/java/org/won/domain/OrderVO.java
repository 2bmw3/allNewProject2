package org.won.domain;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class OrderVO {

	private int ono, pino, ocnt, price, odno, page, pno,cno;
	private String userid, shopname, ptitlephoto, ophonenumber, oaddress, pname, pisize, picolor, uname, ostatus,
			adminid;
	private Date orderDate;
	private List<OrderVO> list;
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getPino() {
		return pino;
	}
	public void setPino(int pino) {
		this.pino = pino;
	}
	public int getOcnt() {
		return ocnt;
	}
	public void setOcnt(int ocnt) {
		this.ocnt = ocnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOdno() {
		return odno;
	}
	public void setOdno(int odno) {
		this.odno = odno;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getPtitlephoto() {
		return ptitlephoto;
	}
	public void setPtitlephoto(String ptitlephoto) {
		this.ptitlephoto = ptitlephoto;
	}
	public String getOphonenumber() {
		return ophonenumber;
	}
	public void setOphonenumber(String ophonenumber) {
		this.ophonenumber = ophonenumber;
	}
	public String getOaddress() {
		return oaddress;
	}
	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPisize() {
		return pisize;
	}
	public void setPisize(String pisize) {
		this.pisize = pisize;
	}
	public String getPicolor() {
		return picolor;
	}
	public void setPicolor(String picolor) {
		this.picolor = picolor;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getOstatus() {
		return ostatus;
	}
	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public List<OrderVO> getList() {
		return list;
	}
	public void setList(List<OrderVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", pino=" + pino + ", ocnt=" + ocnt + ", price=" + price + ", odno=" + odno
				+ ", page=" + page + ", pno=" + pno + ", cno=" + cno + ", userid=" + userid + ", shopname=" + shopname
				+ ", ptitlephoto=" + ptitlephoto + ", ophonenumber=" + ophonenumber + ", oaddress=" + oaddress
				+ ", pname=" + pname + ", pisize=" + pisize + ", picolor=" + picolor + ", uname=" + uname + ", ostatus="
				+ ostatus + ", adminid=" + adminid + ", orderDate=" + orderDate + ", list=" + list + "]";
	}





}