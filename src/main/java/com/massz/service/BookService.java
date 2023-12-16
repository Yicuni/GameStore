package com.massz.service;

import com.massz.bean.Game;
import com.massz.bean.User;
import com.massz.jdbc.DbcpDatasource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 服务层
 * Lee
 */
public class BookService {
    public boolean isUsernameAvailable(String username) {
        boolean result = false;
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "SELECT * FROM users WHERE username = ?";
        try {
            User existingUser = qr.query(sql, new BeanHandler<>(User.class), username);
            if (existingUser == null) {
                result = true;
            }
        } catch (SQLException e) {
            System.out.println("用户名是否可用：" + e);
        }
        return result;
    }

    public boolean registerUser(User user) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "INSERT INTO users (username, password, gender, email, userType, bio) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            int rowsAffected = qr.update(sql, user.getUsername(), user.getPassword(), user.getGender(),
                    user.getEmail(), user.getUserType(), user.getBio());
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("注册出现异常：" + e);
        }
        return false;
    }

    /**
     * 获取数据库中所有的图书信息
     *
     * @return 图书列表
     */
    public List<Game> getAllBooks() {
        List<Game> gameList = new ArrayList<>();
        //创建查询 获取数据库连接
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "select gameid,title,description,price,salenum,releasedate,type,filename,filepath from game order by gameid desc";
        //执行sql
        try {
            gameList = qr.query(sql, new BeanListHandler<>(Game.class));
        } catch (SQLException e) {
            System.out.println("获取所有的图书异常:" + e);
        }
        return gameList;
    }

    /**
     * 根据图书类型和图书名称获取 图书
     *
     * @param title
     * @param type
     * @return
     */
    public List<Game> getBooksByCond(String title, String type) {
        List<Game> gameList = new ArrayList<>();
        //创建查询 获取数据库连接
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        try {
            type = "全部".equals(type) ? null : type;
            //定义 要执行sql
            String sql = "select gameid,title,description,price,salenum,releasedate,type,filename,filepath from game where 1=1";
            if (title != null) {
                title = "%" + title + "%";
                sql += " and title like ? ";
            }
            if (type != null) {
                sql += " and type = ? ";
            }
            sql += " order by gameid desc ";
            //执行sql
            if (title != null && type != null) {
                gameList = qr.query(sql, new BeanListHandler<>(Game.class), title, type);
            } else if (type != null) {
                gameList = qr.query(sql, new BeanListHandler<>(Game.class), type);
            } else if (title != null) {
                gameList = qr.query(sql, new BeanListHandler<>(Game.class), title);
            }
        } catch (SQLException e) {
            System.out.println("获取所有的信息异常:" + e);
        }
        return gameList;
    }

    /**
     * 保存图书信息至数据库
     *
     * @return 图书列表
     */
    public boolean saveBookInfo(Game game) {
        //创建查询 获取数据库连接
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "insert into game(title,description,price,salenum,releasedate,type,filename,filepath) " +
                "values(?,?,?,?,?,?,?,?)";
        //执行sql
        try {
            int update = qr.update(sql, game.getTitle(), game.getDescription(), game.getPrice(), game.getSaleNum(), game.getReleaseDate(), game.getType(), game.getFilename(), game.getFilepath());
            return update > 0;
        } catch (SQLException e) {
            System.out.println("获取所有的图书信息异常:" + e);
        }
        return false;
    }
}
