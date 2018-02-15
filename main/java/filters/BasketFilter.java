package filters;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;

public class BasketFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        Logger logger = Logger.getLogger("BasketLog");
        HttpServletRequest httpReq = (HttpServletRequest) req;
        FileHandler fh;
        try {

            // This block configure the logger with handler and formatter
            logger.addHandler(FileSingleton.getInstance());

            // the following statement is used to log any messages
            if (req.getParameter("yaz")!=null)
                logger.info("was chosen language - " + req.getParameter("yaz"));

            if (req.getParameter("del3Eph")!=null)
                logger.info("was deleted 3Eph  ");

            if (req.getParameter("delDisk")!=null)
                logger.info("was deleted Disk ");

            if (req.getParameter("delHogw")!=null)
                logger.info("was deleted Hogw ");

            if (req.getParameter("delSkyrim")!=null)
                logger.info("was deleted Skyrim ");

            if (req.getParameter("num3Eph")!=null)
                logger.info("was added 3Eph ");

            if (req.getParameter("numDisk")!=null)
                logger.info("was added Disk ");

            if (req.getParameter("numHogw")!=null)
                logger.info("was added Hogw ");

            if (req.getParameter("numSkyrim")!=null)
                logger.info("was added Skyrim ");

            logger.info("from: " +  httpReq.getRequestURI() + " - transition");

        } catch (SecurityException e) {
            e.printStackTrace();
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
    }
}
