
package persistence;

import model.Estado;
import java.sql.*;
import java.util.ArrayList;

public class EstadoDAO {
    private final Connection connection;
    
    public EstadoDAO() throws DAOException{
        this.connection = ConnectionFactory.getConnection();
    }
    
    public ArrayList<Estado> consultar(String dtInicial, String dtFinal) throws SQLException{
          PreparedStatement statement;
          ResultSet rs;
          ArrayList<Estado> arrayEstados = new ArrayList<>();
          
          
          String sql = "SELECT nome_UF, soma_div, qtd_devedores, qtd_div, soma_acoes, qtd_acoes FROM consultar_estados('"+ dtInicial +"','"+ dtFinal+"');";
          
          statement = connection.prepareStatement(sql);
          rs = statement.executeQuery();
          
          
          
          while(rs.next()){
              Estado estado = new Estado();
              
              estado.setUf(rs.getString("nome_uf"));
              estado.setValorDividas(rs.getDouble("soma_div"));
              estado.setQuantDevedores(rs.getInt("qtd_devedores"));
              estado.setQuantDividas(rs.getInt("qtd_div"));
              estado.setValorAcoes(rs.getDouble("soma_acoes"));
              estado.setQuantAcoes(rs.getInt("qtd_acoes"));
              
              arrayEstados.add(estado);
          }
          
          return arrayEstados;
    }
}
