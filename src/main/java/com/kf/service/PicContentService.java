package com.kf.service;

import com.kf.mapper.PicContentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 该service用来存储发表的用户信息的除baseInfo之外的信息
 */
@Service
public class PicContentService {


    @Autowired
    private PicContentMapper picContentMapper;

    public void addPicContent(int picId, Integer piId, String pcContent) {
        picContentMapper.insertPicContent(picId, piId, pcContent);
    }

    public void updatePicContent(int picId,Integer piId,String pcContent){
        picContentMapper.updatePicContent(picId,piId,pcContent);
    }
}
