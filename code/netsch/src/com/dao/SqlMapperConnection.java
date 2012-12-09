package com.dao;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapperConnection {
	SqlMapClient sqlMap ;
	public SqlMapperConnection(){
		try {
		   Reader reader = 
			   Resources.getResourceAsReader("SqlMapConfig.xml");
		       sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			System.out.println(e+"=> sqlMapper fail");
		}
	}
	
	public SqlMapClient getSqlMap() {
		return sqlMap;
	}
	
	

}

