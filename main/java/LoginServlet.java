import entity.CommentsEntity;
import productdao.ProductDaoImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by root on 01.10.17.
 */
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ProductDaoImp prod = new ProductDaoImp();
        CommentsEntity newComm = new CommentsEntity();
        newComm.setUser((String) session.getAttribute("userName"));
        newComm.setComments(req.getParameter("params"));
        try {
            prod.addHist(newComm);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("success");
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("userName",req.getUserPrincipal().getName());
        List<CommentsEntity> list = null;

        ProductDaoImp prod = new ProductDaoImp();
        String del = req.getParameter("del");
        String histList = "";
        try {
            list = prod.getCommentsForUser((String) session.getAttribute("userName"));

            histList += ("<table>");
            for (CommentsEntity i:list){
                histList += ("<tr><td class='strings'>" + i.getUser() + " : " + i.getComments() + "</td></tr>" + "\n");
            }
            histList +=("</table>");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        session.setAttribute("fullCommHist",histList);
        req.getRequestDispatcher("user.jsp").forward(req,resp);

    }
}

