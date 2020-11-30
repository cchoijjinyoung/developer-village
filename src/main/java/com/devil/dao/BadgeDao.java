package com.devil.dao;

import java.util.List;
import com.devil.domain.Badge;

public interface BadgeDao {
  public int insert(Badge badge) throws Exception;
  public int update(Badge badge) throws Exception;
  public List<Badge> findAll(String keyword) throws Exception;
  public Badge findByNo(int no) throws Exception;
  public int delete(int no) throws Exception;
}