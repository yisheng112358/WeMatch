package tw.eeit117.wematch.video.chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.MessageHandler;
import javax.websocket.Session;

import org.apache.log4j.Logger;

public class CustomerMessageHandler implements MessageHandler.Whole<String> {
	private static final Logger LOGGER = Logger.getLogger(ProgrammaticEchoEnpoint.class);
	Session session ;
	Map<String, String> responseBank = new HashMap<>();
	public CustomerMessageHandler(Session session) {
		this.session = session;
		responseBank.put("Hello", "嗨!Fitness Space智慧諮詢小編很高興為您服務~");
		responseBank.put("你好", "你好!Fitness Space智慧諮詢小編很高興為您服務~");
		responseBank.put("謝謝", "不會，幫助您是小編應該做的~");
		responseBank.put("3Q", "不會，幫助您是小編應該做的~");
		responseBank.put("掰掰", "再見，很高興有機會為您服務~");
		responseBank.put("掰", "再見，很高興有機會為您服務~");
		responseBank.put("886", "再見，很高興有機會為您服務~");
		responseBank.put("背部肌群", "背部肌群是由闊背肌與脊柱站立肌群所組成，一般的背肌訓練處方，都是搭配胸部肌群來從事上半身的訓練，藉由推拉原理使得有穩定上半身的效果。平時如果不刻意用力伸展背部、特別的展現，是不易看見身體的背部肌肉線條的。");
		responseBank.put("胸部肌群", "人體上半身胸腔當中，最顯而易見的重要肌群，即是胸部肌群，主要包含胸大肌、胸小肌以及前鋸肌。「胸大肌」只要自我從事伏地挺身運動一段時日之後, 可以說大都能使男性都能擁有「厚實的胸膛」。");
		responseBank.put("腿部肌群", "腿部肌群包括大腿肌群、小腿肌群，基本上跑、走、蹲、站的一切活動，樣樣行為都得利用到腿部的肌群。從事慢跑運動即是常見亦很有效的訓練腿部之運動項目。");
		responseBank.put("背部肌群初級推薦", "好的，推薦初學者的您觀看\"練背怎麼練\"影片以達初學者的需求~");
		responseBank.put("胸部肌群初級推薦", "好的，推薦初學者的您觀看\"四招訓練胸部核心肌群\"影片以達初學者的需求~");
		responseBank.put("腿部肌群初級推薦", "好的，推薦初學者的您觀看\"3招練腿肌\"影片以達初學者的需求~");
		responseBank.put("背部肌群風險", "一般來說，多數人較不重視背肌訓練，因而強化其他肌群，在此提醒，若身體前側的肌肉太強，而背側的肌肉太弱，導致身體肌肉的失衡，會更加重駝背、圓肩的情況發生，而肩膀的穩定度也會變差，從而也增加了受傷的風險。");
		responseBank.put("胸部肌群風險", "近期有研究發現若只狂練上半身胸部肌群，恐增心血管疾病風險，在此建議要採全身性阻力訓練較適合");
		responseBank.put("腿部肌群風險", "腿部肌群訓練非常重要，當我們腿部肌肉不足時，很容易造成膝蓋的角度不正確，久而久之讓我們膝蓋的韌帶受到傷害。");
		
	}

	@Override
	public void onMessage(String message) {
		try {
			LOGGER.info("程式版的ServerEndpoint：收到客戶端送來訊息: " + message);
			String response = responseBank.get(message);
			if(response == null) {
				response = "抱歉，這部分的資訊小編這邊不太清楚，未來我們會再更精進，請期待之後的我們!!!";
			}
			
			session.getBasicRemote().sendText(response);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
