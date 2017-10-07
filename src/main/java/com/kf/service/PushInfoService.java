package com.kf.service;

import com.kf.mapper.PushInfoMapper;
import com.kf.pojo.PushInfo;
import com.kf.vo.TagValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
/**
 * Created by 18236 on 2017/9/26.
 */
@Service
public class PushInfoService {
    @Autowired
    private PushInfoMapper pushInfoMapper;

    public List<PushInfo> getAllJob(Integer mcId, Integer scId, Integer districtId, List<TagValue> tags, Integer tagNum) {
        return pushInfoMapper.selectAllJob(mcId, scId, districtId, tags, tagNum);
    }

    public Integer addPushInfo(PushInfo pushInfo) {
        pushInfoMapper.addPushInfo(pushInfo);
        return pushInfo.getPiId();
    }
}
