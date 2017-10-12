package com.kf.service;

import com.kf.mapper.CompanyMapper;
import com.kf.pojo.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {


    @Autowired
    private CompanyMapper companyMapper;
    /**
     * 添加公司,用于公司认证,返回id
     * @param company
     * @return
     */
    public Integer insertCompany(Company company){
        companyMapper.insertCompany(company);
        return company.getCompanyId();
    }
}
