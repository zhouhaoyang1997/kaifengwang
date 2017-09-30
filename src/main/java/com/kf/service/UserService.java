package com.kf.service;

import com.kf.mapper.UserMapper;
import com.kf.pojo.User;
import java.util.List;
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

    public User getUser(User user){
        List<User> users = userMapper.selectUser(user);
        if(users!=null&&users.size()==1){
            return users.get(0);
        }else{
            return null;
        }
    }
}
