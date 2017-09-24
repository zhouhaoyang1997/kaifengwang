package com.kf.service;

import com.kf.mapper.UserMapper;
import com.kf.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 18236 on 2017/9/24.
 */
@Service
public class UserService {

    @Autowired
    public UserMapper userMapper;

    public void addUser(User user){
        userMapper.addUser(user);
    }
}
