package tw.eeit117.wematch.product.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductBeanService implements IProductBeanService {

	@Autowired
	private ProductBeanDAO productDao;

	@Override
	public List<ProductBean> selectAll() {
		return productDao.selectAll();
	}

	@Override
	public void insert(ProductBean productBean) {
		productDao.insert(productBean);
	}

	@Override
	public void deleteById(Integer productId) {
		productDao.deleteById(productId);
	}

	@Override
	public ProductBean findById(Integer productId) {
		return productDao.findById(productId);
	}

	@Override
	public void update(ProductBean productBean) {
		productDao.update(productBean);
	}

	@Override
	public List<ProductBean> findByKeyword(String keyword) {
		return productDao.findByKeyword(keyword);
	}

}
