package com.zhongxin.ctsms.modules.coal.entity.contract;

import com.zhongxin.ctsms.common.persistence.DataEntity;
import com.zhongxin.ctsms.modules.coal.entity.PFile;
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
@Table(name = "t_contract")
@DynamicInsert @DynamicUpdate
@Inheritance (strategy=InheritanceType.JOINED)
@DiscriminatorColumn(name="CONTRACT_TYPE", discriminatorType=DiscriminatorType.STRING)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class BaseContract extends DataEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long contractSid; // 主键ID
    private String contractId; // 合同编号
    private String processInstanceId; // 流程实例ID
    private String contractType; // 合同类型
    //private String feeSts; //费用状态
    //private Integer feeItemId; // 费用流水
    private String sts; // 状态
    private Date stsDate; //状态时间
    private Date signDate; //签订日期
    private Date startDate; //开始时间
    private Date endDate; //结束时间

    private List<PFile> files; // 上传的项目相关文件
    @Transient
    private List<CommonsMultipartFile> fileData;

    public BaseContract() {
        super();
        this.sts = "0";
        this.stsDate = new Date();
    }

    public BaseContract(Long id) {
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


/*
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
    } */

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
}

