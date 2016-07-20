package kr.or.ksmart.dto;

public class Member {
	private String m_id = null;
	private String m_pw = null;
	private String m_level = null;
	private String m_name = null;
	private String m_email = null;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		System.out.println("setM_id Member.java m_id : " + m_id);
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		System.out.println("setM_id Member.java m_pw : " + m_pw);
		this.m_pw = m_pw;
	}

	public String getM_level() {
		return m_level;
	}

	public void setM_level(String m_level) {
		System.out.println("setM_id Member.java m_level : " + m_level);
		this.m_level = m_level;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		System.out.println("setM_id Member.java m_name : " + m_name);
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		System.out.println("setM_id Member.java m_name : " + m_email);
		this.m_email = m_email;
	}
}
