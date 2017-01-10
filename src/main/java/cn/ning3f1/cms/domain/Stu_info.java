package cn.ning3f1.cms.domain;

import java.util.Date;

public class Stu_info {
    private Integer stuId;

    private String stuName;

    private String stuSex;

    private Date stuBirth;

    private String stuNation;

    private Integer stuClassId;

    private Date stuEntranceDate;

    private String stuHome;

    private String stuPolitic;

    private String idNumber;

    private String stuSpecialty;

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex == null ? null : stuSex.trim();
    }

    public Date getStuBirth() {
        return stuBirth;
    }

    public void setStuBirth(Date stuBirth) {
        this.stuBirth = stuBirth;
    }

    public String getStuNation() {
        return stuNation;
    }

    public void setStuNation(String stuNation) {
        this.stuNation = stuNation == null ? null : stuNation.trim();
    }

    public Integer getStuClassId() {
        return stuClassId;
    }

    public void setStuClassId(Integer stuClassId) {
        this.stuClassId = stuClassId;
    }

    public Date getStuEntranceDate() {
        return stuEntranceDate;
    }

    public void setStuEntranceDate(Date stuEntranceDate) {
        this.stuEntranceDate = stuEntranceDate;
    }

    public String getStuHome() {
        return stuHome;
    }

    public void setStuHome(String stuHome) {
        this.stuHome = stuHome == null ? null : stuHome.trim();
    }

    public String getStuPolitic() {
        return stuPolitic;
    }

    public void setStuPolitic(String stuPolitic) {
        this.stuPolitic = stuPolitic == null ? null : stuPolitic.trim();
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber == null ? null : idNumber.trim();
    }

    public String getStuSpecialty() {
        return stuSpecialty;
    }

    public void setStuSpecialty(String stuSpecialty) {
        this.stuSpecialty = stuSpecialty == null ? null : stuSpecialty.trim();
    }
}