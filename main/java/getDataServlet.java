import entity.ProductsEntity;
import productdao.ProductDaoImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class getDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<ProductsEntity> list = null;
        resp.setContentType("text/html; charset=UTF-8");
        String result = "";

        ProductDaoImp prod = new ProductDaoImp();

        try {
            list = prod.getProductsForUser((String) session.getAttribute("userName"));
            result += ("<table>");
            for (ProductsEntity i:list){
                result += ("<tr><td class='strings'>" + i.getName()+": total cost = " + i.getCost() + "</td></tr>" + "\n");
            }
            result+=("</table>");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String del = req.getParameter("del");
        if(del != null){
            result="";
            try {
                for (ProductsEntity i:list) {
                    prod.deleteProduct(i);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        req.setAttribute("fullHistory",result);
        req.getRequestDispatcher("history.jsp").forward(req,resp);
    }
}
