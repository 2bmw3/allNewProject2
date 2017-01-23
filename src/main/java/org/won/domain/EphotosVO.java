package org.won.domain;

import java.util.List;

public class EphotosVO {

	private int pno;
	private List<String> ephoto;
	private String ephotostr;

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public List<String> getEphoto() {
		return ephoto;
	}

	public void setEphoto(List<String> ephoto) {
		this.ephoto = ephoto;
	}

	public String getEphotostr() {
		return ephotostr;
	}

	public void setEphotostr(String ephotostr) {
		this.ephotostr = ephotostr;
	}

	@Override
	public String toString() {
		return "EphotosVO [pno=" + pno + ", ephoto=" + ephoto + ", ephotostr=" + ephotostr + "]";
	}

}