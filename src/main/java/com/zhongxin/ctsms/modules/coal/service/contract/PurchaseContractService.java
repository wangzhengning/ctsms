package com.zhongxin.ctsms.modules.coal.service.contract;

import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.service.BaseService;
import com.zhongxin.ctsms.modules.coal.dao.PFileDao;
import com.zhongxin.ctsms.modules.coal.dao.contract.PurchaseContractDao;
import com.zhongxin.ctsms.modules.coal.entity.Contract;
import com.zhongxin.ctsms.modules.coal.entity.contract.PurchaseContract;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-7-16
 * Time: 下午4:41
 * To change this template use File | Settings | File Templates.
 */
@Component
@Transactional(readOnly = true)
public class PurchaseContractService extends BaseService {

    @SuppressWarnings("unused")
    private static Logger logger = LoggerFactory.getLogger(PurchaseContractService.class);

    @Autowired
    private PurchaseContractDao purchaseContractDao;

    @Autowired
    private PFileDao pFileDao;

    public PurchaseContract get(Long id) {
        return purchaseContractDao.findOne(id);
    }

    public Page<PurchaseContract> find(Page<PurchaseContract> page, PurchaseContract contract) {
        DetachedCriteria dc = purchaseContractDao.createDetachedCriteria();
        if (StringUtils.isNotEmpty(contract.getContractId())){
            dc.add(Restrictions.like("contractId", "%" + contract.getContractId() + "%"));
        }
        if (StringUtils.isNotEmpty(contract.getContractType())){
            dc.add(Restrictions.eq("contractType",contract.getContractType()));
        }
        dc.add(Restrictions.eq(Contract.DEL_FLAG, Contract.DEL_FLAG_NORMAL));
        //dc.addOrder(Order.desc("contractSid"));
        return purchaseContractDao.find(page, dc);
    }

    @Transactional(readOnly = false)
    public void save(PurchaseContract contract) {
        purchaseContractDao.save(contract);
    }

    @Transactional(readOnly = false)
    public void delete(Long id) {
        purchaseContractDao.deleteById(id);
    }

    /*
     * 文件删除
     */
    @Transactional(readOnly = false)
    public void delPFileById(Long id) {
        pFileDao.clear();
        pFileDao.deleteById(id);
    }
}
