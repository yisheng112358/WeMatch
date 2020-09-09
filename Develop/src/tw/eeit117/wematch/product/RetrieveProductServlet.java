package tw.eeit117.wematch.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;

import tw.wematch.util.HibernateUtil;

@WebServlet("/RetrieveProductServlet.do")
public class RetrieveProductServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	protected void RetrieveProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();

		List<Product> productList = session.createQuery("From Product", Product.class).list();

		Gson gson = new Gson();
		String productJasonString = gson.toJson(productList);
		response.getWriter().write(productJasonString);
	}

}
