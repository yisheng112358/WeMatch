package tw.eeit117.wematch.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/AjaxServlet.do")
public class AjaxServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	protected void javaScriptAjax(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Product product = new Product(1, "Protein");
//
//		Gson gson = new Gson();
//		String productJasonString = gson.toJson(product);
//		response.getWriter().write(productJasonString);
	}

}
