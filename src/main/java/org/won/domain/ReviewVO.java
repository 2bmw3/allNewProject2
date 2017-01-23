package org.won.domain;

import java.util.Date;

public class ReviewVO {
	private int rno, pno, rgrade;
	private String userid, rcontent, rphoto,rregdate;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getRgrade() {
		return rgrade;
	}

	public void setRgrade(int rgrade) {
		this.rgrade = rgrade;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRphoto() {
		return rphoto;
	}

	public void setRphoto(String rphoto) {
		this.rphoto = rphoto;
	}

	public String getRregdate() {
		return rregdate;
	}

	public void setRregdate(String rregdate) {
		this.rregdate = rregdate;
	}

	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", pno=" + pno + ", rgrade=" + rgrade + ", userid=" + userid + ", rcontent="
				+ rcontent + ", rphoto=" + rphoto + ", rregdate=" + rregdate + "]";
	}



}
