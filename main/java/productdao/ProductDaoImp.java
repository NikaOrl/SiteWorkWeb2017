package productdao;

import dao.ProductDao;
import entity.CommentsEntity;
import entity.ProductsEntity;
import entity.UsersEntity;
import org.hibernate.Query;
import org.hibernate.Session;

import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import java.sql.SQLException;
import java.util.List;

import static factory.Factory.getSession;

public class ProductDaoImp implements ProductDao {

    public ProductDaoImp(){}

    @PrePersist
    void prePersist(Object object, Session session) {
        System.out.println("111");
        try{
            System.out.println("222");
            session.beginTransaction();
            session.persist(object);
            session.getTransaction().commit();
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (session!=null && session.isOpen()) session.close();
        }
    }

    public void addProduct(ProductsEntity prod) throws SQLException {
        System.out.println("000");
        Session session = getSession();
        System.out.println("001");
        prePersist(prod, session);
        System.out.println("002");
        System.out.println("Success");
    }

    public void addUser(UsersEntity user) throws SQLException {
        Session session = getSession();
        prePersist(user, session);
        System.out.println("Success");
    }

    public void addHist(CommentsEntity hist) throws SQLException {
        Session session = getSession();
        prePersist(hist, session);
        System.out.println("Success");
    }

    @PreRemove
    void preRemove(Object object, Session session) {
        try{
            session.beginTransaction();
            session.delete(object);
            session.getTransaction().commit();

        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (session!=null && session.isOpen()) session.close();
        }
    }

    public void deleteProduct(ProductsEntity prod) throws SQLException {
        Session session = getSession();
        preRemove(prod, session);
        System.out.println("Success");
    }

    public void deleteUser(UsersEntity user) throws SQLException {
        Session session = getSession();
        preRemove(user, session);
        System.out.println("Success");
    }

    public void deleteHist(CommentsEntity hist) throws SQLException {
        Session session = getSession();
        preRemove(hist, session);
        System.out.println("Success");
    }

    public ProductsEntity getProduct(int id) throws SQLException {
        Session session = getSession();
        ProductsEntity result = null;
        try {
            result = session.get(ProductsEntity.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) session.close();
        }
        System.out.println("Success");
        return result;
    }


    public UsersEntity getUser(int id) throws SQLException {
        Session session = getSession();
        UsersEntity result = null;
        try {
            result = session.get(UsersEntity.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) session.close();
        }
        System.out.println("Success");
        return result;
    }

    public CommentsEntity getHist(int id) throws SQLException {
        Session session = getSession();
        CommentsEntity result = null;
        try {
            result = session.get(CommentsEntity.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) session.close();
        }

        System.out.println("Success");
        System.out.println(result);
        return result;
    }

    public List<ProductsEntity> getProductsForUser(String userName) throws SQLException {
        Session session = getSession();
        Query query = session.createQuery("from ProductsEntity where userName = :paramName");
        query.setParameter("paramName", userName);
        List<ProductsEntity> list = query.list();
        System.out.println("success");
        return list;
    }
    public List<CommentsEntity> getCommentsForUser(String userName) throws SQLException {
        Session session = getSession();
        Query query = session.createQuery("from CommentsEntity");
        List<CommentsEntity> list = query.list();
        System.out.println("success");
        return list;
    }
}

