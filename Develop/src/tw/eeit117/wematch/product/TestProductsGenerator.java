package tw.eeit117.wematch.product;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class TestProductsGenerator {

	public static void main(String[] args) throws IOException {
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory factory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();

		Product product1 = new Product("Massager", "3D massager 鑽石按摩儀", 299, 1, "微雕按摩儀/體雕棒(按摩儀)",
				imageToByteArray("resource\\massager\\massager1_t.jpg"),
				imageToByteArray("resource\\massager\\massager1_d.jpg"));
		session.save(product1);

		Product product2 = new Product("Massager", "Thera-Band Roller Massager", 1000, 8, "標準版 滾筒按摩器(免運費)",
				imageToByteArray("resource\\massager\\massager2_t.jpg"),
				imageToByteArray("resource\\massager\\massager2_d.jpg"));
		session.save(product2);

		Product product3 = new Product("Massager", "Fascia Gun Storage Massage", 584, 2,
				"Gun Base Massage Gun Stand Fasc", imageToByteArray("resource\\massager\\massager3_t.jpg"),
				imageToByteArray("resource\\massager\\massager3_d.jpg"));
		session.save(product3);

		Product product4 = new Product("Massager", " Melon low-frequency electric therapy", 2489, 1,
				"Massage machine white HV-F022-W F/S", imageToByteArray("resource\\massager\\massager4_t.jpg"),
				imageToByteArray("resource\\massager\\massager4_d.jpg"));
		session.save(product4);

		Product product5 = new Product("Massager", "HOT Electric Pulse Neck Massager", 770, 10,
				"Pain Relief Magnetic Therapy Vertebra Treatment",
				imageToByteArray("resource\\massager\\massager5_t.jpg"),
				imageToByteArray("resource\\massager\\massager5_d.jpg"));
		session.save(product5);

		Product product6 = new Product("Yoga", "高密度瑜珈墊", 179, 99, "10mm NBR環保瑜珈墊",
				imageToByteArray("resource\\yoga\\yoga1_t.jpg"), imageToByteArray("resource\\yoga\\yoga1_d.jpg"));
		session.save(product6);

		Product product7 = new Product("Yoga", "瑜珈球", 299, 99, "加厚防爆  高承重力 環保PVC",
				imageToByteArray("resource\\yoga\\yoga2_t.jpg"), imageToByteArray("resource\\yoga\\yoga2_d.jpg"));
		session.save(product7);

		Product product8 = new Product("Yoga", "瑜伽柱", 299, 99, "月牙型/按摩輔助/滾輪泡沫軸",
				imageToByteArray("resource\\yoga\\yoga3_t.jpg"), imageToByteArray("resource\\yoga\\yoga3_d.jpg"));
		session.save(product8);

		Product product9 = new Product("Yoga", "空中瑜伽吊床瑜珈秋千", 1487, 59, "健身吊床戶外降落傘布YOGA HAMMOCKYXS",
				imageToByteArray("resource\\yoga\\yoga4_t.jpg"), imageToByteArray("resource\\yoga\\yoga4_d.jpg"));
		session.save(product9);

		Product product10 = new Product("Yoga", "Yoga Block", 483, 99, "LIVEUPEVA 瑜伽輔助用品家用瑜伽館工具裝備",
				imageToByteArray("resource\\yoga\\yoga5_t.jpg"), imageToByteArray("resource\\yoga\\yoga5_d.jpg"));
		session.save(product10);

		Product product11 = new Product("Supplement", "Rule One R1", 1495, 14, "水解乳清蛋白 天然無調味ON,BSN,MP,Myprotein",
				imageToByteArray("resource\\supplement\\protein1_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein1_d.jpeg"));
		session.save(product11);

		Product product12 = new Product("Supplement", "MusclePharm MP Combat", 1345, 30, "乳清蛋白 4磅 高蛋白乳清",
				imageToByteArray("resource\\supplement\\protein2_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein2_d.jpeg"));
		session.save(product12);

		Product product13 = new Product("Supplement", "Rule One R1 Whey Blend", 3645, 24, "10磅 高蛋白乳清",
				imageToByteArray("resource\\supplement\\protein3_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein3_d.jpeg"));
		session.save(product13);

		Product product14 = new Product("Supplement", "Optimum Nutrition ON", 1945, 99, "金牌乳清蛋白五磅 高蛋白 附防偽標籤",
				imageToByteArray("resource\\supplement\\protein4_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein4_d.jpeg"));
		session.save(product14);

		Product product15 = new Product("Supplement", "MYPROTEIN", 2599, 99, "正品 附發票（現貨）5公斤 2.5公斤 1公斤 原廠 高蛋白 乳清蛋白 蛋白粉",
				imageToByteArray("resource\\supplement\\protein4_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein4_d.jpeg"));
		session.save(product15);

		session.getTransaction().commit();
		session.close();
		factory.close();
	}

	private static byte[] imageToByteArray(String imagePath) throws IOException {
		BufferedImage bufferedImage = ImageIO.read(new File(imagePath));
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		ImageIO.write(bufferedImage, "jpg", byteArrayOutputStream);
		byteArrayOutputStream.flush();
		byte[] byteArray = byteArrayOutputStream.toByteArray();
		byteArrayOutputStream.close();
		return byteArray;
	}

}