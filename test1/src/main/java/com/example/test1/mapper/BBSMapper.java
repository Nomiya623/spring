package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.BBS;

@Mapper
public interface BBSMapper {
	List<BBS> selectBBSList(HashMap<String, Object> map); 
	void updateBBS(HashMap<String, Object> map);
	void insertBBS(HashMap<String, Object> map);
	void removeBBS(HashMap<String, Object> map); 
}
