package com.kf.mapper;

import com.kf.pojo.Company;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CompanyMapper {
    void insertCompany(Company company);

    Company selectCompanyByUser(@Param("userId")Integer userId);
}
