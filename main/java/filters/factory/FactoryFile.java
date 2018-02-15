package filters.factory;

import java.io.IOException;
import java.util.logging.FileHandler;

public class FactoryFile {
    private static FileHandler fh;

    static {
        try {
            fh = new FileHandler("/home/kruglik/tomcat/apache-tomcat-8.5.20/logs/myLogFile.log");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static FileHandler getFile() {
        return fh;
    }
}
