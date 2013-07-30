package com.zhongxin.ctsms.modules.coal.entity;

import com.zhongxin.ctsms.common.persistence.BaseEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-4-11
 * Time: 下午10:19
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "t_contract_file")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class PFile extends BaseEntity{
    private Long id;
    private Contract contract;
    private String fileName;
    private String fileUrl;
    private String sts;
    private Date stsDate;

    public PFile() {
        this.stsDate = new Date();
        this.sts = DEL_FLAG_NORMAL;
    }

    public PFile(Long id) {
        this();
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="contract_sid")
    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getSts() {
        return sts;
    }

    public void setSts(String sts) {
        this.sts = sts;
    }

    public Date getStsDate() {
        return stsDate;
    }

    public void setStsDate(Date stsDate) {
        this.stsDate = stsDate;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
