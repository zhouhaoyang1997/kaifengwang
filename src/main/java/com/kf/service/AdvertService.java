package com.kf.service;

import com.kf.mapper.AdvertMapper;
import com.kf.pojo.Advert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdvertService {

    @Autowired
    private AdvertMapper advertMapper;

    public List<Advert> getAdvertByPage(String page){
        return advertMapper.selectAdvertByPage(page);
    }
}
