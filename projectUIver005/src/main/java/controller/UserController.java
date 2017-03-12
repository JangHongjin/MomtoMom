package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Mom2momService;
import model.domain.UserDTO;

@Controller
@RequestMapping("/user/*")
public class UserController {

	//예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionProcess(Exception e){
		return "redirect:/showError.jsp?errorMsg=" + e.getMessage();
	}
	 //로그인
    @RequestMapping(value="loginCheck.do")
    public ModelAndView loginCheck(String usrEmail, String usrPw, HttpSession session)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	String result = Mom2momService.loginCheck(usrEmail, usrPw, session);
    	if(result != null){//이메일, 비밀번호 일치한 경우 Nickname반환
    		System.out.println("비번일치");
    		if(session.getAttribute("usrGrant").equals("관리자")){//관리자인 경우 관리자페이지로
    			System.out.println("관리자페이지로");
    			mv.setViewName("mainLoginAdmin");
    		}else{
    			System.out.println("일반페이지로");
    			mv.setViewName("mainLogin");
    		}
    		mv.addObject("message", "success");
    	}else{
    		mv.setViewName("mainUnlogin");
        	mv.addObject("message", "이메일 또는 비밀번호가 일치하지 않습니다.");
    	}
    	
    	
    	return mv;
    }
    //로그아웃
    @RequestMapping(value="logout.do")
    public ModelAndView logout(HttpSession session)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	if(session.getAttribute("usrNick")==null){
    		mv.setViewName("mainUnlogin");
        	mv.addObject("message", "");
    	}else{
    		Mom2momService.logout(session);
        	mv.setViewName("mainUnlogin");
        	mv.addObject("message", "로그아웃되었습니다.");
    	}
    	
    	return mv;
    }
    //회원가입 
    @RequestMapping(value="insertUser.do")
    public ModelAndView insertUser(UserDTO user)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("mainUnlogin");
    	mv.addObject("insertUser", Mom2momService.insertUser(user));
    	mv.addObject("message", "가입 신청이 완료되었습니다.");
    	return mv;	//이미 존재할 경우 false반환함
    }
    //회원정보보기-일반
    @RequestMapping(value="getUser.do")
    public ModelAndView getUser(String usrNick)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("userDetail");
    	mv.addObject("getUser",Mom2momService.getUser(usrNick));
    	return mv;
    }
    //회원정보보기-관리자뷰
    @RequestMapping(value="getUserAdmin.do")
    public ModelAndView getUserAdmin(String usrNick)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("userDetailAdmin");
    	mv.addObject("getUser",Mom2momService.getUser(usrNick));
    	return mv;
    }
    //회원리스트보기-관리자뷰
    @RequestMapping(value="getAllUser.do")
    public ModelAndView getAllUser(HttpSession session)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("userList");
    	mv.addObject("getAllUser",Mom2momService.getAllUser());
    	return mv;
    }
    //회원정보수정-개인
    @RequestMapping(value="updateUser.do")
    public ModelAndView updateUser(UserDTO user, HttpSession session)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	//비민번호 체크	- usrNick 반환
    	String result = Mom2momService.pwCheck(user.getUsrEmail(), user.getUsrPw());
    	if(result.equals(user.getUsrNick())){	//비밀번호 일치하면 수청 처리후, 전체 회원 목록으로 리다이렉트? 는 관리자. 여긴 메인메뉴로
    		Mom2momService.updateUser(user);
    		if(session.getAttribute("usrGrant").equals("관리자")){
    			mv.setViewName("userDetailAdmin");
    		}else{
    			mv.setViewName("userDetail");
    		}
    		
    		mv.addObject("getUser", Mom2momService.getUser(user.getUsrNick()));
    		mv.addObject("message", "수정 완료되었습니다.");
    	}else{	//비밀번호 불일치, div에 불일치 문구 출력, userDetail.jsp로 포워드
    		mv.setViewName("userDetail");
    		mv.addObject("getUser", user);
    		mv.addObject("message", "비밀번호 불일치");
    	}
    	return mv;
    	
    }
    //회원정보수정-관리자(등급)
    @RequestMapping(value="updateUserGrant.do")
    public ModelAndView updateUserGrant(String usrNick, String usrGrant)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("회원정보수정화면");
    	mv.addObject("loginCheck",Mom2momService.updateUserGrant(usrNick,usrGrant));
    	return mv;
    }
    //회원탈퇴-관리자
    @RequestMapping(value="deleteUser.do")
    public ModelAndView deleteUser(UserDTO user, HttpSession session)throws Exception{
    	ModelAndView mv = new ModelAndView();
    	//비민번호 체크	- usrNick 반환
    	String result = Mom2momService.loginCheck(user.getUsrEmail(), user.getUsrPw(), session);
    	System.out.println(user.getUsrPw());
    	System.out.println("result값!@ " + result);
    	if(result.equals(user.getUsrNick())){	//비밀번호 일치하면 삭제 처리후, 전체 회원 목록으로
    		Mom2momService.deleteUser(user);
    		if(session.getAttribute("usrGrant") == "관리자"){
    			mv.setViewName("userDetailAdmin");
    		}else{
    			mv.setViewName("mainUnlogin");//*** 자동 로그아웃처리 필요
    		}
    		mv.addObject("getAllUser",Mom2momService.getAllUser());
    		mv.addObject("message", "삭제 완료되었습니다.<a href='${path}/user/getAllUser.do'>회원리스트</a>");
    	}else{	//비밀번호 불일치, div에 불일치 문구 출력, userDetail.jsp로 포워드
    		mv.setViewName("userDetail");
    		mv.addObject("getUser", user);
    		mv.addObject("message", "비밀번호 불일치");
    	}
    	return mv;
    }
      
}