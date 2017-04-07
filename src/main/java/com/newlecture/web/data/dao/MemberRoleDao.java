package com.newlecture.web.data.dao;

import java.util.List;

import com.newlecture.web.entity.MemberRole;

public interface MemberRoleDao {

	   String getDefaultRoleById(String memberId);
	   List<MemberRole> getRolesOfMember(String memberId);
	   List<MemberRole> getList();
	   int insert(MemberRole memberRole);
	   int delete(MemberRole memberRole);
	   int update(MemberRole memberRole);
}
