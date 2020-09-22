package tw.eeit117.wematch.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class ReceiverController {

	@RequestMapping(path = "/confirm", method = RequestMethod.GET)
	public String gogo(Model m) {
		Receiver receiver = new Receiver();
		m.addAttribute("TransportInformation", receiver);
		return "TransportInf"; // 顯示"填收件人資料"頁面
	}

	@RequestMapping(path = "/addTransportInformation", method = RequestMethod.POST)
	public String processAction(@ModelAttribute("TransportInformation") Receiver TransportInformation,
			BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "receiverError";
		}
		m.addAttribute("receiverName", TransportInformation.getReceiverName());
		m.addAttribute("receiverPhone", TransportInformation.getReceiverPhone());
		m.addAttribute("receiverAddress", TransportInformation.getReceiverAddress());
		m.addAttribute("receiverEmail", TransportInformation.getReceiverEmail());
		m.addAttribute("receiverNotes", TransportInformation.getReceiverNote());
		m.addAttribute("receiverGoods1", "鑽石按摩儀");
		m.addAttribute("GoodsAmount1", "2");
		m.addAttribute("receiverGoods2", " Melon low-frequency electric therapy");
		m.addAttribute("GoodsAmount2", "1");
		m.addAttribute("totalPrice", "3087");

		return "ReceiverResult"; // 顯示"謝謝購買及購物清單"頁面
	}

	@RequestMapping(path = "/firstpage", method = RequestMethod.GET)
	public String aaa(Model m) {
		return "aaatttt"; // 顯示空白頁面

//		@RequestMapping(path="/receiverForm", method=RequestMethod.GET)
//		public String showForm(Model m) {
//
//		}
	}
}
