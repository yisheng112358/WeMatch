package tw.eeit117.wematch.product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ProductBeanDAO implements IProductBeanDAO {
	private SessionFactory sessionFactory;

	public ProductBeanDAO() {
	}

	public ProductBeanDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ProductBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM ProductBean", ProductBean.class).list();
	}

}
