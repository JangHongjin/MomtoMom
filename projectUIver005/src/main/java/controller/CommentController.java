package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Mom2momService;
import model.domain.CommentDTO;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	// 예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionProcess(Exception e) {
		return "redirect:/showError.jsp?errorMsg=" + e.getMessage();
	}
	// 댓글쓰기
	@RequestMapping(value = "writeComment.do")
	public ModelAndView writeComment(CommentDTO comm) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("게시판화면");
		mv.addObject("writeComment",Mom2momService.writeComment(comm));
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
	public ModelAndView deleteComment(int commNo) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("게시판화면");
		mv.addObject("deleteComment",Mom2momService.deleteComment(commNo));
		return mv;
	}
}