package dao;

import entity.CommentsEntity;
import entity.ProductsEntity;
import entity.UsersEntity;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    public void addProduct(ProductsEntity prod) throws SQLException;
    public void addUser(UsersEntity usr) throws SQLException;
    public void addHist(CommentsEntity hist) throws SQLException;
    public void deleteProduct(ProductsEntity prod) throws SQLException;
    public void deleteUser(UsersEntity usr) throws SQLException;
    public void deleteHist(CommentsEntity hist) throws SQLException;
    public ProductsEntity getProduct(int id) throws SQLException;
    public UsersEntity getUser(int id) throws SQLException;
    public CommentsEntity getHist(int id) throws SQLException;
    public List<ProductsEntity> getProductsForUser(String userName) throws SQLException;
    public List<CommentsEntity> getCommentsForUser(String userName) throws SQLException;
}
