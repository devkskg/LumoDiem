package com.lumodiem.board.memberboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
import com.lumodiem.board.memberboard.vo.ReviewMapping;

public class MemberBoardDao {

	public int insertReview(SqlSession session, Review r) {
		session.insert("reviewMapper.reviewInsert",r);
		return r.getReviewNo();
	}
	public int insertReviewAttach(SqlSession session, ReviewAttach a) {
		session.insert("reviewMapper.reviewAttachInsert",a);
		return a.getAttachNo(); 
	}
	public int insertReviewMapping(SqlSession session, ReviewMapping m) {
		int result = session.insert("reviewMapper.reviewMappingInsert");
		return result;
	}
	public int UpdateReview(SqlSession session, Review review) {
		return session.update("reviewMapper.reviewUpdate",review);
	}
	public List<Review> selectReviewList(SqlSession session,Review option){
		return session.selectList("reviewMapper.reviewList",option);
	}
	public Review selectReviewOne(SqlSession session, int reviewNo) {
		return session.selectOne("reviewMapper.reviewOne",reviewNo);
	}
	public ReviewAttach selectAttachOne(SqlSession session, int attachNo) {
		return session.selectOne("reviewMapper.attachOne",attachNo);
	}
	public List<Klass> attendedKlass(SqlSession session, int accountNo){
		return session.selectList("reviewMapper.attendedKlass",accountNo);
	}
	public List<Klass> searchResNo(SqlSession session, int resNo){
		return session.selectList("reviewMapper.attendedKlass",resNo);
	}
	public List<Klass> searchKlassDateNo(SqlSession session, int klassDateNo){
		return session.selectList("reviewMapper.attendedKlass",klassDateNo);
	}

}
