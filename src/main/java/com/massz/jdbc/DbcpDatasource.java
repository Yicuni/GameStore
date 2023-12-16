package com.massz.jdbc;

import org.apache.commons.dbcp2.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DbcpDatasource {
    private static DataSource ds;

    static {
        try {
            InputStream is = DbcpDatasource.class.getClassLoader().getResourceAsStream("prop.properties");
            Properties prop = new Properties();
            prop.load(is);
            ds = BasicDataSourceFactory.createDataSource(prop);
        } catch (IOException e) {
            System.out.println("数据库连接池初始化失败1：" + e);
        } catch (Exception e) {
            System.out.println("数据库连接池初始化失败2" + e);
        }
    }

    public static DataSource getDs() {
        return ds;
    }
}
