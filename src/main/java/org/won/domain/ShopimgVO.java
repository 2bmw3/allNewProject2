package org.won.domain;

import java.util.List;

public class ShopimgVO {

	private String adminid, bannerstr, bannersize, exsrc;
	private List<String> banner;

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getBannerstr() {
		return bannerstr;
	}

	public void setBannerstr(String bannerstr) {
		this.bannerstr = bannerstr;
	}

	public String getBannersize() {
		return bannersize;
	}

	public void setBannersize(String bannersize) {
		this.bannersize = bannersize;
	}

	public String getExsrc() {
		return exsrc;
	}

	public void setExsrc(String exsrc) {
		this.exsrc = exsrc;
	}

	public List<String> getBanner() {
		return banner;
	}

	public void setBanner(List<String> banner) {
		this.banner = banner;
	}

	@Override
	public String toString() {
		return "ShopimgVO [adminid=" + adminid + ", bannerstr=" + bannerstr + ", bannersize=" + bannersize + ", exsrc="
				+ exsrc + ", banner=" + banner + "]";
	}

}
