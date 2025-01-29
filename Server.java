import javax.imageio.IIOException;
import java.*;
import java.io.IOException;
import java.net.*;
import java.net.ServerSocket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Server {
    public static void start() throws IIOException {
            System.out.println("Welcome to server!");
        ServerSocket socket = null;
        try {
            socket = new ServerSocket(3033);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        ExecutorService pool = Executors.newFixedThreadPool(10);
            while (true) {
                System.out.println("Waiting for client!!");
                try {
                    pool.execute(new Clihandler(socket.accept()));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }

    }
}
