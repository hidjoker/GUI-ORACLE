package dto;

public class Member {
	private String userId;
	private String nick;
	private String email;
	
	@Override
	public String toString() {
		return "Member (userId="+userId
				+", nick="+nick
				+", email="+email+")";
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
