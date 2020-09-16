package tw.eeit117.wematch.product.model;

import java.util.List;

public class ProductBeanService implements IProductBeanService {
	private ProductBeanDAO productDao;

	public ProductBeanService() {
	}

	public ProductBeanService(ProductBeanDAO productDao) {
		this.productDao = productDao;
	}

	@Override
	public List<ProductBean> selectAll() {
		return productDao.selectAll();
	}

}
