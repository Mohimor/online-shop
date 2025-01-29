import java.io.IOException;
import java.sql.SQLException;

public class Product {


    public static void getAllProducts(Clihandler cl) throws IOException {
        try {
            String[][] productsArray = SQLDatabaseManager.getAllProducts();
            String jsonResponse = convertArrayToJson(productsArray);
            cl.sendJsonResponse(jsonResponse);
        } catch (SQLException e) {
            e.printStackTrace();
            cl.sendJsonResponse("{\"status-code\":\"500\",\"message\":\"Internal Server Error\"}");
        }
    }

    private static String convertArrayToJson(String[][] productsArray) {
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("[");
        for (int i = 0; i < productsArray.length; i++) {
            jsonBuilder.append("[");
            for (int j = 0; j < productsArray[i].length; j++) {
                jsonBuilder.append("\"").append(productsArray[i][j]).append("\",");
            }
            if (jsonBuilder.charAt(jsonBuilder.length() - 1) == ',') {
                jsonBuilder.setLength(jsonBuilder.length() - 1); // Remove the last comma
            }
            jsonBuilder.append("],");
        }
        if (jsonBuilder.charAt(jsonBuilder.length() - 1) == ',') {
            jsonBuilder.setLength(jsonBuilder.length() - 1); // Remove the last comma
        }
        jsonBuilder.append("]");
        return jsonBuilder.toString();
    }
}
