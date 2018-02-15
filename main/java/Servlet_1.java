/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;

/**
 *
 * @author XML
 */
public class Servlet_1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String lang = request.getParameter("yaz");
        if(lang == null){
            lang = "ru";
        }
        Locale locale = new Locale(lang, "");
        String open = getInitParameter("bm");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        String str1="", str2="", str3="", par ="";
        if(new String(open).equals("1") == true){
            str1 = "block";
            str2 = "none";
            str3 = "none";
            par = "opisKnop";
        }
        if(new String(open).equals("2") == true){
            str1 = "none";
            str2 = "block";
            str3 = "none";
            par = "infKnop";
        }
        if(new String(open).equals("3") == true){
            str1 = "none";
            str2 = "none";
            str3 = "block";
            par = "OtzKnop";
        }
        session.setAttribute("defaultParam", par);
        ResourceBundle bundle = ResourceBundle.getBundle("loc", locale); //!!

        String dropDownList="";
        if(new String(lang).equals("en") == true){
            dropDownList =
                    "                            <option value=\"en\">" + bundle.getString("en") + "</option>\n" +
                            "                            <option value=\"ru\">" + bundle.getString("ru") + "</option>\n" +
                            "                            <option value=\"de\">" + bundle.getString("de") + "</option>\n";
        }
        if(new String(lang).equals("ru") == true){
            dropDownList =
                    "                            <option value=\"ru\">" + bundle.getString("ru") + "</option>\n" +
                            "                            <option value=\"en\">" + bundle.getString("en") + "</option>\n" +
                            "                            <option value=\"de\">" + bundle.getString("de") + "</option>\n";
        }
        if(new String(lang).equals("de") == true){
            dropDownList =
                    "                            <option value=\"de\">" + bundle.getString("de") + "</option>\n" +
                            "                            <option value=\"en\">" + bundle.getString("en") + "</option>\n" +
                            "                            <option value=\"ru\">" + bundle.getString("ru") + "</option>\n";

        }
        out.println("<html>\n" +
                "\n" +
                "    <head>\n" +
                "        <meta charset=\"utf-8\">\n" +
                "        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "        <title>Ролёвочкиииии</title>\n" +
                "        <meta name=\"description\" content=\"Интерактивное руководство по началу работы в Brackets.\">\n" +
                "        <link rel=\"stylesheet\" href=\"main.css\">\n" +
                "        <script>\n" +
                "            /*function show(n)\n" +
                "            {\n" +
                "                document.getElementById(\"div\" + n).style.display = \"block\";\n" +
                "                for(int y = 1; y<4; y++)\n" +
                "                    if(y != n)\n" +
                "                        document.getElementById(\"div\" + y).style.display = \"none\";\n" +
                "              \n" +
                "            }*/\n" +
                "            function show(n, n1, n2){\n" +
                "                document.getElementById(\"div\" + n).style.display = \"block\";\n" +
                "                document.getElementById(\"div\" + n1).style.display = \"none\";\n" +
                "                document.getElementById(\"div\" + n2).style.display = \"none\";\n" +
                "            }\n" +
                "        </script>\n" +
                "        <style>\n" +
                "            * {\n" +
                "                margin: 0px;\n" +
                "                padding: 0px;\n" +
                "                vertical-align: top;\n" +
                "            }\n" +
                "            \n" +
                "           @font-face {\n" +
                "               font-family: 'MyFont1';\n" +
                "               src: url('/fonts/CeremoniousThree.ttf') format('truetype');\n" +
                "            }\n" +
                "            \n" +
                "            @font-face {\n" +
                "               font-family: 'MyFont2';\n" +
                "               src: url('/fonts/Scriptorama.ttf') format('truetype');\n" +
                "            }\n" +
                "            \n" +
                "            @font-face {\n" +
                "               font-family: 'MyFont3';\n" +
                "               src: url('/fonts/BickhamScriptThree.ttf') format('truetype');\n" +
                "            }\n" +
                "            \n" +
                "            @font-face {\n" +
                "               font-family: 'MyFont4';\n" +
                "               src: url('/fonts/HeatherScriptOne.ttf') format('truetype');\n" +
                "            }\n" +
                "            \n" +
                "            @font-face {\n" +
                "               font-family: 'MyFont5';\n" +
                "               src: url('/fonts/CeremoniousTwo.ttf') format('truetype');\n" +
                "            }\n" +
                "          \n" +
                "            @font-face {\n" +
                "               font-family: 'MyFont6';\n" +
                "               src: url('/fonts/Morpheus.ttf') format('truetype');\n" +
                "            }\n" +
                "            \n" +
                "            p{ \n" +
                "                padding-left: 30px;\n" +
                "                padding-right: 30px;\n" +
                "            }\n" +
                "            h1{\n" +
                "                color: #9f8344;\n" +
                "                font-family: MyFont6; \n" +
                "                font-size: 400%;\n" +
                "                font-weight: normal;\n" +
                "                text-shadow: #999999 5px 5px 10px;\n" +
                "            }\n" +
                "              \n" +
                "            h2 {\n" +
                "                text-align: right;\n" +
                "                font-family: MyFont4; \n" +
                "                font-size: 200%;\n" +
                "                text-shadow: #8d8989 5px 5px 10px;\n" +
                "            }\n" +
                "            h3{\n" +
                "                font-family: MyFont2; \n" +
                "                text-align: center;\n" +
                "                padding-top: 20px;\n" +
                "                font-size: 200%;\n" +
                "            }\n" +
                "            td\n" +
                "            {\n" +
                "                \n" +
                "                border: px solid #2e0000;\n" +
                "                background-color: rgba(255, 255, 255, 0);\n" +
                "            }\n" +
                "            body\n" +
                "            {\n" +
                "                background: url(/imgs/var2.png) repeat-x;\n" +
                "                background-size: cover;\n" +
                "                background-size: 400px;\n" +
                "                background-position: bottom;\n" +
                "                background-color:cornsilk\n" +
                "            }\n" +
                "            table\n" +
                "            {\n" +
                "                padding-bottom: 10px;\n" +
                "                width: 800px;\n" +
                "                height: 900px;\n" +
                "                margin: auto;\n" +
                "            }\n" +
                "            #content\n" +
                "            {\n" +
                "                background: url(/imgs/perg.png) no-repeat;\n" +
                "                background-size: 100%;\n" +
                "                \n" +
                "            }\n" +
                "            #cnop\n" +
                "            {\n" +
                "                cursor: pointer;\n" +
                "                background: url(/imgs/zakl.png) no-repeat;\n" +
                "                background-size: 100px 60px;\n" +
                "                border: 0px;\n" +
                "                width: 100px;\n" +
                "                height: 60px;\n" +
                "                vertical-align: bottom;\n" +
                "                color: #d4bf9c;\n" +
                "                font-style: italic;\n" +
                "                font-weight: bold;\n" +
                "                font-family: MyFont2;\n" +
                "                font-size: 110%;\n" +
                "            }\n" +
                "            #cnop:active{\n" +
                "                 background: url(/imgs/zakl-done.png) no-repeat;\n" +
                "                background-size: 100px 60px;\n" +
                "                \n" +
                "            }\n" +
                "            \n" +
                "            #cnop:focus{\n" +
                "                outline: none;\n" +
                "            }\n" +
                "            #buy\n" +
                "            {\n" +
                "                cursor: pointer;\n" +
                "                background: url(/imgs/zakaz.png) no-repeat;\n" +
                "                background-size: 300px 50px;\n" +
                "                border: 0px;\n" +
                "                width: 300px;\n" +
                "                height: 50px;\n" +
                "                vertical-align: bottom;\n" +
                "                color: #c6a978;                \n" +
                "                font-weight: bold;\n" +
                "                font-family: MyFont1;\n" +
                "                font-size: 230%;\n" +
                "            }\n" +
                "            input{\n" +
                "                /*color: gray;*/\n" +
                "               /* background-color: gold;*/\n" +
                "                \n" +
                "               /* border: 0px;*/\n" +
                "            }\n" +
                "            #footer{\n" +
                "                text-align: right;\n" +
                "                vertical-align: bottom;\n" +
                "                color: #d8d8d8;\n" +
                "                font-style: italic;\n" +
                "                \n" +
                "            }\n" +
                "            #napravoblet{\n" +
                "                text-align: right;\n" +
                "            }\n" +
                "            \n" +
                "            #logo\n" +
                "            {\n" +
                "                padding-top: 20px;\n" +
                "                padding-bottom: 30px;\n" +
                "            }\n" +
                "            \n" +
                "            #yazik{\n" +
                "                position: absolute;\n" +
                "                top: 0;\n" +
                "                right: 0;\n" +
                "            }\n" +
                "           #langKn\n" +
                "            {\n" +
                "                cursor: pointer;\n" +
                "                background: url(/imgs/ChLang.png) no-repeat;\n" +
                "                background-size: 130px 40px;\n" +
                "                border: 0px;\n" +
                "                width: 130px;\n" +
                "                height: 40px;\n" +
                "                vertical-align: bottom;\n" +
                "                text-align: center;\n" +
                "                color: #d4b98b;\n" +
                "                font-style: italic;\n" +
                "                font-weight: bold;\n" +
                "                font-size: 70%;\n" +
                "           }\n" +
                "           #yazi\n" +
                "           {\n" +
                "                background-color: #fcf7d3;\n" +
                "           }\n" +
                "        </style>\n" +
                "    </head>\n" +
                "    <body>\n" +
                "        <div id=\"yazik\">\n" +
                "           <form>" +
                "            <select name=\"yaz\" id=\"yazi\">\n" + dropDownList +
                "            </select>\n" +
                "            <button id=\"langKn\" type = \"submet\">" + bundle.getString("lang") + "</button>" +
                "          </form>" +
                "        </div>\n" +
                "        <table>\n" +
                "            <tr>\n" +
                "                <td id=\"napravoblet\" colspan=4>\n" +
                "                    <h1 align=\"center\">" + bundle.getString("rol") + "</h1>\n" +
                "                </td>                \n" +
                "            </tr>\n" +
                "            <tr>\n" +
                "                <td width=\"40%\">\n" +
                "                    <h2>" + bundle.getString("game") + "</h2>\n" +
                "                </td>\n" +
                "                <td id=\"footer\">\n" +
                "                    <input id = \"cnop\" type=\"button\" value=\"" + bundle.getString("opisKnop") + "\" onclick=\"show(1, 2, 3)\" >\n" +
                "                    <input id = \"cnop\" type=\"button\" value=\"" + bundle.getString("infKnop") + "\" onclick=\"show(2, 1, 3)\">\n" +
                "                    <input id = \"cnop\" type=\"button\" value=\"" + bundle.getString("OtzKnop") + "\" onclick=\"show(3, 2, 1)\">\n" +
                "                </td>\n" +
                "            </tr>\n" +
                "            <tr height=\"100%\">\n" +
                "                <td>\n" +
                "                    <img src=\"/imgs/A-M.png\" width=\"300\" id = \"logo\">\n" +
                "                    <input id = \"buy\" type=\"button\" value=\""+ bundle.getString("zapis") + "\">\n" +
                "                </td>\n" +
                "                <td colspan=3 id=\"content\">\n" +
                "                    <div id=\"div1\" style=\"display: " + str1 + "\"><h3>" + bundle.getString("opisKnop") + "</h3><p>" + bundle.getString("opis") + "</p></div>\n" +
                "                    <div id=\"div2\" style=\"display: " + str2 + "\"><h3>" + bundle.getString("infKnop") + "</h3><p>" + bundle.getString("inf") + "</p></div>\n" +
                "                    <div id=\"div3\" style=\"display: " + str3 + "\"><h3>" + bundle.getString("OtzKnop") + "</h3></div> \n" +
                "                </td>\n" +
                "            </tr>\n" +
                "            <tr>\n" +
                "                <td id=\"footer\" colspan=4><p>"+ bundle.getString("footer") + "</p></td>\n" +
                "            </tr>\n" +
                "        </table>\n" +
                "    </body>\n" +
                "</html>");
    }

}
