import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;

public class Clihandler extends Thread {
    int id = 0;
    private volatile boolean isRunning = true;
    Socket socket;
    DataOutputStream dos;
    DataInputStream dis;


    public Clihandler(Socket socket) throws IOException {
        this.socket = socket;
        dos = new DataOutputStream(socket.getOutputStream());
        dis = new DataInputStream((socket.getInputStream()));
        System.out.println("connected to server");
    }

    public void sendJsonResponse(String jsonResponse) throws IOException {
        dos.write(jsonResponse.getBytes());
        dos.flush();
    }



    public Map<String, String> readJsonRequest() throws IOException{
        StringBuilder sb = new StringBuilder();
        int index = dis.read();
        while(index != 48){
            sb.append((char)index);
            index = dis.read();
        }
        String jsonRequest = sb.toString();
        Map<String, String> data = new HashMap<>();


        jsonRequest = jsonRequest.replace("{", "").replace("}", "");
        String[] keyValuePairs = jsonRequest.split(",");
        for (String pair : keyValuePairs) {
            String[] keyValue = pair.split(":");
            String key = keyValue[0].replace("\"", "").trim();
            String value = keyValue[1].replace("\"", "").trim();

            data.put(key, value);
        }
        return data;
    }

    @Override
    public void run() {
        super.run();
        Map<String, String> command;
        try {
            while (isRunning) {
                command = readJsonRequest();
                Commandmng commandManager = new Commandmng();
                System.out.println("method ->" + command.get("method"));
                if (this.id == 0) {
                    this.id = Authenticator.authenticate(command, this);
                    System.out.println("id after sign up and login" + this.id);
                }else{
                    commandManager.getCommand(command, this);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeConnection();
        }
    }

    public void closeConnection() {
        try {
            if (dis != null) dis.close();
            if (dos != null) dos.close();
            if (socket != null && !socket.isClosed()) socket.close();
            isRunning = false;
        } catch (Exception e) {
            System.out.println("closing connection: " + e.getMessage());
        }
    }

}
