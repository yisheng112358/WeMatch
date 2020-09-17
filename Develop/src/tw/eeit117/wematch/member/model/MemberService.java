package tw.eeit117.wematch.member.model;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class MemberService {

	private MemberDAO mDAO;
	
	public MemberService(MemberDAO mDAO) {
		this.mDAO = mDAO;
	}

	public boolean checkLogin(Member users) {
		return mDAO.checkLogin(users);
	}
	
	public boolean insertMember(String memberAccount, String memberPwd) {
		return mDAO.insertMember(memberAccount, memberPwd);
	}
	
	public void updateMember(Member member,HttpSession HttpSession) {
		mDAO.updateMember(member, HttpSession);
	}
	
	public void adminUpdateMember(Member member, HttpSession HttpSession) {
		mDAO.adminUpdateMember(member, HttpSession);
	}
	
	public Member selectMember(String memberAccount, String memberPwd) {
		return mDAO.selectMember(memberAccount, memberPwd);
	}
	
	public Member selectMemberById(int memberId) {
		return mDAO.selectMemberById(memberId);
	}
	
	public Member selectMemberByAccount(String memberAccount) {
		return mDAO.selectMemberByAccount(memberAccount);
	}
	
	public List<Member> selectAllMember() {
		return mDAO.selectAllMember();
	}
	
	public void deleteMember(Integer memberId) {
		mDAO.deleteMember(memberId);
	}
	
	public String checkMemberAccount(String memberAccount) {
		return mDAO.checkMemberAccount(memberAccount);
	}
}
