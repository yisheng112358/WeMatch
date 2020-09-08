package tw.eeit117.wematch.model;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO {

	private Member member;
	private SessionFactory sessionFactory;

	@Autowired
	public MemberDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean checkLogin(Member users) {
		Session session = sessionFactory.getCurrentSession();
		Member resultAccount = selectMember(users.getMemberAccount(), users.getMemberPwd());
		
		if (resultAccount != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean insertMember(String memberAccount, String memberPwd) {
		Session session = sessionFactory.getCurrentSession();
		Member resultAccount = selectMember(memberAccount, memberPwd);

		if (resultAccount != null) {
			return false;
		} else {
			Member member = new Member();
			member.setMemberAccount(memberAccount);
			member.setMemberPwd(memberPwd);
			Serializable identifier = session.save(member);
			System.out.println("identifier:" + identifier);
			
			return true;
		}
	}

	public Member selectMember(String memberAccount, String memberPwd) {
		Session session = sessionFactory.getCurrentSession();
		
		String hqlstr = "From Member where memberAccount=:user and memberPwd=:pwd";
		Query<Member> query = session.createQuery(hqlstr, Member.class);
		query.setParameter("user", memberAccount);
		query.setParameter("pwd", memberPwd);
		Member resultAccount = query.uniqueResult();
		
		return resultAccount;
	}
	
	public void updateMember(Member member) {
		Session session = sessionFactory.getCurrentSession();
		session.save(member);
	}
}
