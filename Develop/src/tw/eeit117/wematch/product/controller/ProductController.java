package tw.eeit117.wematch.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

	// 以下productLogin()、productlogout()兩個方法為暫定，最終還是以會員系統為主。
	@GetMapping("/login")
	public String productLogin(HttpSession httpSession) {
		httpSession.setAttribute("memberStatus", "bms");
		return "ProductsBrowsePage";
	}

	@GetMapping("/logout")
	public String productlogout(HttpSession httpSession) {
		httpSession.setAttribute("memberStatus", "visitor");
		return "ProductsBrowsePage";
	}

	@GetMapping("/retrieve")
	public @ResponseBody List<ProductBean> retrieveProduct() {
		return productBeanService.selectAll();
	}

	@GetMapping("/browse")
	public String goToProductsBrowsePage() {
		return "ProductsBrowsePage";
	}

	@GetMapping("/manage")
	public String goToProductsManagePage(HttpSession httpSession) {
		return "ProductsManagePage";
	}

	@GetMapping("/addProduct")
	public String goToProductAddPage() {
		return "ProductAddPage";
	}

	@PostMapping("/addProduct")
	public String addProductData(String category, String productName, Double price, Integer stock,
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
	public String deleteProductData(@RequestParam String productId) {
		System.out.println("目前正在刪除產品： " + productId);
		productBeanService.deleteById(Integer.parseInt(productId));
		return "redirect:/product/manage";
	}
}
