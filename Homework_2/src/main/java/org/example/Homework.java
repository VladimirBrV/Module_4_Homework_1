package org.example;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.stream.Collectors;

public class Homework {
    public static void main(String[] args) throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String password = "Vovik3910VV!!";
        try (Connection connection = DriverManager.getConnection(url, user, password);
            Statement statement = connection.createStatement();){
//        boolean execute = statement.execute(readSQLFile("Create_table.sql"));
        statement.executeUpdate(updateUsers("UpdateUser.sql"));

    }
}
    public static String readSQLFile (String file) {
        InputStream resource = Homework.class.getClassLoader().getResourceAsStream(file);
        return new BufferedReader(new InputStreamReader(resource)).lines().collect(Collectors.joining(""));
    }
    public static String updateUsers (String file) {
        InputStream resource = Homework.class.getClassLoader().getResourceAsStream(file);
        return new BufferedReader(new InputStreamReader(resource)).lines().collect(Collectors.joining( ""));


    }

}