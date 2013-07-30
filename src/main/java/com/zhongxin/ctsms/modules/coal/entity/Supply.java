package com.zhongxin.ctsms.modules.coal.entity;

import com.zhongxin.ctsms.common.persistence.DataEntity;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-24
 * Time: 下午9:36
 * To change this template use File | Settings | File Templates.
 */
@Table(name = "t_coal_supply")
@DynamicInsert
@DynamicUpdate
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Supply extends DataEntity implements Serializable {
    private Long supplyId;
    private String supplyName;

    public Supply(){

    }

    public Supply(Long id){
        this();
        this.supplyId = id;
    }
    @Column(name = "SUPPLY_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getSupplyId() {
        return supplyId;
    }

    public void setSupplyId(Long supplyId) {
        this.supplyId = supplyId;
    }

    @Column(name = "SUPPLY_NAME")
    @Basic
    public String getSupplyName() {
        return supplyName;
    }

    public void setSupplyName(String supplyName) {
        this.supplyName = supplyName;
    }

}
