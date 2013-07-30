/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import com.zhongxin.ctsms.modules.coal.entity.Contract;

/**
 * 合同DAO接口
 * @author Blue Devil
 * @version 2013-07-01
 */
public interface ContractDao extends ContractDaoCustom, CrudRepository<Contract, Long> {

	@Modifying
	@Query("update Contract set delFlag='" + Contract.DEL_FLAG_DELETE + "' where id = ?1")
	public int deleteById(Long id);
	
}

/**
 * DAO Custome Interface
 * @author Blue Devil
 */
interface ContractDaoCustom extends BaseDao<Contract> {

}

/**
 * DAO Custome Interface Implementation
 * @author Blue Devil
 */
@Component
class ContractDaoImpl extends BaseDaoImpl<Contract> implements ContractDaoCustom {

}
