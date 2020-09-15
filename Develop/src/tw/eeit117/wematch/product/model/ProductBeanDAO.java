package tw.eeit117.wematch.product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Repository;

@Repository
@PropertySource("classpath:TableName.properties")
public class ProductBeanDAO implements IProductBeanDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Value("${productTablePersistentClassName}")
	private String productPersistentClass;

	@Override
	public List<ProductBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM " + productPersistentClass, ProductBean.class).list();
	}

	public ProductBean insert(ProductBean productBean) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean product = session.get(ProductBean.class, productBean.getProductId());
		if (product == null) {
			session.save(product);
			return product;
		}
		return null;
	}

}
