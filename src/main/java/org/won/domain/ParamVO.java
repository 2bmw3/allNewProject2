package org.won.domain;

public class ParamVO {

	String ppkind, sType, keyword, jspName;

	public String getPkind() {
		return ppkind;
	}

	public void setPkind(String pkind) {
		this.ppkind = pkind;
	}

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getJspName() {
		return jspName;
	}

	public void setJspName(String jspName) {
		this.jspName = jspName;
	}

	@Override
	public String toString() {
		return "ParamVO [pkind=" + ppkind + ", sType=" + sType + ", keyword=" + keyword + ", jspName=" + jspName + "]";
	}
	
	
	
}
