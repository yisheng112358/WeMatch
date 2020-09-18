package tw.eeit117.wematch.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@GetMapping("/retrieve")
	public @ResponseBody List<ProductBean> retrieveProduct() {
		return productBeanService.selectAll();
	}

	@GetMapping("/browse")
	public String goToProductsBrowsePage() {
		return "ProductsBrowsePage";
	}

	@GetMapping("/manage")
	public String goToProductsManagePage() {
		return "ProductsManagePage";
	}

	@GetMapping("/addProduct")
	public String goToProductAddPage() {
		return "ProductAddPage";
	}

	@PostMapping("/addProduct")
	public String addProductData(String categorySelect, String productName, Double productPrice, Integer productStock,
			String productDescription, MultipartFile thumbnail, MultipartFile detailImg) {
		Map<String, String> respInsertState = new HashMap<>();
		try {
			ProductBean productBean = new ProductBean(categorySelect, productName, productPrice, productStock,
					productDescription, thumbnail.getBytes(), detailImg.getBytes());
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

	@GetMapping("/deleteProduct/{productId}")
	public String deleteProductData(@PathVariable String productId) {
		System.out.println("目前正在刪除產品： " + productId);
		productBeanService.deleteById(Integer.parseInt(productId));
		return "redirect:/product/manage";
	}
}
