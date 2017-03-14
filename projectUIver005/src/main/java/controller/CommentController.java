package controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.BoardDef;
import model.Mom2momService;
import model.domain.BoardDTO;
import model.domain.CommentDTO;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	// 예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionProcess(Exception e) {
		return "redirect:/showError.jsp?errorMsg=" + e.getMessage();
	}
	
	/*//댓글보기
	@RequestMapping(value ="getAllComment.do")
	public ArrayList<CommentDTO> getAllComment(@RequestParam int bPno,HttpRequest request)throws Exception{
		ArrayList<CommentDTO> list = Mom2momService.getAllComment(bPno);
		return list;
	}*/
	
	//댓글보기
	@RequestMapping(value ="getAllComment.do")
	public String getAllComment(@RequestParam int bPno, HttpServletRequest req)throws Exception{
		ArrayList<CommentDTO> list = Mom2momService.getAllComment(bPno);
		req.setAttribute("list", list);
		return "forward:/boardDetail.jsp";
	}
	
	
	// 댓글쓰기
	@RequestMapping(value = "writeComment.do", method=RequestMethod.POST)
	public ModelAndView writeComment(CommentDTO comm, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		//BoardDTO board = (BoardDTO) request.getAttribute("getBoardDetail");
		mv.setViewName("boardDetail");
		mv.addObject("writeComment",Mom2momService.writeComment(comm));
		mv.addObject("getBoardDetail", Mom2momService.getBoardDetail(comm.getbPno()));
		mv.addObject("getAllComment" ,Mom2momService.getAllComment(comm.getbPno()));
		return mv;
	}
	
	//댓글수정(본인?)
	@RequestMapping(value = "updateComment.do")
	public ModelAndView updateComment(CommentDTO comm) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("게시판화면");
		mv.addObject("updateComment",Mom2momService.updateComment(comm));
		return mv;
	}
	
	//댓글삭제(본인?)
	@RequestMapping(value = "deleteComment.do")
	public ModelAndView deleteComment(int commNo,int bPno) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardDetail");
		mv.addObject("deleteComment",Mom2momService.deleteComment(commNo));
		mv.addObject("getBoardDetail", Mom2momService.getBoardDetail(bPno));
		mv.addObject("getAllComment" ,Mom2momService.getAllComment(bPno));
		return mv;
	}
}