package com.zhongxin.ctsms.modules.coal.dao;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import com.zhongxin.ctsms.modules.coal.entity.PFile;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-7-3
 * Time: 下午4:29
 * To change this template use File | Settings | File Templates.
 */
public interface PFileDao extends PFileDaoCustom, CrudRepository<PFile, Long> {
    @Modifying
    @Query("delete from PFile where id = ?1")
    public int deleteById(Long id);
}

/**
 * @author liuqy
 */
interface PFileDaoCustom extends BaseDao<PFile> {

}

/**
 * @author liuqy
 */
@Component
class PFileDaoImpl extends BaseDaoImpl<PFile> implements PFileDaoCustom {

}