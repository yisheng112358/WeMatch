package tw.eeit117.wematch.courses.dao;

import java.util.List;

import tw.eeit117.wematch.courses.model.Courses;

public interface CoursesDAO {
	//新增
	public void addCourses(Courses courses);
	//單筆查詢
	public Courses getCourses(int coursesId);
	//全部查詢
	public List<Courses> getAllCourses();
	//更新
	public Courses updateCourses(Courses courses);
	//刪除
	public void deleteCourses(int coursesId);
	
}
