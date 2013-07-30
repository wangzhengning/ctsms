package com.zhongxin.ctsms.modules.coal.dao.contract;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import com.zhongxin.ctsms.modules.coal.entity.contract.PurchaseContract;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-7-16
 * Time: 下午4:42
 * To change this template use File | SetFile Templates.
 */
public interface PurchaseContractDao extends PurchaseContractDaoCustom, CrudRepository<PurchaseContract, Long> {
    @Modifying
    @Query("update PurchaseContract set delFlag='" + PurchaseContract.DEL_FLAG_DELETE + "' where id = ?1")
    public int deleteById(Long id);
}

/**
 * DAO Custome Interface
 * @author Blue Devil
 */
interface PurchaseContractDaoCustom extends BaseDao<PurchaseContract> {

}

/**
 * DAO Custome Interface Implementation
 * @author Blue Devil
 */
@Component
class PurchaseContractDaoImpl extends BaseDaoImpl<PurchaseContract> implements PurchaseContractDaoCustom {

}