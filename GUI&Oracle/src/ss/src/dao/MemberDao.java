package dao;

import dto.Member;

public interface MemberDao {
	
	// 회원가입 - INSERT
	// PARAMETER : insertMember - 회원가입 정보
	// RETURN : boolean - 회원가입 성패
	// 	false - 이미 존재하는 userId이거나 INSERT 구문이 실패할 경우
	//	true - INSERT 성공
	public boolean join(Member insertMember);
	
}
