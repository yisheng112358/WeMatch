package tw.eeit117.wematch.courses.service;

import java.util.List;

import tw.eeit117.wematch.courses.model.Curriculum;



public interface CurriculumService {
	
		//加選
		public void addCurriculum(Curriculum curriculum);
		
		//退選
		public void deleteCurriculum(int curriculumId);
		
//		//單筆查詢會員
//		public Member getMember(int memberId);
		
			
		//列出所有課表
		public List<Curriculum> getAllCurriculum();
		
		//單筆查詢課表
		public Curriculum getCurriculum(int curriculumId);

		//確認有無複選
		public boolean checkCourses(int coursesId);
}
