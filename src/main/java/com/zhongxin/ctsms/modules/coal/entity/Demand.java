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
@Table(name = "t_coal_demand")
@DynamicInsert
@DynamicUpdate
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Demand extends DataEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    private Long demandId;
    private String demandName;

    public Demand(){

    }

    public Demand(Long id) {
        this();
        this.demandId = id;
    }
    @Column(name = "DEMAND_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getDemandId() {
        return demandId;
    }

    public void setDemandId(Long demandId) {
        this.demandId = demandId;
    }

    @Column(name = "DEMAND_NAME")
    @Basic
    public String getDemandName() {
        return demandName;
    }

    public void setDemandName(String demandName) {
        this.demandName = demandName;
    }
}
