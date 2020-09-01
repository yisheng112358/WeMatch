package tw.eeit117.wematch.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import tw.eeit117.wematch.util.HibernateUtil;


@WebServlet("/SignInJdbcConnServlet.do")
@javax.servlet.annotation.MultipartConfig
public class SignInJdbcConnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	private Session session;
	private tw.eeit117.wematch.member.Member qMember;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");

			String memberAccount = request.getParameter("memberAccount");
			String memberPwd = request.getParameter("memberPwd");

			String memberName = processQuery(memberAccount, memberPwd);
			if (!memberName.equals("")) {
				RequestDispatcher rd = request.getRequestDispatcher("PairSystemPage.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String processQuery(String memberAccount, String memberPwd) throws Exception {
		try {
			SessionFactory factory = HibernateUtil.getSessionFactory();

			session = factory.getCurrentSession();
			session.beginTransaction();

//			JdbcConnServlet jdbcConnServlet = new JdbcConnServlet();

			String sqlstr = "SELECT * FROM members WHERE member_account =:myAccount AND member_pwd =:myPwd;";
			
			Query<tw.eeit117.wematch.member.Member> query = session.createQuery(sqlstr, tw.eeit117.wematch.member.Member.class);
			query.setParameter("myAccount", memberAccount);
			query.setParameter("myPwd", memberPwd);
			
			qMember = query.uniqueResult();
			if(qMember != null) {
				System.out.println(qMember.getMemberid() + ":" + qMember.getMemberName());
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('您輸入的訊息可能錯誤或尚未註冊帳號！');");
				out.println("location='SignInPage.jsp';");
				out.println("</script>");
			}
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
//			HibernateUtil.closeSessionFactory();
			System.out.println(qMember.getMemberName());
			return (String)qMember.getMemberName();
		}
	}

}
