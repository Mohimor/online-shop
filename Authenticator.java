import java.io.IOException;
import java.util.Map;
public class Authenticator {

    public static int authenticate(Map<String, String> command, Clihandler cl) throws IOException {
        int id = 0;
        if(command.get("method").equals("login")){
            id = Databasemng.loginUser(command.get("userName"), command.get("password"));

        }else if(command.get("method").equals("signUp")){
            id = Databasemng.signUp(command.get("userName"), command.get("password") , command.get("email") );
        }
        if (id!=0){
            cl.dos.writeBytes("authenticated");
            cl.dos.flush();
        }else{
            cl.dos.writeBytes("not authenticated");
            cl.dos.flush();
        }
        return id;
    }

}
