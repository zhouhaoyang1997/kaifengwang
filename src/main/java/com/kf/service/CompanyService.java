package com.kf.service;

import com.kf.mapper.CompanyMapper;
import com.kf.pojo.Company;
import com.kf.util.BasePath;
import com.kf.util.FileUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

    @Autowired
    private BasePath basePath;

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

    /**
     * 查询当前用户的公司认证
     * @param userId
     * @return
     */
    public Company getCompany(Integer userId){
        return companyMapper.selectCompanyByUser(userId);
    }


    public void deleteCompany(Integer userId){
        //查出他的图片并删除
        Company company = getCompany(userId);
        if(company!=null){
            String path = company.getCpImg();
            if(path!=null&& StringUtils.isNotBlank(path)){
                String filePaths[] = path.split("#");
                for(String filePath: filePaths){
                    FileUtil.deleteImg(basePath.getPathValue()+filePath);
                }
            }
            String pzPath = company.getCpPzImg();
            if(pzPath!=null&&StringUtils.isNotBlank(pzPath)){
                FileUtil.deleteImg(basePath.getPathValue()+pzPath);
            }
        }
        companyMapper.deleteCompany(userId);
    }

    public void updateCompanyCpImg(Integer userId,String imgUrl){
        companyMapper.updateCompanyImg(userId,imgUrl);
    }

    public void updateCompany(Integer userId,Company company){
        company.setCpUser(userId);
        companyMapper.updateCompany(company);
    }
}
