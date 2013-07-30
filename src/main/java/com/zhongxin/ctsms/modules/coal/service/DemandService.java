package com.zhongxin.ctsms.modules.coal.service;

import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.service.BaseService;
import com.zhongxin.ctsms.common.utils.CacheUtils;
import com.zhongxin.ctsms.common.utils.DateUtils;
import com.zhongxin.ctsms.common.utils.StringUtils;
import com.zhongxin.ctsms.modules.coal.dao.DemandDao;
import com.zhongxin.ctsms.modules.coal.entity.Demand;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-25
 * Time: 下午9:02
 * To change this template use File | Settings | File Templates.
 */
@Component
@Transactional(readOnly = true)
public class DemandService extends BaseService {
    private static Logger logger = LoggerFactory.getLogger(DemandService.class);

    @Autowired
    private DemandDao demandDao;

    public Demand get(Long id){
        return demandDao.findByDemandId(id);
    }

    public List<Demand> findAll(){
        return  demandDao.findAllList();
    }

    public Page<Demand> find(Page<Demand> page,Demand demand){
        DetachedCriteria dc = demandDao.createDetachedCriteria();
        if(StringUtils.isNotEmpty(demand.getDemandName())){
            dc.add(Restrictions.like("demandName","%" + demand.getDemandName() + "%"));
        }
        dc.add(Restrictions.eq(Demand.DEL_FLAG, Demand.DEL_FLAG_NORMAL));
        return  demandDao.find(page,dc);
    }

    @Transactional(readOnly = false)
    public void save(Demand demand){
        demandDao.save(demand);
        CacheUtils.remove("demandList");
    }

    @Transactional(readOnly = false)
    public void delete(Long id){
        demandDao.deleteById(id);
        CacheUtils.remove("demandList");
    }

    public List<Demand> findByDemandNameLike(String name) {
        DetachedCriteria dc = demandDao.createDetachedCriteria();
        if(StringUtils.isNotEmpty(name)){
            dc.add(Restrictions.like("demandName","%" + name + "%"));
        }
        dc.add(Restrictions.eq(Demand.DEL_FLAG, Demand.DEL_FLAG_NORMAL));
        return demandDao.find(dc);
    }
}
