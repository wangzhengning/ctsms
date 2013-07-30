/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package ${packageName}.${moduleName}.dao${subModuleName};

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import ${packageName}.${moduleName}.entity${subModuleName}.${ClassName};

/**
 * ${functionName}DAO接口
 * @author ${classAuthor}
 * @version ${classVersion}
 */
public interface ${ClassName}Dao extends ${ClassName}DaoCustom, CrudRepository<${ClassName}, Long> {

	@Modifying
	@Query("update ${ClassName} set delFlag='" + ${ClassName}.DEL_FLAG_DELETE + "' where id = ?1")
	public int deleteById(Long id);
	
}

/**
 * DAO Custome Interface
 * @author ${classAuthor}
 */
interface ${ClassName}DaoCustom extends BaseDao<${ClassName}> {

}

/**
 * DAO Custome Interface Implementation
 * @author ${classAuthor}
 */
@Component
class ${ClassName}DaoImpl extends BaseDaoImpl<${ClassName}> implements ${ClassName}DaoCustom {

}
