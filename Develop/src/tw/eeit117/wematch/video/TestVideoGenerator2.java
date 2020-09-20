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
//public class TestVideoGenerator2 {
//
//	public static void main(String[] args) throws IOException {
//		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
//		SessionFactory factory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
//		Session session = factory.openSession();
//		session.beginTransaction();
//
//		Video video1 = new Video("練背怎麼練", "bodyback", "https://www.youtube.com/watch?v=9pdk5SryJcM", "健身系列-練背",
//				imageToByteArray("resource\\videodemo\\bodyback\\back1.jpg"));
//		session.save(video1);
//		
//		Video video2 = new Video("練背怎麼練", "bodyback", "https://www.youtube.com/watch?v=AGga884deKA", "健身系列-練背",
//				imageToByteArray("resource\\videodemo\\bodyback\\back2.jpg"));
//		session.save(video2);
//		
//		Video video3 = new Video("練胸怎麼練", "bodychest", "https://www.youtube.com/watch?v=eSw7GGEuFy0", "健身系列-練胸",
//				imageToByteArray("resource\\videodemo\\bodychest\\chest1.jpg"));
//		session.save(video3);
//		
//		Video video4 = new Video("練腿怎麼練", "bodyleg", "https://www.youtube.com/watch?v=y0ws24YZoA0", "健身系列-練腿",
//				imageToByteArray("resource\\videodemo\\bodyleg\\leg1.jpg"));
//		session.save(video4);
//
//		
//
//		session.getTransaction().commit();
//		session.close();
//		factory.close();
//	}
//
//	private static byte[] imageToByteArray(String imagePath) throws IOException {
//		BufferedImage bufferedImage = ImageIO.read(new File(imagePath));
//		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
//		ImageIO.write(bufferedImage, "jpg", byteArrayOutputStream);
//		byteArrayOutputStream.flush();
//		byte[] byteArray = byteArrayOutputStream.toByteArray();
//		byteArrayOutputStream.close();
//		return byteArray;
//	}
//
//}