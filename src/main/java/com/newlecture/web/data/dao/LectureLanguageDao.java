package com.newlecture.web.data.dao;

import java.util.List;

import com.newlecture.web.data.entity.LectureLanguage;




public interface LectureLanguageDao {
	List<LectureLanguage> getList();
	LectureLanguage get(String code);
	int add(LectureLanguage lectureLanguage);
	int update(LectureLanguage lectureLanguage);
	int delete(String code);
}
