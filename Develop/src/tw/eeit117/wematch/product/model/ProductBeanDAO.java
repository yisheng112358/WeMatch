package tw.eeit117.wematch.product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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

	@Value("${CURE_STATE_SUCCESS}")
	private String CURE_STATE_SUCCESS;

	@Value("${CURE_STATE_REPEATED}")
	private String CURE_STATE_REPEATED;

	@Override
	public List<ProductBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM " + productPersistentClass, ProductBean.class).list();
	}

	@Override
	public void insert(ProductBean productBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(productBean);
	}

	@Override
	public String deleteById(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean productBean = session.byId(ProductBean.class).load(productId);
		session.delete(productBean);
		return null;
	}

	@Override
	public ProductBean findById(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		return session.byId(ProductBean.class).load(productId);
	}

	@Override
	public void update(ProductBean productBean) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean productBeanActive = session.byId(ProductBean.class).load(productBean.getProductId());
		if (productBeanActive != null) {
			productBeanActive.setCategory(productBean.getCategory());
			productBeanActive.setDetailImg(productBean.getDetailImg());
			productBeanActive.setPrice(productBean.getPrice());
			productBeanActive.setProductDescription(productBean.getProductDescription());
			productBeanActive.setProductName(productBean.getProductName());
			productBeanActive.setStock(productBean.getStock());
			productBeanActive.setThumbnail(productBean.getThumbnail());
		} else {
			this.insert(productBean);
		}
	}

}
