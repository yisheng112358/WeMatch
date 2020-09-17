package tw.eeit117.wematch.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eeit117.wematch.product.model.ProductBean;
import tw.eeit117.wematch.product.model.ProductBeanService;

@Controller
@RequestMapping("/product")
public class RetrieveProductController {
	@Autowired
	ProductBeanService productBeanService;

	@GetMapping("/retrieveProduct")
	public @ResponseBody List<ProductBean> retrieveProduct() {
		return productBeanService.selectAll();
	}
}
