package com.kf.service;

import com.kf.mapper.HotSearchMapper;
import com.kf.pojo.HotSearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 18236 on 2017/10/26.
 */

@Service
public class HotSearchService {

    @Autowired
    private HotSearchMapper hotSearchMapper;

    /**
     * 该方法传参若为0，全部查询
     * @param num
     * @return
     */
    public List<HotSearch> getHotSearch(Integer num){
        return hotSearchMapper.selectHotSearch(num);
    }
}
