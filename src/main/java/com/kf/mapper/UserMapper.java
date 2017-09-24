package com.kf.mapper;

import com.kf.pojo.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by 18236 on 2017/9/24.
 */
@Mapper
public interface UserMapper {

    /**
     *
     * @param user
     */
    void addUser(User user);
}
