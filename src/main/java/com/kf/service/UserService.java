package com.kf.service;

import com.kf.mapper.UserMapper;
import com.kf.pojo.User;

import java.sql.Timestamp;
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

    /**
     * 修改用户的最后登陆时间
     */
    public void updateUserLastLoginTime(Integer userId, Timestamp time){
        userMapper.updateUserLastLoginTime(userId,time);
    }

    public User getUser(User user){
        List<User> users = userMapper.selectUser(user);
        if(users!=null&&users.size()==1){
            return users.get(0);
        }else{
            return null;
        }
    }

    /**
     * 使用id获取用户
     * @param userId
     * @return
     */
    public User getUserByUserId(Integer userId){
        return userMapper.selectUserInfoByUserId(userId);
    }

    /**
     * 查询到当前用户的收藏的信息的所有id
     * @param userId
     * @return
     */
    public List<Integer> getAllPiIdByUserId(Integer userId){
        return userMapper.selectUserCollectionByUserId(userId);
    }

    /**
     * 修改用户密码
     * @param userId
     * @param userPwd
     */
    public void updateUserPwd(Integer userId,String userPwd){
        userMapper.updateUserPwd(userId,userPwd);
    }


    /**
     * 该手机号是否已经被使用
     * @param userPhone
     * @return
     */
    public boolean userPhoneIsNotExists(Integer userId,String userPhone){
        return userMapper.selectUserCountByUserPhone(userId,userPhone)==0;
    }

    /**
     * 该邮箱是否已经被使用
     * @param userEmail
     * @return
     */
    public boolean userEmailIsNotExists(Integer userId,String userEmail){
        return userMapper.selectUserCountByUserEmail(userId,userEmail)==0;
    }

    public boolean userNameIsNotExists(String userName){
        return userMapper.selectUserByUserName(userName)==0;
    }

    public boolean userEmailIsNotExists(String userEmail){
        return userMapper.selectUserByUserEmail(userEmail)==0;
    }

    /**
     * 修改手机号
     * @param userId
     * @param userPhone
     */
    public void updateUserPhone(Integer userId,String userPhone){
        userMapper.updateUserPhone(userId,userPhone);
    }

    /**
     * 修改邮箱
     * @param userId
     * @param userEmail
     */
    public void updateUserEmail(Integer userId,String userEmail){
        userMapper.updateUserEmail(userId,userEmail);
    }

    public void updateUserDescription(String ud,Integer userId){
        userMapper.updateUserProfileInfo(ud,userId);
    }

    /**
     * 修改用户头像
     * @param userImg
     * @param userId
     */
    public void updateUserImg(String userImg,Integer userId){
        userMapper.updateUserImg(userId,userImg);
    }

    /**
     * 修改当前用户公司认证状态
     * @param userId
     * @param attc
     */
    public void updateUserAttc(Integer userId,Integer attc){
        userMapper.updateUserAttc(userId,attc);
    }
}
