import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Databasemng {
    static String userspath = "C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt";
    static int lastId = 1;
    static public int signUp(String userName, String password,String email) throws IOException {

        int result;
        if (loginUser(userName, password) != 0){

            result = 0;
            return result;
        }
        BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt", true));
        int id = lastId;
        String data = id + "$$" + userName + "$$" + password + "$$" + email;
        writer.write(data);
        writer.newLine();
        writer.flush();
        writer.close();
        result = id;
        return result;
    }
    static public int loginUser(String userId, String password) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt"));

        String line = reader.readLine();
        int id = 0;
        while (line != null) {
            //1-user name-1234
            String[] elements = line.split("\\$\\$");
            if (elements[1].equals(userId)){
                if (elements[2].equals(password)){
                    id = lastId;
                }
            }
            line = reader.readLine();
            lastId += 1;
        }
        reader.close();
        return id;
    }
    static public String get(int id) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt"));
        String line = reader.readLine();
        String resultData = "";
        while (line != null) {
            String[] elements = line.split("\\$\\$");
            if (elements[0].equals(String.valueOf(id))){
                resultData = line;
            }
            line = reader.readLine();
        }
        reader.close();
        return resultData;
    }
    public static int update(int id, String data) throws IOException {
        List<String> lines = new ArrayList<>();
        boolean updated = false;
        int resultCode = 404;

        // Read the entire file into a list
        try (BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] elements = line.split("\\$\\$");
                if (elements[0].equals(String.valueOf(id))) {
                    String new_data = id + "$$" + elements[1] + "$$" + elements[2] + "$$" + data;
                    lines.add(new_data);
                    resultCode = 200;
                    updated = true;
                } else {
                    // Keep the original line
                    lines.add(line);
                }
            }
        }

        // Write the updated content back to the file
        if (updated){
            try (BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt"))) {
                for (String line : lines) {
                    writer.write(line);
                    writer.flush();
                    writer.newLine();
                }

            }
        }


        return resultCode;
    }
    static public int delete(int id) throws IOException {
        List<String> lines = new ArrayList<>();
        boolean updated = false;
        int resultCode = 404;

        // Read the entire file into a list
        try (BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] elements = line.split("\\$\\$");
                if (elements[0].equals(String.valueOf(id))) {
                    resultCode = 200;
                    updated = true;
                } else {
                    // Keep the original line
                    lines.add(line);
                }
            }
        }

        // Write the updated content back to the file
        if (updated){
            try (BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\SSZ\\Desktop\\ap project\\back\\src\\users.txt"))) {
                for (String line : lines) {
                    writer.write(line);
                    writer.flush();
                    writer.newLine();
                }

            }
        }


        return resultCode;

    }

}
