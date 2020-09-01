package tw.eeit117.wematch.jdbc;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;

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

@WebServlet("/PairSystem.do")
public class PairSystem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session session;
	private Query<members> query;
	private LinkedHashMap<String, List<String>> imageMap;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("image/jpg");
			String bloodType = request.getParameter("bloodType");
			String gender = request.getParameter("gender");
			String city = request.getParameter("city");
			String star_sign = request.getParameter("star_sign");

			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			LinkedHashMap<String, List<String>> imageMap = selectuser(bloodType, gender, city, star_sign);

			request.setAttribute("matchNames", imageMap.keySet().toArray());
			request.setAttribute("imageMap", imageMap);

			RequestDispatcher rd = request.getRequestDispatcher("PairResult.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private LinkedHashMap<String, List<String>> selectuser(String bloodType, String gender, String city,
			String star_sign) throws Exception {
		try {
			SessionFactory factory = HibernateUtil.getSessionFactory();
			session = factory.getCurrentSession();
			session.beginTransaction();

			String hqlstr = "From members Where blood_type=:myBt and gender=:myGender and city=:myCity and star_sign=:mySS";
			query = session.createQuery(hqlstr, members.class);
			
			query.setParameter("myBt", bloodType);
			query.setParameter("myGender", gender);
			query.setParameter("myCity", city);
			query.setParameter("mySS", star_sign);
			ResultSet pair = (ResultSet)query.uniqueResult();
			
//			ResultSet rs = state.executeQuery();

			List<String> nameList = new ArrayList<String>();
			imageMap = new LinkedHashMap<String, List<String>>();
			while (pair.next()) {
				List<String> imageList = new ArrayList<String>();

				String matchName = pair.getString(4);
				nameList.add(matchName);

				InputStream inputStream1 = pair.getBlob(13).getBinaryStream();
				ByteArrayOutputStream outputStream1 = new ByteArrayOutputStream();
				byte[] buffer1 = new byte[4096];
				int bytesRead1 = -1;
				while ((bytesRead1 = inputStream1.read(buffer1)) != -1) {
					outputStream1.write(buffer1, 0, bytesRead1);
				}
				byte[] imageBytes1 = outputStream1.toByteArray();
				imageList.add(Base64.getEncoder().encodeToString(imageBytes1));

				inputStream1.close();
				outputStream1.close();

				InputStream inputStream2 = pair.getBlob(14).getBinaryStream();
				ByteArrayOutputStream outputStream2 = new ByteArrayOutputStream();
				byte[] buffer2 = new byte[4096];
				int bytesRead2 = -1;
				while ((bytesRead2 = inputStream2.read(buffer2)) != -1) {
					outputStream2.write(buffer2, 0, bytesRead2);
				}
				byte[] imageBytes2 = outputStream2.toByteArray();
				imageList.add(Base64.getEncoder().encodeToString(imageBytes2));

				inputStream2.close();
				outputStream2.close();

				imageMap.put(matchName, imageList);
			}

			System.out.println(nameList); // 檢查LIST裡面資料

			pair.close();
//			state.close();
//			jdbcConnServlet.closeConn();
			
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
//			HibernateUtil.closeSessionFactory();
			return imageMap;
		}
	}
}
