package tw.eeit117.wematch.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
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

import tw.eeit117.wematch.member.members;
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
			System.out.println(memberAccount);
			String memberPwd = request.getParameter("memberPwd");
			System.out.println(memberPwd);
			String memberName = request.getParameter("memberName");
			System.out.println(memberName);
			String memberEmail = request.getParameter("memberEmail");
			System.out.println(memberEmail);
			String nickname = request.getParameter("nickname");
			System.out.println(nickname);
			String gender = request.getParameter("gender");
			System.out.println(gender);
			String city = request.getParameter("city");
			System.out.println(city);
			String birthday = request.getParameter("birthday");
			System.out.println(birthday);
			String starSign = request.getParameter("starSign");
			System.out.println(starSign);
			String bloodType = request.getParameter("bloodType");
			System.out.println(bloodType);
			String hobbies = request.getParameter("hobbies");
			System.out.println(hobbies);
			Collection<Part> uploadParts = request.getParts();
			int memberStatus = 1; // 1: general member by default
			String selfIntro = request.getParameter("selfIntro");
			System.out.println(selfIntro);

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
			String hobbies, Collection<Part> uploadParts, int memberStatus, String selfIntro) throws Exception {
//		JdbcConnServlet jdbcConnServlet = new JdbcConnServlet();
		try {
			System.out.println("create conn");
			SessionFactory factory = HibernateUtil.getSessionFactory();
			session = factory.getCurrentSession();

			session.beginTransaction();
			System.out.println("beginTransaction");
			
			members user = new members();
			user.setMember_account(memberAccount);
			user.setMember_pwd(memberPwd);
			user.setMember_name(memberName);
			user.setMember_email(memberEmail);
			user.setNickname(nickname);
			user.setGender(gender);
			user.setCity(city);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = sdf.parse(birthday);
			user.setBirthday(new java.sql.Date(utilDate.getTime()).toString());

			user.setStar_sign(starSign);
			user.setBlood_type(bloodType);
			user.setHobbies(hobbies);
			
//			ArrayList<Part> uploadPics = new ArrayList<Part>();
//			for (Part pic : uploadParts) {
//				if (pic.getContentType() != null && pic.getContentType().contains("image")) {
//					uploadPics.add(pic);
//				}
//			}
//			if (uploadPics.isEmpty()) {
//				user.setPicture_1(null);
//				user.setPicture_2(null);
//			} else {
//				if (uploadPics.size() == 1) {
//					//byte a = ((String) uploadPics.get(0)).getBytes();
//					//user.setPicture_1((byte[])uploadPics.get(0));
//					//query.setParameter(12, uploadPics.get(0).getInputStream());
//					user.setPicture_2(null);
//				} else if (uploadPics.size() >= 2) {
//					query.setParameter(12, uploadPics.get(0).getInputStream());
//					query.setParameter(13, uploadPics.get(1).getInputStream());
//				}
//			}
			
			user.setMember_status(memberStatus);
			user.setSelf_intro(selfIntro);
			
			Serializable identifier = session.save(user);
			System.out.println(identifier);
			System.out.println(memberAccount + "已註冊完成");
			
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("bbb");
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
//			HibernateUtil.closeSessionFactory();
		}
	}
}
