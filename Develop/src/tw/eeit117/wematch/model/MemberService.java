package tw.eeit117.wematch.model;

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
	
	public void updateMember(Member member) {
		mDAO.updateMember(member);
	}
	
	public Member selectMember(String memberAccount, String memberPwd) {
		return mDAO.selectMember(memberAccount, memberPwd);
	}
}
