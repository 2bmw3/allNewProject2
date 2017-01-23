package org.won.domain;

import java.util.Date;

public class AdminVO {

	private String adminid, adminpw, aname, aaddress, aemail, aphonenumber, shopname, businessnum, shoplogo, thema,
			titleimg;
	private Date aregdate;

	private int limitnum;

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpw() {
		return adminpw;
	}

	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAaddress() {
		return aaddress;
	}

	public void setAaddress(String aaddress) {
		this.aaddress = aaddress;
	}

	public String getAemail() {
		return aemail;
	}

	public void setAemail(String aemail) {
		this.aemail = aemail;
	}

	public String getAphonenumber() {
		return aphonenumber;
	}

	public void setAphonenumber(String aphonenumber) {
		this.aphonenumber = aphonenumber;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getBusinessnum() {
		return businessnum;
	}

	public void setBusinessnum(String businessnum) {
		this.businessnum = businessnum;
	}

	public String getShoplogo() {
		return shoplogo;
	}

	public void setShoplogo(String shoplogo) {
		this.shoplogo = shoplogo;
	}

	public String getThema() {
		return thema;
	}

	public void setThema(String thema) {
		this.thema = thema;
	}

	public String getTitleimg() {
		return titleimg;
	}

	public void setTitleimg(String titleimg) {
		this.titleimg = titleimg;
	}

	public Date getAregdate() {
		return aregdate;
	}

	public void setAregdate(Date aregdate) {
		this.aregdate = aregdate;
	}

	public int getLimitnum() {
		return limitnum;
	}

	public void setLimitnum(int limitnum) {
		this.limitnum = limitnum;
	}

	@Override
	public String toString() {
		return "AdminVO [adminid=" + adminid + ", adminpw=" + adminpw + ", aname=" + aname + ", aaddress=" + aaddress
				+ ", aemail=" + aemail + ", aphonenumber=" + aphonenumber + ", shopname=" + shopname + ", businessnum="
				+ businessnum + ", shoplogo=" + shoplogo + ", thema=" + thema + ", titleimg=" + titleimg + ", aregdate="
				+ aregdate + ", limitnum=" + limitnum + "]";
	}

}
