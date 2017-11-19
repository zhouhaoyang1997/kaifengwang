package com.kf.mapper;

import com.kf.pojo.Company;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CompanyMapper {
    void insertCompany(Company company);

    Company selectCompanyByUser(@Param("userId")Integer userId);

    void deleteCompany(@Param("userId") Integer userId);

    void updateCompanyImg(@Param("userId")Integer userId,@Param("imgUrl")String imgUrl);

    void updateCompany(Company company);
}
