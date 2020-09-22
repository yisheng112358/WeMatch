package tw.eeit117.wematch.courses.dao;

import java.util.List;

import tw.eeit117.wematch.courses.model.Courses;
import tw.eeit117.wematch.courses.model.Curriculum;

public interface CurriculumDAO {
	
	//加選
	public void addCurriculum(Curriculum curriculum);
	
	//退選
	public void deleteCurriculum(int curriculumId);
	
//	//單筆查詢會員
//	public Member getMember(int memberId);

	//查詢會員的課程
	public List<Curriculum> getAllCurriculum();
	
	//單筆查詢課表
	public Curriculum getCurriculum(int curriculumId);
	
	//確認有無複選
	public boolean checkCourses(int coursesId);
	
	
}
