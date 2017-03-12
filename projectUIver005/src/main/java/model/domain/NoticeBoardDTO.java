package model.domain;

public class NoticeBoardDTO  extends BoardDTO{
	private int bFlag;			//공지글중요도
	
	public NoticeBoardDTO() {}

	public NoticeBoardDTO(int bFlag) {
		this.bFlag = bFlag;
	}


	public NoticeBoardDTO(int bPno, int bNo, String bTitle, String bCon, String bDate, int bReadNum, int bLikeNum, String bAuthor, String bPic,
			int bFlag) {
		super(bPno, bNo, bTitle ,bCon, bDate, bReadNum, bLikeNum, bAuthor, bPic);
		this.bFlag = bFlag;
	}

	public int getbFlag() {
		return bFlag;
	}

	public void setbFlag(int bFlag) {
		this.bFlag = bFlag;
	}
}
