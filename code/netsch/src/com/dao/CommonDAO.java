package com.dao;

import java.util.ArrayList;

import com.model.SchDetailModel;
import com.model.SchModel;
import com.model.UserModel;

public class CommonDAO {
	private SqlMapperConnection sqlMapper;

	public void setSqlMapper(SqlMapperConnection sqlMapper) {
		this.sqlMapper = sqlMapper;
	}
	
	public ArrayList<UserModel> getUserList() throws Exception{
		 return (ArrayList<UserModel>)sqlMapper.getSqlMap().queryForList("getUserList");
	}

	public ArrayList<SchModel> getSchList() throws Exception{
		 return (ArrayList<SchModel>)sqlMapper.getSqlMap().queryForList("getSchList");
	}
	
	public ArrayList<SchDetailModel> getSchDetailList(String user_id) throws Exception{
		System.out.println(user_id);
		 return (ArrayList<SchDetailModel>)sqlMapper.getSqlMap().queryForList("getSchDetailList", user_id);
	}
	
	public String getUserPass(String user_id) throws Exception{
		 return (String)sqlMapper.getSqlMap().queryForObject("getUserPass", user_id);
	}
	
	public String getDbUserId(String user_id) throws Exception{
		 return (String)sqlMapper.getSqlMap().queryForObject("getDbUserId", user_id);
	}
	
	public int countSearchId(String user_id) throws Exception{
		 return (Integer)sqlMapper.getSqlMap().queryForObject("countSearchId", user_id);
	}
	
	public void insertNetschUser(UserModel model) throws Exception{
		  sqlMapper.getSqlMap().insert("insertNetschUser", model);
	}
	
	public UserModel getUserInfo(String user_id) throws Exception{
		System.out.println("user_id = " + user_id);
		 return (UserModel)sqlMapper.getSqlMap().queryForObject("getUserInfo", user_id);
	}
	
	public void insertSchInfo(SchModel model) throws Exception{
		  sqlMapper.getSqlMap().insert("insertSchInfo", model);
	}
	
	public void insertProfSch(SchModel model) throws Exception{
		  sqlMapper.getSqlMap().insert("insertProfSch", model);
	}
	

	public ArrayList<SchModel> getProfSch(String user_id) throws Exception{
		 return (ArrayList<SchModel>)sqlMapper.getSqlMap().queryForList("getProfSch", user_id);
	}

	public void deleteProfSch(String user_id) throws Exception{
		  sqlMapper.getSqlMap().delete("deleteProfSch", user_id);
	}	

	public ArrayList<SchModel> getAvailDay(String user_id) throws Exception{
		 return (ArrayList<SchModel>)sqlMapper.getSqlMap().queryForList("getAvailDay", user_id);
	}
	
	public ArrayList<SchDetailModel> searchReserve(SchDetailModel model) throws Exception{
		 return (ArrayList<SchDetailModel>)sqlMapper.getSqlMap().queryForList("searchReserve", model);
	}

	public ArrayList<SchModel> getSchInfoByAvail(SchModel model) throws Exception{
		 return (ArrayList<SchModel>)sqlMapper.getSqlMap().queryForList("getSchInfoByAvail", model);
	}
		
	public void insertSchDetail(SchDetailModel model) throws Exception{
		  sqlMapper.getSqlMap().insert("insertSchDetail", model);
	}
	
	public ArrayList<SchDetailModel> listReservInfo(String user_id) throws Exception{
		 return (ArrayList<SchDetailModel>)sqlMapper.getSqlMap().queryForList("listReservInfo", user_id);
	}
	
	public ArrayList<SchDetailModel> checkReservInfo(String user_id) throws Exception{
		 return (ArrayList<SchDetailModel>)sqlMapper.getSqlMap().queryForList("checkReservInfo", user_id);
	}
}
