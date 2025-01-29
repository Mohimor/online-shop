import java.io.IOException;
import java.util.Map;

public class Commandmng {
    public void getCommand(Map<String, String> command, Clihandler cl) throws IOException {

        switch (command.get("method")){
            case "logOut":  logOut(cl);
                break;
            case "signUp" :  signUp(command.get("userName"), command.get("password"),command.get("email"), cl);
                break;
            case "update" :  update(command.get("data"), cl);
                break;
            case "get" :  get(cl);
                break;
            case "delete" :  delete(cl);
                break;
        }
    }


    public void logOut(Clihandler cl) throws IOException {
        cl.id = 0;
        String result =  "{"
                + "status-code:" +  "200"
                + "\"method\":\"" +  "\"logOut\""
                + "}";
        cl.sendJsonResponse(result);
        cl.closeConnection();
    }

    public static void signUp(String userName, String password,String email, Clihandler cl) throws IOException {
        int id = Databasemng.signUp(userName, password,email);
        int status_code = 404;
        if (id != 0){
            status_code = 200;
        }
        String result =  "{"
                + "\"status-code\":\"" + status_code + "\","
                + "\"method\":\"" +  "\"singUp\""
                + "}";
        cl.sendJsonResponse(result);
        if (status_code==404){
            cl.dos.flush();
            cl.dos.close();
            cl.dis.close();
            cl.socket.close();
        }

    }

    public void get(Clihandler cl) throws IOException {

        String data = Databasemng.get(cl.id);
        int status_code = 404;
        if (data != null){
            status_code = 200;
        }
        String result =  "{"
                + "\"data\":\"" + data + "\","
                + "\"status-code\":\"" + status_code + "\","
                + "\"method\":\"" +  "\"get\""
                + "}";
        cl.sendJsonResponse(result);
    }


    public void update(String data, Clihandler cl) throws IOException{

        int status_code = Databasemng.update(cl.id, data);
        String result =  "{"
                + "\"status-code\":\"" + status_code + "\","
                +  "\"method\":\"" +  "\"update\""
                + "}";
        cl.sendJsonResponse(result);
    }

    public void delete(Clihandler cl) throws IOException {

        int status_code = Databasemng.delete(cl.id);
        String result =  "{"
                + "\"status-code\":\"" + status_code + "\","
                + "\"method\":\"" +  "\"delete\""
                + "}";
        cl.sendJsonResponse(result);
    }
}
