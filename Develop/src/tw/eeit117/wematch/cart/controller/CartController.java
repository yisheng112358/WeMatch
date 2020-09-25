package tw.eeit117.wematch.cart.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

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
	public String cart(Model m) {
		Receiver receiver = new Receiver();
		m.addAttribute("transportInformation", receiver);
		return "ShoppingCartPage";
	}

	@GetMapping("/cart/showThumbnail/{productId}")
	public void showProductImage(@PathVariable String productId, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpeg");
		ProductBean productBean = productBeanService.findById(Integer.parseInt(productId));
		InputStream inputStream = new ByteArrayInputStream(productBean.getThumbnail());
		IOUtils.copy(inputStream, response.getOutputStream());
	}

	// 表單輸入資訊且將資料存入資料庫名為Receiver的table (注意三角鎖定!!!缺一就error)
	@RequestMapping(path = "/addTransportInformation", method = RequestMethod.POST)
	public String processAction(@ModelAttribute("transportInformation") Receiver transportInformation,
			BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "ReceiverError";
		}
		m.addAttribute("totalAmount", transportInformation.getTotalAmount());
		m.addAttribute("receiverName", transportInformation.getReceiverName());
		m.addAttribute("receiverPhone", transportInformation.getReceiverPhone());
		m.addAttribute("receiverAddress", transportInformation.getReceiverAddress());
		m.addAttribute("receiverEmail", transportInformation.getReceiverEmail());
		m.addAttribute("receiverNotes", transportInformation.getReceiverNote());

		receiverService.insert(transportInformation);

		return "ReceiverResult";

	}

}
