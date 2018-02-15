import entity.ProductsEntity;
import productdao.ProductDaoImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;


public class DoOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String order;
        request.setCharacterEncoding("UTF-8");
        Date date = new Date();
        HttpSession session = request.getSession();
        order = date.toString() + ": ";
        if ((Long)session.getAttribute("num3Eph") != 0)
            order+="3Eph - " + session.getAttribute("num3Eph")+";";
        if ((Long)session.getAttribute("numDisk") != 0)
            order+="Disk - " + session.getAttribute("numDisk")+";";
        if ((Long)session.getAttribute("numHogw") != 0)
            order+="Hogw - " + session.getAttribute("numHogw") + ";";
        if ((Long)session.getAttribute("numSkyrim") != 0)
            order+="Skyrim - " + session.getAttribute("numSkyrim") + ";";

        order += request.getParameter("address");
        System.out.println(order);
        ProductDaoImp prod = new ProductDaoImp();
        ProductsEntity newProd = new ProductsEntity();
        newProd.setName(order);
        newProd.setUserName((String) session.getAttribute("userName"));
        newProd.setCost((Long) session.getAttribute("total_cost"));
//        try {
        try {
            prod.addProduct(newProd);
        } catch (SQLException e) {
            System.out.println("888");
            e.printStackTrace();
        }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        session.setAttribute("total_cost", new Long(0));
        session.setAttribute("num3Eph",new Long(0));
        session.setAttribute("numDisk",new Long(0));
        session.setAttribute("numHogw",new Long(0));
        session.setAttribute("numSkyrim",new Long(0));
        response.setContentType("text/html; charset=UTF-8");
        request.setAttribute("succOrder", order);
        request.getRequestDispatcher("/success_order.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
