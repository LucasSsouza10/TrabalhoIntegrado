/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author lucca
 */
public class ConexaoDB {
    //Objeto que guarda informacoes da conexao com o SGBD.
    private Connection myConnection;

    //Objeto usado para enviar comandos SQL no SGBD
    private Statement st;

    // Construtor
    public ConexaoDB(){
        try{
            //Cria uma instancia de conexao com o SGBD MySQL, usando
            //   o driver apropriado
            Class.forName("org.postgresql.Driver").newInstance();
            myConnection = DriverManager.getConnection("jdbc:postgresql:" +
                    "//localhost/PessoaFisica?user=postgres&password=1234");

            //Cria um comando (statement) vinculado aa conexao
            st = myConnection.createStatement();

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    
    
    public boolean insere(String sql){
        try {
            // Executa do comando SQL dado como parametro
            st.execute(sql);
            return true;
        }
        // Trata uma possivel excecao que possa ocorrer
        catch(SQLException e){
            return false;
        }
    }
    
    
}
