package controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.BoardDAO;
import model.Mom2momService;
import model.domain.BoardDTO;
import model.domain.NoticeBoardDTO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	// 예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionProcess(Exception e) {
		return "redirect:/showError.jsp?errorMsg=" + e.getMessage();
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
	public ModelAndView getBoardList(String boardName, int pageNo) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardList");
		mv.addObject("getBoardList", Mom2momService.getBoardList(boardName, pageNo));
		return mv;
	}

	// 게시글읽기
	@RequestMapping(value = "getBoardDetail.do")
	public ModelAndView getBoardDetail(String boardName, int bPno) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardDetail");
		mv.addObject("getBoardDetail", Mom2momService.getBoardDetail(boardName, bPno));
		return mv;
	}

	// 게시글쓰기
	@RequestMapping(value = "boardWrite.do")
	public ModelAndView boardWrite(BoardDTO board) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardDetail");
		mv.addObject("boardWrite", Mom2momService.boardWrite(board));
		return mv;
	}
	//공지사항 쓰기
	@RequestMapping(value = "noticeBoardWrite.do")
	public ModelAndView noticeBoardWrite(NoticeBoardDTO board) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardDetail");
		mv.addObject("noticeBoardWrite", Mom2momService.noticeBoardWrite(board));
		return mv;
	}

	// 게시글수정
	@RequestMapping(value = "updateBoard.do")
	public ModelAndView updateBoard(BoardDTO board) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardDetail");
		mv.addObject("updateBoard", Mom2momService.updateBoard(board));
		return mv;
	}

	// 게시글삭제
	@RequestMapping(value = "deleteBoard.do")
	public ModelAndView deleteBoard(BoardDTO board) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardList");
		mv.addObject("deleteBoard", Mom2momService.deleteBoard(board));
		return mv;
	}
	//조회수 증가
	@RequestMapping(value="readNumIncrease.do")
	public ModelAndView readNumIncrease(BoardDTO board)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("readNumIncrease", Mom2momService.readNumIncrease(board));
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