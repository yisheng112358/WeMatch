package tw.eeit117.wematch.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import tw.eeit117.wematch.product.model.ProductBeanService;

@WebServlet("/RetrieveProductServlet.do")
public class RetrieveProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	protected void RetrieveProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductBeanService productBeanService = (ProductBeanService) getContext().getBean("productBeanService");

		Gson gson = new Gson();
		String productJasonString = gson.toJson(productBeanService.selectAll());
		response.getWriter().write(productJasonString);
	}

}
