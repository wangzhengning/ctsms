/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.entity;

import com.zhongxin.ctsms.common.persistence.DataEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 合同Entity
 *
 * @author Blue Devil
 * @version 2013-07-01
 */
@Entity
@Table(name = "t_contract_info")
@DynamicInsert @DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Contract extends DataEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long contractSid; // 主键ID
    private String contractId; // 合同编号
    private String processInstanceId; // 流程实例ID
    private String contractType; // 合同类型
    private String supplyId; // 供方编码
    private String demandId; // 需方编码
    private Long number; // 数量
    private Long amount; // 金额
    private String feeSts; //费用状态
    private Integer feeItemId; // 费用流水
    private String sts; // 状态
    private Date stsDate; //状态时间
    private Date signDate; //签订日期
    private Date startDate; //开始时间
    private Date endDate; //结束时间

    private String coalType; // 煤种
    private Integer calorie; // 热卡
    private Float price; // 执行单价
    private String deliveryPlace; // 交货地点
    private String taxFlag; // 是否含税 0:不含  1:含
    private String payMode; // 结算方式
    private String transType; // 运输类型
    private String payType; // 结算类型

    private List<PFile> files; // 上传的项目相关文件
    @Transient
    private List<CommonsMultipartFile> fileData;

    public Contract() {
        super();
        this.sts = "0";
        this.stsDate = new Date();
    }

    public Contract(Long id) {
        this();
        this.contractSid = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getContractSid() {
        return contractSid;
    }

    public void setContractSid(Long contractSid) {
        this.contractSid = contractSid;
    }

    @NotNull
    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    @NotNull
    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

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

    @NotNull
    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    @NotNull
    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public String getFeeSts() {
        return feeSts;
    }

    public void setFeeSts(String feeSts) {
        this.feeSts = feeSts;
    }

    public Integer getFeeItemId() {
        return feeItemId;
    }

    public void setFeeItemId(Integer feeItemId) {
        this.feeItemId = feeItemId;
    }

    @NotNull
    public String getSts() {
        return sts;
    }

    public void setSts(String sts) {
        this.sts = sts;
    }

    @NotNull
    public Date getStsDate() {
        return stsDate;
    }

    public void setStsDate(Date stsDate) {
        this.stsDate = stsDate;
    }

    @NotNull(message = "签订日期不能为空")
    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    @NotNull(message = "合同开始时间不能为空")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @NotNull(message = "合同到期时间不能为空")
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @OneToMany(cascade = { CascadeType.REFRESH, CascadeType.PERSIST,CascadeType.MERGE, CascadeType.REMOVE },mappedBy="contract")
    public List<PFile> getFiles() {
        return files;
    }

    public void setFiles(List<PFile> files) {
        this.files = files;
    }
    @Transient
    public List<CommonsMultipartFile> getFileData() {
        return fileData;
    }
    @Transient
    public void setFileData(List<CommonsMultipartFile> fileData) {
        this.fileData = fileData;
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


