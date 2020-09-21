//package tw.eeit117.wematch.video;
//
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.File;
//import java.io.IOException;
//
//import javax.imageio.ImageIO;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.boot.MetadataSources;
//import org.hibernate.boot.registry.StandardServiceRegistry;
//import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
//
//public class TestVideoGenerator {
//
//	public static void main(String[] args) throws IOException {
//		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
//		SessionFactory factory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
//		Session session = factory.openSession();
//		session.beginTransaction();
//
//		Video video1 = new Video("背部肌群練習1", "bodyback", "https://www.youtube.com/watch?v=9pdk5SryJcM", "背部肌群人體三大肌群之一，背闊肌可以讓我們背部更加的寬闊和厚實，斜方肌可以減輕我們頸椎的壓力，練好背部肌群可以讓我們看起來更加的挺拔。");
//		session.save(video1);
//		
//		Video video2 = new Video("背部肌群練習2", "bodyback", "https://www.youtube.com/watch?v=AGga884deKA", "我們的背部肌群與肱二頭肌，都是採用「拉」這個動作來做訓練，例如：訓練背肌時我們通常採用划船或下拉等動作，在肱二頭肌訓練時會採用彎舉的動作，一般來說我們為了讓訓練的成效更好，所以我們都會採用孤立訓練來針對某個部位的肌群。");
//		session.save(video2);
//		
//		Video video3 = new Video("胸肌初階訓練", "bodychest", "https://www.youtube.com/watch?v=eSw7GGEuFy0", "這個影片是居家練胸肌初階訓練影片，非常適合剛接觸運動的新手，或是體重比較重的人。雖然是跪姿但是對於胸肌的刺激一樣是非常有效，只是對於身體其他部位的訓練較少而已。");
//		session.save(video3);
//		
//		Video video4 = new Video("腿部鍛鍊", "bodyleg", "https://www.youtube.com/watch?v=y0ws24YZoA0", "大腿是健身者們容易忽略的一個部位，但是大腿卻是肌肉群最多的一個部位，腿部的鍛鍊對於健身者來說是非常重要的。");
//		session.save(video4);
//		
//		Video video5 = new Video("女性胸肌初階訓練", "bodychest", "https://www.youtube.com/watch?v=BGlC_yj8OdE", "以女性為主的胸肌訓練，主要使用到輔助式引體向上、坐姿窄握划船機、機械式坐姿划船、滑輪下拉、機械式上斜胸推、蝴蝶機夾胸、反向飛鳥。");
//		session.save(video5);
//
//		
//
//		session.getTransaction().commit();
//		session.close();
//		factory.close();
//	}
//
////	private static byte[] imageToByteArray(String imagePath) throws IOException {
////		BufferedImage bufferedImage = ImageIO.read(new File(imagePath));
////		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
////		ImageIO.write(bufferedImage, "jpg", byteArrayOutputStream);
////		byteArrayOutputStream.flush();
////		byte[] byteArray = byteArrayOutputStream.toByteArray();
////		byteArrayOutputStream.close();
////		return byteArray;
////	}
//
//}