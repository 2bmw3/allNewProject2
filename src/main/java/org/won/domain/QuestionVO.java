package org.won.domain;

public class QuestionVO {
	private int qno, pno;
	private String qcontent, qwriter, qpw, qstatus, ptitlephoto, pname, qregdate;

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public String getQpw() {
		return qpw;
	}

	public void setQpw(String qpw) {
		this.qpw = qpw;
	}

	public String getQstatus() {
		return qstatus;
	}

	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
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

	public String getQregdate() {
		return qregdate;
	}

	public void setQregdate(String qregdate) {
		this.qregdate = qregdate;
	}

	@Override
	public String toString() {
		return "QuestionVO [qno=" + qno + ", pno=" + pno + ", qcontent=" + qcontent + ", qwriter=" + qwriter + ", qpw="
				+ qpw + ", qstatus=" + qstatus + ", ptitlephoto=" + ptitlephoto + ", pname=" + pname + ", qregdate="
				+ qregdate + "]";
	}

}
