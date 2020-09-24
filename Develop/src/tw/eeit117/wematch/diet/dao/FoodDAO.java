package tw.eeit117.wematch.diet.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit117.wematch.diet.bean.Food;

@Repository
public class FoodDAO implements IFoodDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public FoodDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void addFood(Food food) {
		sessionFactory.getCurrentSession().saveOrUpdate(food);
	}
	
	@Override
	public Food select(Integer Id) {
		return (Food) sessionFactory.getCurrentSession()
				.get(Food.class, Id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Food> selectAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Food").list();
	}
}


