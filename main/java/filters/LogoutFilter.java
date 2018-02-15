package filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.logging.Logger;

public class LogoutFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        Logger logger = Logger.getLogger("LogoutLog");
        HttpServletRequest httpReq = (HttpServletRequest) req;
        try {

            // This block configure the logger with handler and formatter
            logger.addHandler(FileSingleton.getInstance());

            // the following statement is used to log any messages
            if (req.getParameter("yaz")!=null)
                logger.info("was chosen language - " + req.getParameter("yaz"));


            logger.info("from: " +  httpReq.getRequestURI() + " - transition");
            logger.info("user logout");

        } catch (SecurityException e) {
            e.printStackTrace();
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
