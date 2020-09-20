package tw.eeit117.wematch.product.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.eeit117.wematch.product.model.ProductBean;
import tw.eeit117.wematch.product.model.ProductBeanService;

@Controller
@RequestMapping("/product")
@PropertySource("classpath:TableName.properties")
public class ProductController {
	@Autowired
	ProductBeanService productBeanService;

	@Value("${CURE_STATE_SUCCESS}")
	private String CURE_STATE_SUCCESS;

	@Value("${CURE_STATE_REPEATED}")
	private String CURE_STATE_REPEATED;

	// 以下login()、logout()兩個方法為暫定，最終還是以會員系統為主。
	@GetMapping("/login")
	public String login(HttpSession httpSession) {
		httpSession.setAttribute("memberStatus", "bms");
		return "ProductsBrowsePage";
	}

	@GetMapping("/logout")
	public String logout(HttpSession httpSession) {
		httpSession.setAttribute("memberStatus", "visitor");
		return "ProductsBrowsePage";
	}

	@GetMapping("/retrieve")
	public @ResponseBody List<ProductBean> retrieve() {
		return productBeanService.selectAll();
	}

	@GetMapping("/browse")
	public String browse() {
		return "ProductsBrowsePage";
	}

	@GetMapping("/manage")
	public String manage(HttpSession httpSession) {
		return "ProductsManagePage";
	}

	@GetMapping("/addProduct")
	public String addProduct() {
		return "ProductAddPage";
	}

	@PostMapping("/addProduct")
	public String addProduct(String category, String productName, Double price, Integer stock,
			String productDescription, MultipartFile thumbnail, MultipartFile detailImg) {

		Map<String, String> respInsertState = new HashMap<>();

		try {
			ProductBean productBean = new ProductBean(category, productName, price, stock, productDescription,
					thumbnail.getBytes(), detailImg.getBytes());

			String productInsertState = productBeanService.insert(productBean);

			if (productInsertState == CURE_STATE_SUCCESS) {
				respInsertState.put(CURE_STATE_SUCCESS, "新增成功");
			} else if (productInsertState == CURE_STATE_REPEATED) {
				respInsertState.put(CURE_STATE_REPEATED, "商品重複");
			}
		} catch (Exception e) {
			respInsertState.put("fail", e.getMessage());
			return "ProductsManagePage";
		}
		return "ProductsManagePage";
	}

	@GetMapping(value = "/deleteProduct", params = { "productId" })
	public String deleteProduct(@RequestParam String productId) {
		System.out.println("目前正在刪除產品： " + productId);
		productBeanService.deleteById(Integer.parseInt(productId));
		return "redirect:/product/manage";
	}

	@GetMapping("/examProduct")
	public String examProduct(HttpSession httpSession) {
		System.out.println(httpSession.getAttribute("product"));
		return "ProductExamPage";
	}

	@GetMapping(value = "/examProduct/{productId}")
	public String examProduct(@PathVariable String productId, HttpSession httpSession) {
		httpSession.setAttribute("product", productBeanService.findById(Integer.parseInt(productId)));
		return "redirect:/product/examProduct";
	}

	@GetMapping("/examProduct/showDetailImg/{productId}")
	public void showProductImage(@PathVariable String productId, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		System.out.println("目前正在檢視產品： " + productId);
		ProductBean productBean = productBeanService.findById(Integer.parseInt(productId));
		InputStream inputStream = new ByteArrayInputStream(productBean.getDetailImg());
		IOUtils.copy(inputStream, response.getOutputStream());
	}
}
