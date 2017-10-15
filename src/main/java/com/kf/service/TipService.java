package com.kf.service;

import com.kf.mapper.TipMapper;
import com.kf.pojo.Tip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 18236 on 2017/10/14.
 */
@Service
public class TipService {
    @Autowired
    private TipMapper tipMapper;

    public void addTip(Tip tip){
        tipMapper.insertTip(tip);
    }
}
