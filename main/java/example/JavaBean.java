package example;

import java.util.ResourceBundle;

public class JavaBean {
    private String img;
    private String gameName;
    private String gameInf;
    private String card;
    private String cost;
    private String buy;

    public JavaBean() {
        img = "";
        gameName = "";
        gameInf = "";
        card = "";
        cost = "";
        buy = "";
    }

    public String getBuy() {
        return buy;
    }

    public void setBuy(String buy) {
        this.buy = buy;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameInf() {
        return gameInf;
    }

    public void setGameInf(String gameInf) {
        this.gameInf = gameInf;
    }


    public String getCard() {
        card =  "<table><tr><td style=\"cursor: pointer\"onclick='location.href=\"/Servlet_1\"' id=\"prodSt\" background=\"" + img +"\"></td>\n" +
                "                <td>\n" +
                "                    <div id=text>    \n" +
                "                        <h2 style=\"cursor: pointer\"onclick='location.href=\"/Servlet_1\"'>" + gameName +"</h2><b>" + cost + "</b><p>" + gameInf +"</p>\n" +
                "                        </div>\n" +
                "                </td>\n" +
                "                <td width=10px>\n" +
                "                    <form action=\"Basket.jsp\" ><input  id = \"buyList\" name=\"" + buy + "\" type = \"submit\" value=\" \"></form> \n" +
                "                </td>\n" +
                "                <td width=30px></td></tr></table>";
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }



}

