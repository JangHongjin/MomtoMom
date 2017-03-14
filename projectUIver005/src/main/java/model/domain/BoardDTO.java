package model.domain;

public class BoardDTO {
   private int bPno;                  //게시글번호
   private int bNo;                  //게시판번호
   private String bTitle;
   private String bCon;            //게시글내용
   private String bDate;            //게시글작성일
   private int bReadNum;            //게시글조회수
   private int bLikeNum;            //게시글추천수
   private String bPic;               //게시글사진경로
   private String bAuthor;         //게시글작성자
   
   //댓글수를 위한 추가 변수
   private int commentCount;
   
   public BoardDTO() {}

   public BoardDTO(int bPno, int bNo, String bTitle, String bCon, String bDate, int bReadNum, int bLikeNum, String bPic, String bAuthor) {
      this.bPno = bPno;
      this.bNo = bNo;
      this.bTitle = bTitle;
      this.bCon = bCon;
      this.bDate = bDate;
      this.bReadNum = bReadNum;
      this.bLikeNum = bLikeNum;
      this.bAuthor = bAuthor;
      this.bPic = bPic;
   }

   public int getbPno() {
      return bPno;
   }

   public void setbPno(int bPno) {
      this.bPno = bPno;
   }

   public int getbNo() {
      return bNo;
   }

   public void setbNo(int bNo) {
      this.bNo = bNo;
   }

   public String getbTitle() {
      return bTitle;
   }

   public void setbTitle(String bTitle) {
      this.bTitle = bTitle;
   }

   public String getbCon() {
      return bCon;
   }

   public void setbCon(String bCon) {
      this.bCon = bCon;
   }

   public String getbDate() {
      return bDate;
   }

   public void setbDate(String bDate) {
      this.bDate = bDate;
   }

   public int getbReadNum() {
      return bReadNum;
   }

   public void setbReadNum(int bReadNum) {
      this.bReadNum = bReadNum;
   }

   public int getbLikeNum() {
      return bLikeNum;
   }

   public void setbLikeNum(int bLikeNum) {
      this.bLikeNum = bLikeNum;
   }

   public String getbAuthor() {
      return bAuthor;
   }

   public void setbAuthor(String bAuthor) {
      this.bAuthor = bAuthor;
   }

   public String getbPic() {
      return bPic;
   }

   public void setbPic(String bPic) {
      this.bPic = bPic;
   }
   
   //댓글 count를 위한 추가 메소드
   public void setCommentCount(int count){
      commentCount = count;
   }
   public int getCommentCount() {
      return commentCount;
   }
   
   @Override
   public String toString() {
      return "BoardDTO [bPno=" + bPno + ", bNo=" + bNo + ", bTitle=" + bTitle + ", bCon=" + bCon + ", bDate=" + bDate
            + ", bReadNum=" + bReadNum + ", bLikeNum=" + bLikeNum + ", bAuthor=" + bAuthor + ", bPic=" + bPic + "]";
   }

   
}