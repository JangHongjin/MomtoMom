package model;

public class BoardDef {

	public static String getBoardName(int boardNo) {
		
		switch (boardNo) {
		case 1:
			return "edu_board";
		case 2:
			return "free_board";
		case 3:
			return "qna_board";
		case 4:
			return "exp_board";
		case 5:
			return "market_board";
		case 6:
			return "age_board";
		case 7:
			return "etc_board";
		case 8:
			return "pic_board";
		case 9:
			return "notice_board";
		default:
			return null;
		}

	}
}
