package com.zhongxin.ctsms.modules.coal.entity.contract;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-7-16
 * Time: 上午11:53
 * To change this template use File | Settings | File Templates.
 */
@Entity
@DiscriminatorValue("2")
public class SaleContract extends BaseContract implements Serializable {
    private static final long serialVersionUID = 1L;
    private String supplyId; // 供方编码
    private String demandId; // 需方编码
    private String coalType; // 煤种
    private Integer calorie; // 热卡
    private Float price; // 执行单价
    private String deliveryPlace; // 交货地点
    private String taxFlag; // 是否含税 0:不含  1:含
    private String payMode; // 结算方式
    private Long number; // 数量 (吨)
    private Long amount; // 金额 (元)
    private String transType; // 运输类型
    private String payType; // 结算类型

    public String getSupplyId() {
        return supplyId;
    }

    public void setSupplyId(String supplyId) {
        this.supplyId = supplyId;
    }

    public String getDemandId() {
        return demandId;
    }

    public void setDemandId(String demandId) {
        this.demandId = demandId;
    }

    public String getCoalType() {
        return coalType;
    }

    public void setCoalType(String coalType) {
        this.coalType = coalType;
    }

    public Integer getCalorie() {
        return calorie;
    }

    public void setCalorie(Integer calorie) {
        this.calorie = calorie;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getDeliveryPlace() {
        return deliveryPlace;
    }

    public void setDeliveryPlace(String deliveryPlace) {
        this.deliveryPlace = deliveryPlace;
    }

    public String getTaxFlag() {
        return taxFlag;
    }

    public void setTaxFlag(String taxFlag) {
        this.taxFlag = taxFlag;
    }

    public String getPayMode() {
        return payMode;
    }

    public void setPayMode(String payMode) {
        this.payMode = payMode;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public String getTransType() {
        return transType;
    }

    public void setTransType(String transType) {
        this.transType = transType;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }
}
