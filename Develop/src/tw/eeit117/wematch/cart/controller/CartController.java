package tw.eeit117.wematch.cart.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.eeit117.wematch.cart.model.Receiver;
import tw.eeit117.wematch.cart.model.ReceiverService;
import tw.eeit117.wematch.product.model.ProductBean;
import tw.eeit117.wematch.product.model.ProductBeanService;

@Controller
@RequestMapping("/shoppingCart")
@SessionAttributes({ "transportInformation" })
public class CartController {
	@Autowired
	ReceiverService receiverService;

	@Autowired
	ProductBeanService productBeanService;

	@GetMapping("/cart")
	public String cart() {
		return "ShoppingCartPage";
	}

	@GetMapping("/cart/showThumbnail/{productId}")
	public void showProductImage(@PathVariable String productId, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		ProductBean productBean = productBeanService.findById(Integer.parseInt(productId));
		InputStream inputStream = new ByteArrayInputStream(productBean.getThumbnail());
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	@RequestMapping(path = "/transportInf", method = RequestMethod.GET)
	public String confirm(Model m) {
		Receiver receiver = new Receiver();
		m.addAttribute("transportInformation", receiver);
		return "TransportInf";
	}

	// 表單輸入資訊且將資料存入資料庫名為Receiver的table (注意三角鎖定!!!缺一就error)
	@RequestMapping(path = "/addTransportInformation", method = RequestMethod.POST)
	public String processAction(@ModelAttribute Receiver transportInformation, BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "receiverError";
		}
		m.addAttribute("receiverName", transportInformation.getReceiverName());
		m.addAttribute("receiverPhone", transportInformation.getReceiverPhone());
		m.addAttribute("receiverAddress", transportInformation.getReceiverAddress());
		m.addAttribute("receiverEmail", transportInformation.getReceiverEmail());
		m.addAttribute("receiverNotes", transportInformation.getReceiverNote());
		m.addAttribute("receiverGoods1", "鑽石按摩儀");
		m.addAttribute("GoodsAmount1", "2");
		m.addAttribute("receiverGoods2", " Melon low-frequency electric therapy");
		m.addAttribute("GoodsAmount2", "1");
		m.addAttribute("totalPrice", "3087");

		receiverService.insert(transportInformation);

		return "ReceiverResult"; // 顯示"謝謝購買及購物清單"頁面

	}

	// 自己測試的 先顯示出一個空白首頁
	@RequestMapping(path = "/firstpage", method = RequestMethod.GET)
	public String aaa(Model m) {
		return "aaatttt"; // 顯示空白頁面

	}

	// 未完成連線功能!!!!!!
	@RequestMapping(path = "", method = RequestMethod.GET)
	public String shoppingcart(@PathVariable String productId, HttpSession httpSession) {
		Map<ProductBean, Integer> cart = new HashMap<ProductBean, Integer>();
		cart.put(productBeanService.findById(Integer.parseInt(productId)), 1);
		httpSession.setAttribute("shoppingcart", cart);
		return "shoppingCartPage";
	}

}
