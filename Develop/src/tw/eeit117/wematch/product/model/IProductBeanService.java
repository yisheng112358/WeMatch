package tw.eeit117.wematch.product.model;

import java.util.List;

public interface IProductBeanService {
	public List<ProductBean> selectAll();

	public ProductBean insert(ProductBean productBean);
}
