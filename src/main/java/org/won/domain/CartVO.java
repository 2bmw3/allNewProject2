package org.won.domain;

public class CartVO {
	
	private int cno, pino, ccnt, pno;
	private String userid, adminid ,ptitlephoto, pname, pisize, picolor, price, shopname;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPino() {
		return pino;
	}

	public void setPino(int pino) {
		this.pino = pino;
	}

	public int getCcnt() {
		return ccnt;
	}

	public void setCcnt(int ccnt) {
		this.ccnt = ccnt;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPtitlephoto() {
		return ptitlephoto;
	}

	public void setPtitlephoto(String ptitlephoto) {
		this.ptitlephoto = ptitlephoto;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}



	@Override
	public String toString() {
		return "CartVO [cno=" + cno + ", pino=" + pino + ", ccnt=" + ccnt + ", pno=" + pno + ", userid=" + userid
				+ ", adminid=" + adminid + ", ptitlephoto=" + ptitlephoto + ", pname=" + pname + ", pisize=" + pisize
				+ ", picolor=" + picolor + ", price=" + price + ", shopname=" + shopname + "]";
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}




	

}