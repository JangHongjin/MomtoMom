package model.domain;

public class UserDTO {
	private int rnum;
	private String usrNick;			//회원닉네임
	private String usrEmail;		//회원이메일
	private String usrPw;			//회원비밀번호
	private String usrBirth;		//회원자녀생년월일
	private String usrCom;			//회원소속회사
	private String usrGrant;		//회원등급
	private String usrPhone;		//회원휴대전화번호
	private int usrExist;			//회원탈퇴여부
	
	public UserDTO() {}

	public UserDTO(int rnum, String usrNick, String usrEmail, String usrPw, String usrBirth, String usrCom, String usrGrant,
			String usrPhone, int usrExist) {
		this.rnum = rnum;
		this.usrNick = usrNick;
		this.usrEmail = usrEmail;
		this.usrPw = usrPw;
		this.usrBirth = usrBirth;
		this.usrCom = usrCom;
		this.usrGrant = usrGrant;
		this.usrPhone = usrPhone;
		this.usrExist = usrExist;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getUsrNick() {
		return usrNick;
	}

	public void setUsrNick(String usrNick) {
		this.usrNick = usrNick;
	}

	public String getUsrEmail() {
		return usrEmail;
	}

	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}

	public String getUsrPw() {
		return usrPw;
	}

	public void setUsrPw(String usrPw) {
		this.usrPw = usrPw;
	}

	public String getUsrBirth() {
		return usrBirth;
	}

	public void setUsrBirth(String usrBirth) {
		this.usrBirth = usrBirth;
	}

	public String getUsrCom() {
		return usrCom;
	}

	public void setUsrCom(String usrCom) {
		this.usrCom = usrCom;
	}

	public String getUsrGrant() {
		return usrGrant;
	}

	public void setUsrGrant(String usrGrant) {
		this.usrGrant = usrGrant;
	}

	public String getUsrPhone() {
		return usrPhone;
	}

	public void setUsrPhone(String usrPhone) {
		this.usrPhone = usrPhone;
	}

	public int getUsrExist() {
		return usrExist;
	}

	public void setUsrExist(int usrExist) {
		this.usrExist = usrExist;
	}

	@Override
	public String toString() {
		return "UserDTO [rnum=" + rnum + ", usrNick=" + usrNick + ", usrEmail=" + usrEmail + ", usrPw=" + usrPw
				+ ", usrBirth=" + usrBirth + ", usrCom=" + usrCom + ", usrGrant=" + usrGrant + ", usrPhone=" + usrPhone
				+ ", usrExist=" + usrExist + "]";
	}
	
	
	
	
	
}
