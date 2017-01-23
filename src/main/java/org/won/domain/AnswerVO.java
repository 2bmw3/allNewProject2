package org.won.domain;

import java.util.Date;

public class AnswerVO {

	private int ano, qno;
	private String acontent, awriter;
	private Date aregdate;

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public String getAwriter() {
		return awriter;
	}

	public void setAwriter(String awriter) {
		this.awriter = awriter;
	}

	public Date getAregdate() {
		return aregdate;
	}

	public void setAregdate(Date aregdate) {
		this.aregdate = aregdate;
	}

	@Override
	public String toString() {
		return "AnswerVO [ano=" + ano + ", qno=" + qno + ", acontent=" + acontent + ", awriter=" + awriter
				+ ", aregdate=" + aregdate + "]";
	}

}
