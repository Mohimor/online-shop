import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SQLDatabaseManager {
    private static final String URL = "jdbc:mysql://localhost:3306/products";
    private static final String USER = "root";
    private static final String PASSWORD = "mohimor0901";

    // Method to establish a connection to the database
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Method to get all products from each category
    public static String[][] getAllProducts() throws SQLException {
        String[][] productsArray = new String[4][4];
        String[] categories = {"mobiles", "laptops", "headphones", "tablets"};

        for (int i = 0; i < categories.length; i++) {
            List<String> products = getProductsByCategory(categories[i]);
            for (int j = 0; j < products.size(); j++) {
                productsArray[i][j] = products.get(j);
            }
        }

        return productsArray;
    }

    // Method to get products by category
    private static List<String> getProductsByCategory(String category) throws SQLException {
        List<String> products = new ArrayList<>();
        String query = "SELECT * FROM " + category;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                String product = resultSet.getInt("id") + "$$" +
                        resultSet.getString("name") + "$$" +
                        resultSet.getDouble("price") + "$$" +
                        resultSet.getString("description") + "$$" +
                        resultSet.getString("image_url");
                products.add(product);
            }
        }
        return products;
    }
}
