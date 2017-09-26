package com.kf.service;

import com.kf.mapper.TagMapper;
import com.kf.pojo.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
/**
 * Created by 18236 on 2017/9/26.
 */
@Service
public class TagService {

    @Autowired
    private TagMapper tagMapper;

    public List<Tag> getAllTag(int mcId){
        return tagMapper.selectAllTag(mcId);
    }
}
