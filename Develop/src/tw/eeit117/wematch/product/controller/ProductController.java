package tw.eeit117.wematch.product.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import tw.eeit117.wematch.member.model.Member;
import tw.eeit117.wematch.product.model.ProductBean;
import tw.eeit117.wematch.product.model.ProductBeanService;
import tw.wematch.util.Sender;

@Controller
@RequestMapping("/product")
@SessionAttributes({ "productExam", "productUpdate" })
public class ProductController {
	@Autowired
	ProductBeanService productBeanService;

	@GetMapping("/retrieve")
	public @ResponseBody List<ProductBean> retrieve() {
		return productBeanService.selectAll();
	}

	@GetMapping("/browse")
	public String browse(SessionStatus status) {
		status.setComplete();
		return "ProductsBrowsePage";
	}

	@GetMapping("/manage")
	public String manage(SessionStatus status) {
		status.setComplete();
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
	public String examProductPage() {
		return "ProductExamPage";
	}

	@GetMapping(value = "/examProduct/{productId}")
	public String examProduct(@PathVariable String productId, Model model) {
		model.addAttribute("productExam", productBeanService.findById(Integer.parseInt(productId)));
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
	public String updateProductPage() {
		return "ProductUpdatePage";
	}

	@GetMapping(value = "/updateProduct/{productId}")
	public String updateProduct(@PathVariable String productId, Model model) {
		model.addAttribute("productUpdate", productBeanService.findById(Integer.parseInt(productId)));
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
		ProductBean newProductBean = newProductBeanCheck(productId, category, productName, price, stock,
				productDescription, thumbnail, detailImg);
		ProductBean oldProductBean = productBeanService.findById(productId);
		if (oldProductBean.getStock() <= 0 && newProductBean.getStock() > 0) {
			String emailTitle = "[WeMatch Product Arrive]" + newProductBean.getProductName();
			String emailContent = "The product " + newProductBean.getProductName() + " is available now!";
//			Map<Integer, List<String>> productArrival = (Map<Integer, List<String>>) httpSession
//					.getAttribute("productArrival");
			// 目前只有一個測試的email，所以下面先備註起來。
//			if (productArrival != null) {
//				for (String subscribeEmail : productArrival.get(productId)) {
//				(new Sender(subscribeEmail, emailTitle, emailContent)).start();					
//				}
//			}
			System.out.println("通知：subscribeEmail (其實還是寄到jmtforg@gmail.com)");
			(new Sender("jmtforg@gmail.com", emailTitle, emailContent)).start();
		}
		productBeanService.update(newProductBean);
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

		Comparator<ProductBean> compareByDate = (ProductBean o1, ProductBean o2) -> o1.getUpdateDate()
				.compareTo(o2.getUpdateDate());
		if (sortting.equals("LatestDown")) {
			Collections.sort(productBeans, compareByDate);
		}
		if (sortting.equals("LatestUp")) {
			Collections.sort(productBeans, compareByDate.reversed());
		}
		return productBeans;
	}

	@GetMapping(value = "/shoppingCart/{productId}")
	public String shoppingCart(@PathVariable String productId, HttpSession httpSession) {
		@SuppressWarnings("unchecked")
		Set<ProductBean> carts = (Set<ProductBean>) httpSession.getAttribute("shoppingCarts");
		Set<Integer> checkIds = new HashSet<Integer>();
		for (ProductBean testProduct : carts) {
			checkIds.add(testProduct.getProductId());
		}
		if (!checkIds.contains(Integer.parseInt(productId))) {
			carts.add(productBeanService.findById(Integer.parseInt(productId)));
		}
		httpSession.setAttribute("shoppingCarts", carts);

		return "redirect:/product/browse";
	}

	@GetMapping(value = "/productArrival/{productId}")
	public String productArrival(@PathVariable String productId, HttpSession httpSession) {
		Member member = (Member) httpSession.getAttribute("Account");
		Map<Integer, List<String>> productArrival = (Map<Integer, List<String>>) httpSession
				.getAttribute("productArrival");
		List<String> subscribeList = productArrival.get(Integer.parseInt(productId));
		if (subscribeList != null) {
			subscribeList.add(member.getMemberEmail());
			productArrival.put(Integer.parseInt(productId), subscribeList);
		} else {
			List<String> newSubscribeList = new ArrayList<String>();
			newSubscribeList.add(member.getMemberEmail());
			productArrival.put(Integer.parseInt(productId), newSubscribeList);
		}

		return "redirect:/product/browse";
	}

}
