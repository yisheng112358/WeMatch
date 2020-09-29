package tw.eeit117.wematch.product.chart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.MessageHandler;
import javax.websocket.Session;

import org.apache.log4j.Logger;

public class ProductMessageHandler implements MessageHandler.Whole<String> {
	private static final Logger LOGGER = Logger.getLogger(ProgrammaticEchoEnpoint.class);
	Session session;

	public ProductMessageHandler(Session session) {
		this.session = session;
	}

	@Override
	public void onMessage(String message) {
		try {
			LOGGER.info("程式版的ServerEndpoint：收到客戶端送來訊息: " + message);
			String response = null;

			String[] greetings = { "hi", "hello", "好" };
			for (String greeting : greetings) {
				if (message.trim().toLowerCase().contains(greeting)) {
					response = message + "~~~ 歡迎光臨，請告訴我您的需求，我將為您提供最合適的產品！";
				}
			}

			String[] farewells = { "thank", "3Q", "謝", "掰", "88" };
			for (String farewell : farewells) {
				if (message.trim().toLowerCase().contains(farewell)) {
					response = message + "~~~ 謝謝光臨，希望有幫到你，再見！";
				}
			}

			if (response == null) {
				response = "抱歉，這部分的資訊小編這邊不太清楚，未來我們會再更精進，請期待之後的我們!!!";
			}

			session.getBasicRemote().sendText(response);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
