package persistence;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory{ 
    private static final String URL_BANCO = "jdbc:postgresql://localhost:5432/PessoaFisica";
    private static final String DRIVER_CLASS = "org.postgresql.Driver";
    private static final String USER = "postgres";
    private static final String PASS = "1234";
    
    private ConnectionFactory(){}
    
    private static Connection instanceConnection;
    
    public static Connection getConnection(){
        if(instanceConnection == null){
            try{
                    Class.forName(DRIVER_CLASS);
                    instanceConnection = DriverManager.getConnection(URL_BANCO, USER, PASS);
                } catch (ClassNotFoundException ex) {
                    ex.printStackTrace();
                } catch (java.sql.SQLException ex) {
                    throw new RuntimeException(ex);
            }
                
        }
        return instanceConnection;
    }
}
