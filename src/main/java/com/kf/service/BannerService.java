package com.kf.service;

import com.kf.mapper.BannerMapper;
import com.kf.pojo.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 18236 on 2017/11/17.
 */
@Service
public class BannerService {


    @Autowired
    private BannerMapper bannerMapper;

    public List<Banner> getBannerByMcId(Integer mcId){
        return bannerMapper.selectBannerByMcId(mcId);
    }
}
