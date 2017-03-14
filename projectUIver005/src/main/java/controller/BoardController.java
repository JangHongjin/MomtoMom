package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.BoardDAO;
import model.BoardDef;
import model.Mom2momService;
import model.domain.BoardDTO;
import model.domain.NoticeBoardDTO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	//예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionProcess(Exception e){
		e.printStackTrace();
		return "redirect:/showError.jsp?errorMsg=" + e.getMessage();
	}
  
   //댓글 수 반환
   @RequestMapping(value="getCommentCount.do")
   public ModelAndView getCommentCount(int bPno)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.addObject("getCommentCount", Mom2momService.getCommentCount(bPno));
      return mv;
   }
   //게시글수 반환
   @RequestMapping(value ="getBoardListCount.do")
   public ModelAndView getBoardListCount(String boardName)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.addObject("getBoardListCount", Mom2momService.getBoardListCount(boardName));
      return mv;
   }
   
   //페이지수 반환
   @RequestMapping(value="getPageCount.do")
   public ModelAndView getPageCount(String boardName)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.addObject("getPageCount", Mom2momService.getPageCount(boardName));
      return mv;
   }
   //검색결과 게시글수 반환
   @RequestMapping(value="getSearchListCount.do")
   public ModelAndView getSearchListCount(String boardName, String searchCond, String searchContent)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.addObject("getSearchListCount", Mom2momService.getSearchListCount(boardName, searchCond, searchContent));
      return mv;
   }
   //검색결과 페이지수 반환
   @RequestMapping(value="getSearchPageCount.do")
   public  ModelAndView getSearchPageCount(String boardName, String searchCond, String searchContent)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.addObject("getSearchPageCount", Mom2momService.getSearchPageCount(boardName, searchCond, searchContent));
      return mv;
   }
   //게시글 검색
   public  ModelAndView searchBoard(String boardName, String searchCond, String searchContent, int pageNo)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.setViewName("게시판목록");
      mv.addObject("searchBoard", BoardDAO.searchBoard(boardName, searchCond, searchContent, pageNo));
      return mv;
   }
   
   // 게시글목록보기
   @RequestMapping(value = "getBoardList.do")
   public ModelAndView getBoardList(@RequestParam(defaultValue="1") int bNo,
		   							@RequestParam(defaultValue="all") String searchOption,
		   							@RequestParam(defaultValue="") String keyword
		   							) throws Exception {
	   ModelAndView mv = new ModelAndView();
	  System.out.println("keyword1 : " + keyword);
	  List<BoardDTO> list = Mom2momService.getBoardList(BoardDef.getBoardName(bNo), searchOption, keyword);
	  // 레코드의 갯수
	  int count = Mom2momService.countArticle(BoardDef.getBoardName(bNo), searchOption, keyword);
	  System.out.println("keyword2 : " + keyword);
	  if(count == 0){
		  mv.setViewName("boardList");
		  mv.addObject("message", "게시글이 없습니다.");
		  return mv;
	  }
	  
	  System.out.println("keyword3 : " + keyword);
	  System.out.println("count: " + count);

      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list); // list
      map.put("count", count); // 레코드의 갯수
      map.put("searchOption", searchOption); // 검색옵션
      map.put("keyword", keyword); // 검색키워드
      mv.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
      mv.setViewName("boardList"); // 뷰를 list.jsp로 설정
      mv.addObject("boardName", BoardDef.getBoardName(bNo));
      mv.addObject("bNo", bNo);
      for (int i = 0; i < list.size(); i++) {
          list.get(i).setCommentCount(Mom2momService.getCommentCount(list.get(i).getbPno()));
       }
       //mv.addObject("getCommentCount", Mom2momService.getCommentCount(mv.toString()))
      return mv;
   }
   
   // 05. 게시글 삭제
   @RequestMapping("deleteBoard.do")
   public String delete(BoardDTO board) throws Exception{
	   System.out.println("9999999999999");
	   Mom2momService.deleteBoard(board);
       return "redirect:getBoardList.do";
   }

   /*
   //삭제하기
   @RequestMapping(value = "deleteBoard.do")
   public ModelAndView deleteBoard(BoardDTO board) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println(board.toString());
      mv.setViewName("boardList");
      mv.addObject("deleteBoard", Mom2momService.deleteBoard(board));
      
      ArrayList<BoardDTO> boardList = Mom2momService.getBoardList(BoardDef.getBoardName(board.getbNo()), 1);
      mv.addObject("getBoardList", boardList);
      mv.addObject("getBno", boardList.get(0).getbNo());
      
      //ArrayList<Integer> commentCountList = new ArrayList<>();
      for (int i = 0; i < boardList.size(); i++) {
         boardList.get(i).setCommentCount(Mom2momService.getCommentCount(boardList.get(i).getbPno()));
      }
      //mv.addObject("getCommentCount", Mom2momService.getCommentCount(mv.toString()))
      return mv;
   }*/

   // 게시글읽기
   @RequestMapping(value = "getBoardDetail.do")
   public ModelAndView getBoardDetail(int bPno) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("boardDetail");
      mv.addObject("readNumIncrease",Mom2momService.readNumIncrease(bPno));
      mv.addObject("getBoardDetail", Mom2momService.getBoardDetail(bPno));
      mv.addObject("getAllComment" ,Mom2momService.getAllComment(bPno));
      
      return mv;
   }
   
   //글쓰기 페이지로
   @RequestMapping(value="boardWritePage.do")
   public ModelAndView boardWritePage()throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.setViewName("boardWrite");
      return mv;
   }
   
   // 게시글쓰기
   @RequestMapping(value = "boardWrite.do")
   public String boardWrite(BoardDTO board) throws Exception {
      ModelAndView mv = new ModelAndView();
      if(Mom2momService.boardWrite(board)){
    	  System.out.println("글쓰기 성공");
      }else{
    	  System.out.println("글쓰기 실패");
    	  throw new Exception("글쓰기 실패하였습니다.");
      }
      return "redirect:getBoardList.do";
   }
   //공지사항 쓰기
   @RequestMapping(value = "noticeBoardWrite.do")
   public ModelAndView noticeBoardWrite(NoticeBoardDTO board) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("boardDetail");
      mv.addObject("noticeBoardWrite", Mom2momService.noticeBoardWrite(board));
      return mv;
   }
   //게시글수정페이지
   @RequestMapping(value = "updateBoardPage.do")
   public ModelAndView updateBoardPage(BoardDTO board) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("boardUpdate");
      mv.addObject("getBoardDetail", Mom2momService.getBoardDetail(board.getbPno()));
      return mv;
   }
   // 게시글수정
   @RequestMapping(value = "updateBoard.do")
   public ModelAndView updateBoard(BoardDTO board) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println(board.toString());
      mv.setViewName("boardDetail");
      mv.addObject("updateBoard", Mom2momService.updateBoard(board));
      mv.addObject("getBoardDetail", Mom2momService.getBoardDetail(board.getbPno()));
      mv.addObject("getAllComment" ,Mom2momService.getAllComment(board.getbPno()));
      return mv;
   }

   
   //조회수 증가
   @RequestMapping(value="readNumIncrease.do")
   public ModelAndView readNumIncrease(int bPno)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.addObject("readNumIncrease", Mom2momService.readNumIncrease(bPno));
      return mv;
   }
   //추천수 증가
   @RequestMapping(value="likeNumIncrease.do")
   public ModelAndView likeNumIncrease(BoardDTO board)throws Exception{
      ModelAndView mv = new ModelAndView();
      mv.addObject("likeNumIncrease", Mom2momService.likeNumIncrease(board));
      return mv;
   }

}