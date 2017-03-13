package controller;

import javax.servlet.http.HttpServlet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Mom2momService;
import model.domain.MessageDTO;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	// 예외처리
		@ExceptionHandler(Exception.class)
		public String exceptionProcess(Exception e) {
			return "redirect:/showError.jsp?errorMsg=" + e.getMessage();
		}

		// 쪽지보내기
		@RequestMapping(value = "writeMessage.do")
		public ModelAndView writeMessage(MessageDTO message) throws Exception {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("받은쪽지함화면");
			mv.addObject("writeMessage",Mom2momService.writeMessage(message));
			return mv;

		}

		// 받은쪽지확인
		@RequestMapping(value = "getAllReceiveMessage.do")
		public ModelAndView getAllReceiveMessage(String rid) throws Exception {
			System.out.println(rid);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("rMsgList");
			mv.addObject("getAllReceiveMessage", Mom2momService.getAllReceiveMessage(rid));
			mv.addObject("rid", rid);
			return mv;
		}

		// 보낸쪽지확인
		@RequestMapping(value = "getAllSendMessage.do")
		public ModelAndView sentAllMessage(String sid) throws Exception {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("sMsgList");
			mv.addObject("getAllSendMessage", Mom2momService.getAllSendMessage(sid));
			mv.addObject("sid", sid);
			return mv;
		}

		// 쪽지상세확인
		@RequestMapping(value = "messageDetail.do")
		public ModelAndView messageDetail(int msgNo) throws Exception {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("쪽지상세보기화면");
			mv.addObject("messageDetail", Mom2momService.messageDetail(msgNo));
			return mv;
		}

		// 받은쪽지삭제
		@RequestMapping(value = "deleteMessage.do")
		public String deleteMessage(int msgNo, @ModelAttribute String rid) throws Exception {
			System.out.println("++++++ " + rid);
			Mom2momService.deleteMessage(msgNo);
			return "forward:/message/getAllReceiveMessage.do";
		}
		
		// 보낸쪽지삭제
		@RequestMapping(value = "deleteMessage2.do")
		public String deleteMessage2(int msgNo, @ModelAttribute String sid) throws Exception {
			System.out.println("++++++ " + sid);
			Mom2momService.deleteMessage(msgNo);
			return "forward:/message/getAllSendMessage.do";
		}
}