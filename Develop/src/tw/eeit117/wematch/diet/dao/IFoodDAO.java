package tw.eeit117.wematch.diet.dao;

import java.util.List;

import tw.eeit117.wematch.diet.bean.Food;

public interface IFoodDAO {

	//新增
	public void addFood(Food food);  
	
	// 單筆查詢
	public Food select(Integer Id);

	// 多筆查詢
	public List<Food> selectAll();
}
