package filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Enumeration;
import java.util.logging.FileHandler;
import java.util.logging.Logger;

public class OrderMapFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        Logger logger = Logger.getLogger("OrderLog");
        HttpServletRequest httpReq = (HttpServletRequest) req;
        FileHandler fh;
        try {

            // This block configure the logger with handler and formatter
            logger.addHandler(FileSingleton.getInstance());

            // the following statement is used to log any messages
            if (req.getParameter("yaz")!=null)
                logger.info("was chosen language - " + req.getParameter("yaz"));

            Enumeration<String> names = httpReq.getParameterNames();
            logger.info(names.toString());
            logger.info("our shops");
            logger.info("from: " +  httpReq.getRequestURI() + " - transition");

        } catch (SecurityException e) {
            e.printStackTrace();
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
