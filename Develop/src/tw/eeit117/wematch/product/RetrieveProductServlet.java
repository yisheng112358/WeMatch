package tw.eeit117.wematch.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.google.gson.Gson;

@WebServlet("/RetrieveProductServlet.do")
public class RetrieveProductServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	protected void RetrieveProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory sessionFactory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
		Session session = sessionFactory.openSession();

		List<Product> productList = session.createQuery("From Product", Product.class).list();

		session.close();
		sessionFactory.close();

		Gson gson = new Gson();
		String productJasonString = gson.toJson(productList);
		response.getWriter().write(productJasonString);
	}

}
