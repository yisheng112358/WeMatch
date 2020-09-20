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
	public String insert(ProductBean productBean) {
		return productDao.insert(productBean);
	}

	@Override
	public String deleteById(Integer productId) {
		return productDao.deleteById(productId);
	}

	@Override
	public ProductBean findById(Integer productId) {
		return productDao.findById(productId);
	}

}
