package com.lumodiem.board.hostboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.dao.HostBoardDao;
import com.lumodiem.board.hostboard.vo.Klass;

public class HostBoardService {
	
	public List<Klass> selectBoardList(Klass option){
		SqlSession session = getSqlSession();
		List<Klass> resultList = new 
	}

	public int insertBoard(Klass option) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().insertBoard(session, option);
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
}
