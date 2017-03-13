package model;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import model.domain.BoardDTO;
import model.domain.CommentDTO;
import model.domain.MessageDTO;
import model.domain.NoticeBoardDTO;
import model.domain.UserDTO;

public class Mom2momService {
	
	//게시글이 없을 경우
	public static void notExistBoard(String boardName, int pageNo)throws Exception{
		ArrayList<BoardDTO> boardList = new ArrayList<>(); 
    	boardList = BoardDAO.getBoardList(boardName,pageNo);
    	if(boardList==null){
    		throw new Exception("게시글이 없습니다.");
    	}
	}
	
	//게시글 숫자 반환
	public static int getBoardListCount(String boardName)throws Exception{
		return BoardDAO.getBoardListCount(boardName);
	}
	//페이지수 반환
	public static int getPageCount(String boardName)throws Exception{
		double boardCount = BoardDAO.getBoardListCount(boardName);
		return (int) (Math.ceil(boardCount/10));			//게시글올림 / 10 
	}
	
	//검색결과 숫자 반환
	public static int getSearchListCount(String boardName, String searchCond, String searchContent)throws Exception{
		return BoardDAO.getSearchListCount(boardName, searchCond, searchContent);
	}
	//검색결과 페이지수 반환
	public static int getSearchPageCount(String boardName, String searchCond, String searchContent)throws Exception{
		double boardCount = BoardDAO.getSearchListCount(boardName, searchCond, searchContent);
		return (int) (Math.ceil(boardCount/10));		
	}
	//게시글 검색
	public static ArrayList<BoardDTO> searchBoard(String boardName, String searchCond, String searchContent, int pageNo)throws Exception{
		return searchBoard(boardName, searchCond, searchContent, pageNo); 
	}
	
    //게시글목록보기
    public static ArrayList<BoardDTO> getBoardList(String boardName, int pageNo) throws Exception{
    	ArrayList<BoardDTO> boardList = new ArrayList<>(); 
    	boardList = BoardDAO.getBoardList(boardName,pageNo);
    			
    	if(boardList==null){
    		throw new Exception("게시글이 없습니다.");
    	}
    	return boardList;
    }
	
    //게시글읽기
    public static BoardDTO getBoardDetail(String boardName, int bPno)throws Exception{
    	BoardDTO detail = BoardDAO.getBoardDetail(boardName, bPno);
    	if(detail==null){
    		throw new Exception("게시글이 없습니다.");
    	}
    	return detail;
    }
    
    //게시글쓰기
    public static boolean boardWrite(BoardDTO board)throws Exception{
    	return BoardDAO.boardWrite(board);
    }
    
    //공지글 쓰기
    public static boolean noticeBoardWrite(NoticeBoardDTO board) throws Exception{
    	return BoardDAO.noticeBoardWrite(board);
    }
    //공지글수정
    public static boolean updateNoticeBoard(NoticeBoardDTO board)throws Exception{
    	return BoardDAO.updateNoticeBoard(board);
    }
    //게시글수정
    public static boolean updateBoard(BoardDTO board)throws Exception{
    /*	boolean result = BoardDAO.nickCheck(board.getbAuthor(),board.getbPno());
    	if(result==false){
    		throw new Exception("본인이 아닙니다.");
    	}*/
    	return BoardDAO.updateBoard(board);
    }
    
    //게시글삭제
    public static boolean deleteBoard(BoardDTO board)throws Exception{
    /*	boolean result = BoardDAO.nickCheck(board.getbAuthor(), board.getbPno());
    	if(result==false){
    		throw new Exception("본인이 아닙니다.")
    	}*/
    	return BoardDAO.deleteBoard(board);
    }
   /* //게시글이 본인이 쓴 글인지 확인
    public static boolean nickCheck(String usrNick, int bPno)throws Exception{
    	return BoardDAO.nickCheck(usrNick, bPno);
    }*/
    
    //게시글 조회수++
    public static boolean readNumIncrease(BoardDTO board)throws Exception{
    	return BoardDAO.readNumIncrease(board);
    }
    //게시글 좋아요++
    public static boolean likeNumIncrease(BoardDTO board)throws Exception{
    	return BoardDAO.likeNumIncrease(board);
    }    
    
    //회원가입 
    public static boolean insertUser(UserDTO user)throws Exception{
    	return UserDAO.insertUser(user);	//이미존재하는 아이디일 경우 false반환
    }
    //비밀번호 체크
    public static String pwCheck(String email, String pw)throws Exception{
    	String result = UserDAO.loginCheck(email, pw);
    	return result;
    }
    //패스워드 체크
    public static String PwCheck(String email, String pw)throws Exception{
    	String result = UserDAO.loginCheck(email, pw);
    	
    	return result;
    }
    //로그인
    public static String loginCheck(String email, String pw, HttpSession session)throws Exception{
    	System.out.println("로그인 체크전");
    	String result = UserDAO.loginCheck(email, pw);
    	System.out.println("로그인 체크후 result : " + result);
    	
    	if(result != null){	// 로그인 체크결과 usrNick값이 반환되었다면
    		UserDTO user = UserDAO.getUser(result);
    		System.out.println("로그인 체크후 user : " + user);
    		//세션 변수 등록
    		session.setAttribute("usrNick", user.getUsrNick());
    		session.setAttribute("usrEmail", user.getUsrEmail());
    		session.setAttribute("usrGrant", user.getUsrGrant());
    	}else
    	{
    		System.out.println("이것은 오류");
    	}
    	return result;
    }
    //로그아웃
    public static void logout(HttpSession session){
    	// 세션 정보를 초기화
    	session.invalidate();
    }
    //회원정보보기-개인
    public static UserDTO getUser(String usrNick)throws Exception{
    	UserDTO user =UserDAO.getUser(usrNick);
		return user;
    }
    //회원정보보기-관리자
    public static ArrayList<UserDTO> getAllUser()throws Exception{
    	ArrayList<UserDTO> list = UserDAO.getAllUser();
    	return list;
    }
    //회원정보수정-개인
    public static boolean updateUser(UserDTO user)throws Exception{
    	return UserDAO.updateUser(user);
    }
    //회원정보수정-관리자(등급)
	public static boolean updateUserGrant(String usrNick, String usrGrant)throws Exception {
		return UserDAO.updateUserGrant(usrNick, usrGrant);
	}
    //회원탈퇴-관리자
    public static boolean deleteUser(UserDTO user)throws Exception{
    	return UserDAO.deleteUser(user);
    }
    
    //받은쪽지가 없는 경우
    public static void notExistReceiveMessage(String rid) throws Exception{
       ArrayList<MessageDTO> message = new ArrayList<>();
       message = MessageDAO.getAllReceiveMessage(rid);
       if(message ==null){
          throw new Exception("메세지가 없습니다");
       }
    }
    //보낸쪽지가 없는 경우
    public static void notExistSendMessage(String sid) throws Exception{
       ArrayList<MessageDTO> message = new ArrayList<>();
       message = MessageDAO.getAllSendMessage(sid);
       if(message ==null){
          throw new Exception("메세지가 없습니다");
       }
    }
    // 받은쪽지확인
    public static ArrayList<MessageDTO> getAllReceiveMessage(String rid) throws Exception{
       ArrayList<MessageDTO> message = new ArrayList<>();
       message = MessageDAO.getAllReceiveMessage(rid);
       
       return message;
    }

    //보낸쪽지확인
    public static ArrayList<MessageDTO> getAllSendMessage(String sid) throws Exception{
       ArrayList<MessageDTO> message = new ArrayList<>();
       message = MessageDAO.getAllSendMessage(sid);
    
       return message;
    }
    
    //쪽지상세확인
    public static MessageDTO messageDetail(int msgNo)throws Exception{
    	MessageDTO msg = new MessageDTO();
    	msg = MessageDAO.messageDetail(msgNo);
    	return msg;
    }
    
    //쪽지삭제
    public static boolean deleteMessage(int msgNo)throws Exception{
    	return MessageDAO.deleteMessage(msgNo);
    }
    //쪽지 보내기
    public static boolean writeMessage(MessageDTO message)throws Exception{
    	return MessageDAO.writeMessage(message);
    }
    //댓글확인
    public static ArrayList<CommentDTO> getAllComment(int bPno)throws Exception{
    	return CommentDAO.getAllComment(bPno);
    }
    //댓글작성
    public static boolean writeComment(CommentDTO comm)throws Exception{
    	return CommentDAO.writeComment(comm);
    }
    //댓글수정
    public static boolean updateComment(CommentDTO comm)throws Exception{
    	return CommentDAO.updateComment(comm);
    }
    //댓글삭제
    public static boolean deleteComment(int commNo)throws Exception{
    	return CommentDAO.deleteComment(commNo);
    }
    

    
}
