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

public class GameService {
    // 根据玩家名称查询玩家信息
    public User getPlayerByName(String username) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "SELECT * FROM users WHERE username = ?";
        try {
            return qr.query(sql, new BeanHandler<>(User.class), username);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error getting player by name", e);
        }
    }

    /**
     * 根据用户名和密码 判断数据库中是否存在该用户
     *
     * @param username 用户名
     * @param password 密码
     * @return true:用户名、密码正确，false:用户名或密码不正确
     */
    public User checkPlayer(String username, String password, int userType) {
        //创建查询 获取数据库连接s
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "select * from users where username = ? and password = ? and userType = ?";
        //执行sql
        try {
            return qr.query(sql, new BeanHandler<>(User.class), username, password, userType);
        } catch (SQLException e) {
            System.out.println("校验用户是否存在异常：" + e);
        }
        return null;
    }

    /**
     * 根据用户名和密码 判断数据库中是否存在该用户
     *
     * @param username 用户名
     * @param password 密码
     * @return true:用户名、密码正确，false:用户名或密码不正确
     */
    public boolean checkUser(String username, String password) {
        boolean result = false;
        //创建查询 获取数据库连接s
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "select * from user where username = ? and password = ?";
        //执行sql
        try {
            User query = qr.query(sql, new BeanHandler<>(User.class), username, password);
            //如果查询不为空 说明 用户名密码正确 返回true
            if (query != null) {
                result = true;
            }
        } catch (SQLException e) {
            System.out.println("校验用户是否存在异常：" + e);
        }
        return result;
    }

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

    public boolean registerPlayer(User user) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "INSERT INTO users (username, password, gender, email, registrationTime, Bio) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            int rowsAffected = qr.update(sql, user.getUsername(), user.getPassword(), user.getGender(),
                    user.getEmail(), user.getRegistrationTime(), user.getBio());
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("注册出现异常：" + e);
        }
        return false;
    }

    public List<Game> getAllHotNewGames() {
        List<Game> hotNewgameList = new ArrayList<>();
        //创建查询 获取数据库连接
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "select * from game where saleNum between 2000000 and 8000000 AND DATEDIFF(CURRENT_DATE, ReleaseDate) < 14 order by GameID desc";
        //执行sql
        try {
            hotNewgameList = qr.query(sql, new BeanListHandler<>(Game.class));
        } catch (SQLException e) {
            System.out.println("获取热销新品信息异常:" + e);
        }
        return hotNewgameList;
    }

    public List<Game> getAllHotSaleGames() {
        List<Game> hotSalegameList = new ArrayList<>();
        //创建查询 获取数据库连接
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "select * from game where saleNum > 8000000 order by GameID desc";
        //执行sql
        try {
            hotSalegameList = qr.query(sql, new BeanListHandler<>(Game.class));
        } catch (SQLException e) {
            System.out.println("获取热销信息异常:" + e);
        }
        return hotSalegameList;
    }

    public List<Game> getAllUpcomingGames() {
        List<Game> getupcominggamesList = new ArrayList<>();
        //创建查询 获取数据库连接
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "select * from game where releasedate > current_date order by GameID desc";
        //执行sql
        try {
            getupcominggamesList = qr.query(sql, new BeanListHandler<>(Game.class));
        } catch (SQLException e) {
            System.out.println("获取将将推出信息异常:" + e);
        }
        return getupcominggamesList;
    }

    public List<Game> getAllGames() {
        List<Game> allGameList = new ArrayList<>();
        //创建查询 获取数据库连接
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        //定义 要执行sql
        String sql = "SELECT * FROM Game order by price desc";
        //执行sql
        try {
            allGameList = qr.query(sql, new BeanListHandler<>(Game.class));
        } catch (SQLException e) {
            System.out.println("获取所有的图书信息异常:" + e);
        }
        return allGameList;
    }

    public boolean deleteGame(Game game) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "DELETE FROM game WHERE gameid = ?";
        try {
            int rowsAffected = qr.update(sql, game.getGameId());
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("删除出现异常" + e);
        }
        return true;
    }

    public Game getGameById(int gameId) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "SELECT * FROM game WHERE gameId = ?";
        try {
            return qr.query(sql, new BeanHandler<>(Game.class), gameId);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error getting Game by ID", e);
        }
    }

    public boolean updateGame(Game game) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "UPDATE game SET title = ?, description = ?, price = ?, saleNum = ?, releaseDate = ?, type = ? WHERE gameId = ?";
        try {
            int rowsAffected = qr.update(sql, game.getTitle(), game.getDescription(), game.getPrice(), game.getSaleNum(),
                    game.getReleaseDate(), game.getType(), game.getGameId());
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public List<Game> getOwnedGames(int userId) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        List<Game> ownedGames = null;

        String sql = "SELECT g.* FROM Game g INNER JOIN Library l ON g.GameID = l.GameID WHERE l.PlayerID = ?";
        try {
            ownedGames = qr.query(sql, new BeanListHandler<>(Game.class), userId);
        } catch (SQLException e) {
            e.printStackTrace();
            // 处理异常
        }

        return ownedGames;
    }

    // 添加游戏到购物车
    public boolean addToLibrary(int userId, int gameId) {
        QueryRunner qr = new QueryRunner(DbcpDatasource.getDs());
        String sql = "INSERT INTO Library (playerId, gameId) VALUES (?, ?)";
        try {
            int rows = qr.update(sql, userId, gameId);
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("处理购买异常信息：" + e);
        }
        return false;
    }

}
