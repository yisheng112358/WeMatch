package tw.eeit117.wematch.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import tw.eeit117.wematch.member.Member;
import tw.eeit117.wematch.util.HibernateUtil;

@WebServlet("/SignUpJdbcConnServlet.do")
@javax.servlet.annotation.MultipartConfig
public class SignUpJdbcConnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	private Session session;

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
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String nickname = request.getParameter("nickname");
			String gender = request.getParameter("gender");
			String city = request.getParameter("city");
			String birthday = request.getParameter("birthday");
			String starSign = request.getParameter("starSign");
			String bloodType = request.getParameter("bloodType");
			String[] hobbies = request.getParameterValues("hobbies");
			Collection<Part> uploadParts = request.getParts();
			int memberStatus = 1; // 1: general member by default
			String selfIntro = request.getParameter("selfIntro");

			processInsert(memberAccount, memberPwd, memberName, memberEmail, nickname, gender, city, birthday, starSign,
					bloodType, hobbies, uploadParts, memberStatus, selfIntro);

			response.sendRedirect("SignInPage.jsp");

			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void processInsert(String memberAccount, String memberPwd, String memberName, String memberEmail,
			String nickname, String gender, String city, String birthday, String starSign, String bloodType,
			String[] hobbies, Collection<Part> uploadParts, int memberStatus, String selfIntro) throws Exception {
//		JdbcConnServlet jdbcConnServlet = new JdbcConnServlet();
		try {
			SessionFactory factory = HibernateUtil.getSessionFactory();
			session = factory.getCurrentSession();

			session.beginTransaction();

			String sqlstr = "INSERT INTO members(member_account, member_pwd, member_name, member_email, nickname, gender, city, birthday, star_sign, blood_type, hobbies, picture_1, picture_2, member_status, self_intro) Values(?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?);";
			Query<Member> query = session.createQuery(sqlstr, Member.class);
			query.setParameter(1, memberAccount);
			query.setParameter(2, memberPwd);
			query.setParameter(3, memberName);
			query.setParameter(4, memberEmail);
			query.setParameter(5, nickname);
			query.setParameter(6, gender);
			query.setParameter(7, city);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// out.write("birthday: " + birthday);
			java.util.Date utilDate = sdf.parse(birthday);
			query.setParameter(8, new java.sql.Date(utilDate.getTime()));
			query.setParameter(9, starSign);
			query.setParameter(10, bloodType);
			String joinedHobbies = String.join(", ", hobbies);
			query.setParameter(11, joinedHobbies);
			ArrayList<Part> uploadPics = new ArrayList<Part>();
			for (Part pic : uploadParts) {
				if (pic.getContentType() != null && pic.getContentType().contains("image")) {
					uploadPics.add(pic);
				}
			}
			if (uploadPics.isEmpty()) {
				query.setParameter(12, null);
				query.setParameter(13, null);
			} else {
				if (uploadPics.size() == 1) {
					query.setParameter(12, uploadPics.get(0).getInputStream());
					query.setParameter(13, null);
				} else if (uploadPics.size() >= 2) {
					query.setParameter(12, uploadPics.get(0).getInputStream());
					query.setParameter(13, uploadPics.get(1).getInputStream());
				}
			}
			query.setParameter(14, memberStatus);
			query.setParameter(15, selfIntro);
//			query.execute();
			System.out.println(memberAccount + "已註冊完成");
//			query.close();

//			jdbcConnServlet.closeConn();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
//			HibernateUtil.closeSessionFactory();
		}
	}
}
