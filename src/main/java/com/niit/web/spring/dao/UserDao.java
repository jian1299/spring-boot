package com.niit.web.spring.dao;

import com.niit.web.spring.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    User findById(Long id);
    User findByName(String username);
    List<User> findAll();
    int insert(User user);
    int update(User user);
    int delete(Long id);
}
