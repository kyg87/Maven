package com.newlecture.web.data.dao;

import java.util.List;

import com.newlecture.web.data.entity.NoticeFile;
import com.newlecture.web.data.entity.Platform;

public interface PlatformDao {
	List<Platform> getList();
	Platform get(String code);
	int add(Platform platform);
	int update(Platform platform);
	int delete(String platform);
	
}
