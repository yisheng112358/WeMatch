package tw.eeit117.wematch.product.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ProductController {
	@Autowired
	ProductBeanService productBeanService;

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
	public String addProduct(Integer productId, String category, String productName, Double price, Integer stock,
			String productDescription, MultipartFile thumbnail, MultipartFile detailImg) throws IOException {
		ProductBean productBean = newProductBeanCheck(productId, category, productName, price, stock,
				productDescription, thumbnail, detailImg);
		productBeanService.insert(productBean);
		return "ProductsManagePage";
	}

	@GetMapping(value = "/deleteProduct", params = { "productId" })
	public String deleteProduct(@RequestParam String productId) {
		productBeanService.deleteById(Integer.parseInt(productId));
		return "redirect:/product/manage";
	}

	@GetMapping("/examProductPage")
	public String examProductPage(HttpSession httpSession) {
		return "ProductExamPage";
	}

	@GetMapping(value = "/examProduct/{productId}")
	public String examProduct(@PathVariable String productId, HttpSession httpSession) {
		httpSession.setAttribute("productExam", productBeanService.findById(Integer.parseInt(productId)));
		return "redirect:/product/examProductPage";
	}

	@GetMapping("/examProduct/showDetailImg/{productId}")
	public void showProductImage(@PathVariable String productId, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		ProductBean productBean = productBeanService.findById(Integer.parseInt(productId));
		InputStream inputStream = new ByteArrayInputStream(productBean.getDetailImg());
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@GetMapping("/updateProductPage")
	public String updateProductPage(HttpSession httpSession) {
		return "ProductUpdatePage";
	}

	@GetMapping(value = "/updateProduct/{productId}")
	public String updateProduct(@PathVariable String productId, HttpSession httpSession) {
		httpSession.setAttribute("productUpdate", productBeanService.findById(Integer.parseInt(productId)));
		return "redirect:/product/updateProductPage";
	}

	@GetMapping("/updateProduct/showthumbnail/{productId}")
	public void showthumbnailInUpdate(@PathVariable String productId, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		ProductBean productBean = productBeanService.findById(Integer.parseInt(productId));
		InputStream inputStream = new ByteArrayInputStream(productBean.getThumbnail());
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@GetMapping("/updateProduct/showDetailImg/{productId}")
	public void showDetailImgInUpdate(@PathVariable String productId, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		ProductBean productBean = productBeanService.findById(Integer.parseInt(productId));
		InputStream inputStream = new ByteArrayInputStream(productBean.getDetailImg());
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@PostMapping("/updateProduct")
	public String updateProduct(Integer productId, String category, String productName, Double price, Integer stock,
			String productDescription, MultipartFile thumbnail, MultipartFile detailImg) throws IOException {
		ProductBean productBean = newProductBeanCheck(productId, category, productName, price, stock,
				productDescription, thumbnail, detailImg);
		productBeanService.update(productBean);
		return "ProductsManagePage";
	}

	private ProductBean newProductBeanCheck(Integer productId, String category, String productName, Double price,
			Integer stock, String productDescription, MultipartFile thumbnail, MultipartFile detailImg)
			throws IOException {
		byte[] thumbnailByteArray = null;
		byte[] detailImgByteArray = null;
		if (thumbnail != null) {
			thumbnailByteArray = thumbnail.getBytes();
		}
		if (detailImg != null) {
			detailImgByteArray = detailImg.getBytes();
		}
		ProductBean productBean = new ProductBean(productId, category, productName, price, stock, productDescription,
				thumbnailByteArray, detailImgByteArray);
		return productBean;
	}

	@GetMapping(value = "/search", params = { "keyword", "sortting" })
	public @ResponseBody List<ProductBean> search(@RequestParam String keyword, @RequestParam String sortting) {
		List<ProductBean> productBeans = productBeanService.findByKeyword(keyword);
		Comparator<ProductBean> compareByPrice = (ProductBean o1, ProductBean o2) -> Double.compare(o1.getPrice(),
				o2.getPrice());
		if (sortting.equals("HighPriceDown")) {
			Collections.sort(productBeans, compareByPrice);
		}
		if (sortting.equals("HighPriceUp")) {
			Collections.sort(productBeans, compareByPrice.reversed());
		}
		return productBeans;
	}
}
