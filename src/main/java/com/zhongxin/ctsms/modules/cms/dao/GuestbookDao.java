/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/zhongxin/ctsms">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.zhongxin.ctsms.modules.cms.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import com.zhongxin.ctsms.modules.cms.entity.Guestbook;

/**
 * 留言DAO接口
 * @author ThinkGem
 * @version 2013-01-15
 */
public interface GuestbookDao extends GuestbookDaoCustom, CrudRepository<Guestbook, Long> {

	@Modifying
	@Query("update Guestbook set delFlag=?2 where id = ?1")
	public int updateDelFlag(Long id, String status);
	
}

/**
 * DAO自定义接口
 * @author ThinkGem
 */
interface GuestbookDaoCustom extends BaseDao<Guestbook> {

}

/**
 * DAO自定义接口实现
 * @author ThinkGem
 */
@Repository
class GuestbookDaoImpl extends BaseDaoImpl<Guestbook> implements GuestbookDaoCustom {

}
