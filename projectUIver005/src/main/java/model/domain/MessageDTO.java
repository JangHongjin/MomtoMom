package model.domain;

public class MessageDTO {
	private int msgNo;				//메세지번호
	private String msgSid;			//메세지보낸이
	private String msgRid;			//메세지받는이
	private String msgCon;		//메세지내용
	private String msgDate;		//메세지작성일
	
	public MessageDTO() {}
	
	public MessageDTO(int msgNo, String msgSid, String msgRid, String msgCon, String msgDate) {
		this.msgNo = msgNo;
		this.msgSid = msgSid;
		this.msgRid = msgRid;
		this.msgCon = msgCon;
		this.msgDate = msgDate;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgSid() {
		return msgSid;
	}

	public void setMsgSid(String msgSid) {
		this.msgSid = msgSid;
	}

	public String getMsgRid() {
		return msgRid;
	}

	public void setMsgRid(String msgRid) {
		this.msgRid = msgRid;
	}

	public String getMsgCon() {
		return msgCon;
	}

	public void setMsgCon(String msgCon) {
		this.msgCon = msgCon;
	}

	public String getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}
	
	
	
}
