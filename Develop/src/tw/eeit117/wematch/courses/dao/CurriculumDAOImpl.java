package tw.eeit117.wematch.courses.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit117.wematch.courses.model.Courses;
import tw.eeit117.wematch.courses.model.Curriculum;

@Repository
public class CurriculumDAOImpl implements CurriculumDAO{

	@Autowired
	private SessionFactory sessionFactory;
		
	public CurriculumDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	//加選
	@Override
	public void addCurriculum(Curriculum curriculum) {
		sessionFactory.getCurrentSession().saveOrUpdate(curriculum);
		
	}

	//退選
	@Override
	public void deleteCurriculum(int curriculumId) {
		Curriculum curriculum = (Curriculum) sessionFactory.getCurrentSession()
				.load(Curriculum.class, curriculumId);
		if (curriculum != null  ) {
			this.sessionFactory.getCurrentSession().delete(curriculum);
		}
		
	}
	
		//查詢"已選"課表
		@Override
		@SuppressWarnings("unchecked")
		public List<Curriculum> getAllCurriculum() {
			return sessionFactory.getCurrentSession()
					.createQuery("from Curriculum").list();
	
		}
		
		//確認有無複選
		@Override
		public boolean checkCourses(int coursesId) {
			Session session = sessionFactory.getCurrentSession();
			
			String hqlStr = "from Curriculum where coursesId=:coursesId";
			Query<Curriculum> query = session.createQuery(hqlStr,Curriculum.class);
			

			query.setParameter("coursesId", coursesId);
			
			Curriculum resultCurriculum = query.uniqueResult();
			//当确定返回的实例只有一个或者null时 用uniqueResult()方法
			
			if(resultCurriculum != null) {				
				return true;
			}else {
				return false;
			}
		}

		//單筆查詢課表ID
		@Override
		public Curriculum getCurriculum(int curriculumId) {
			return (Curriculum) sessionFactory.getCurrentSession()
					.get(Curriculum.class, curriculumId);
		}

		

//	//查詢會員課表
//	@Override
//	public Member getMember(int memberId) {		
//		return (Member) sessionFactory.getCurrentSession()
//				.get(Member.class, memberId);
//	}
//
//
	
}
