package com.kf.service;

import com.kf.mapper.DistrictMapper;
import java.util.List;

import com.kf.pojo.District;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 18236 on 2017/9/26.
 */
@Service
public class DistrictService {

    @Autowired
    private DistrictMapper districtMapper;

    public List<District> getAllDistrict(){
        return districtMapper.selectAllDistrict();
    }
}
