package tw.eeit117.wematch.product.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

public interface IProductBeanDAO {
	@Transactional
	public List<ProductBean> selectAll();

	@Transactional
	public void insert(ProductBean productBean);

	@Transactional
	public void deleteById(Integer productId);

	@Transactional
	public ProductBean findById(Integer productId);

	@Transactional
	public void update(ProductBean productBean);

	@Transactional
	public List<ProductBean> findByKeyword(String keyword);
}
