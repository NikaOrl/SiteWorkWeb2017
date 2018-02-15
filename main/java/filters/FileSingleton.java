package filters;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.FileHandler;
import java.util.logging.Formatter;
import java.util.logging.LogRecord;

public class FileSingleton {
    private static FileHandler ourInstance;
    static {
        try {
            ourInstance = new FileHandler("C:/Users/User/IdeaProjects/Servlet4 — копия (2)/src/tomcat/apache-tomcat-8.5.20/logs/myLog.log");
            Formatter formatter = new Formatter() {
                @Override
                public String format(LogRecord record) {
                    DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy, HH:mm:ss");
                    Date date = new Date();
                    return record.getLevel() + ": " + dateFormat.format(date) + ", " + record.getLoggerName() + ": " + record.getMessage() + "\n";
                }
            };
            ourInstance.setFormatter(formatter);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static FileHandler getInstance() {
        return ourInstance;
    }

    private FileSingleton() {
    }
}
