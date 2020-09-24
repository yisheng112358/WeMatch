package tw.eeit117.wematch.diet.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.eeit117.wematch.diet.bean.Food;
import tw.eeit117.wematch.diet.dao.FoodDAO;

@Service
@Transactional
public class FoodService implements IFoodService {
	
	@Autowired
	private FoodDAO foodDAO;
	
	@Override
	public void addFood(Food food) {
		foodDAO.addFood(food);
	}
	
	@Override
	@Transactional
	public Food select(Integer Id) {
		return foodDAO.select(Id);
	}

	@Override
	@Transactional
	public List<Food> selectAll() {
		return foodDAO.selectAll();
	}
}

