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

import tw.eeit117.wematch.member.members;
import tw.eeit117.wematch.util.HibernateUtil;


@WebServlet("/SignInJdbcConnServlet.do")
@javax.servlet.annotation.MultipartConfig
public class SignInJdbcConnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	private Session session;
	private SessionFactory factory;
	private members qMember;

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
			
			out = response.getWriter();

			String memberAccount = request.getParameter("memberAccount");
			String memberPwd = request.getParameter("memberPwd");
			
			String memberName = processQuery(memberAccount, memberPwd);
			System.out.println(memberName);
			if (memberName!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("PairSystemPage.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("SignInPage.jsp");
				rd.forward(request, response);	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String processQuery(String memberAccount, String memberPwd) {
		try {
			factory = HibernateUtil.getSessionFactory();
			session = factory.getCurrentSession();
			session.beginTransaction();

			String sqlstr = "FROM members WHERE member_account =:myAccount AND member_pwd =:myPwd";
			
			Query<members> query = session.createQuery(sqlstr, members.class);
			query.setParameter("myAccount", memberAccount);
			query.setParameter("myPwd", memberPwd);
			
			qMember = query.uniqueResult();
			System.out.println("result:" + qMember);
			if(qMember != null) {
				System.out.println(qMember.getMember_id() + ":" + qMember.getMember_name());
				session.getTransaction().commit();
				return qMember.getMember_name().toString();
			}else {
				System.out.println("ccc");
				out.write("<script type=\"text/javascript\">");
				out.write("alert('您輸入的訊息可能錯誤或尚未註冊帳號！');");
				out.write("location='SignInPage.jsp';");
				out.write("</script>");
			}
			
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			return qMember.toString();
		}
	}

}
