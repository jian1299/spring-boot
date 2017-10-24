package com.niit.web.spring.dao;

import com.niit.web.spring.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserDaoTest {

    @Autowired
    private UserDao userDao;

    @Test
    public void findById() throws Exception {
        System.out.println(userDao.findById(1001L));
    }
    @Test
    public void findByName()throws Exception{
        System.out.println(userDao.findByName("aaa"));
    }
    @Test
    public void findAll() throws Exception{
        List<User> list = userDao.findAll();
        for(User user:list){
            System.out.println(user);
        }
    }

    @Test
    public void insert() throws Exception{
        User user = new User();
        user.setUsername("zhangxiao");
        user.setPassword("dashabi");
        user.setSex("man");
        user.setEmail("24142@qq.com");
        user.setMobile("12314142");
        user.setStatus(1);
        userDao.insert(user);
    }

}