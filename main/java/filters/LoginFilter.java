package filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;

public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        Logger logger = Logger.getLogger("LoginLog");
        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpSession session = ((HttpServletRequest) req).getSession();
        FileHandler fh;
        try {
            logger.addHandler(FileSingleton.getInstance());

            // the following statement is used to log any messages
            if (req.getParameter("yaz")!=null)
                logger.info("was chosen language - " + req.getParameter("yaz"));

            logger.info("from: " +  httpReq.getRequestURI() + " - transition");
            logger.info(session.getAttribute("userName") + " login");

        } catch (SecurityException e) {
            e.printStackTrace();
        }
        chain.doFilter(req, resp);
        String comment = req.getParameter("params");
        if (comment != null) {
            String newString = new String(comment);
            logger.info("User " + httpReq.getUserPrincipal().getName() + " commented product " + newString);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
