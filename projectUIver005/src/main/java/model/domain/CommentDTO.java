package model.domain;

public class CommentDTO {
	private int commNo;				//댓글번호
	private int bPno;						//댓글게시글번호
	private String usrNick;				//댓글작성자
	private String commCon;			//댓글내용
	private String commDate;		//댓글작성일
	
	public CommentDTO() {}

	public CommentDTO(int commNo, int bPno, String usrNick, String commCon, String commDate) {
		this.commNo = commNo;
		this.bPno = bPno;
		this.usrNick = usrNick;
		this.commCon = commCon;
		this.commDate = commDate;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public int getbPno() {
		return bPno;
	}

	public void setbPno(int bPno) {
		this.bPno = bPno;
	}

	public String getUsrNick() {
		return usrNick;
	}

	public void setUsrNick(String usrNick) {
		this.usrNick = usrNick;
	}

	public String getCommCon() {
		return commCon;
	}

	public void setCommCon(String commCon) {
		this.commCon = commCon;
	}

	public String getCommDate() {
		return commDate;
	}

	public void setCommDate(String commDate) {
		this.commDate = commDate;
	}
	
	
	
}
