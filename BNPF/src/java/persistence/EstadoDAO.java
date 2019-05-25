
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
          
          
          String sql = "SELECT nome_UF as uf, sum_div, qnt_devedores, qnt_div, sum_acoes, qnt_acoes\n"
                  + "FROM UFs as estados\n"
                  + "LEFT JOIN\n"
                  + "	(SELECT UF, sum(valor_da_divida) as sum_div, count(distinct p.cpf) as qnt_devedores, count(d.num_contrato) as qnt_div\n"
                  + "	FROM divida d INNER JOIN pessoa_fisica p ON d.cpf = p.cpf\n"
                  + "	WHERE data BETWEEN '" + dtInicial + "' AND '" + dtFinal + "'\n"
                  + "	GROUP BY UF) as dis\n"
                  + "ON estados.nome_UF = dis.UF\n"
                  + "FULL OUTER JOIN\n"
                  + "	(SELECT UF, sum(valor_acao) as sum_acoes, count(numero_do_processo) as qnt_acoes\n"
                  + "	FROM acoes_judiciais a INNER JOIN pessoa_fisica p ON a.cpf_do_reu = p.cpf\n"
                  + "	WHERE data BETWEEN '" + dtInicial + "' AND '" + dtFinal + "'\n"
                  + "	GROUP BY UF ) as acs\n"
                  + "ON estados.nome_UF = acs.UF\n"
                  + "ORDER BY estados.nome_UF;";
          
          statement = connection.prepareStatement(sql);
          rs = statement.executeQuery();
          
          
          
          while(rs.next()){
              Estado estado = new Estado();
              
              estado.setUf(rs.getString("uf"));
              estado.setValorDividas(rs.getDouble("sum_div"));
              estado.setQuantDevedores(rs.getInt("qnt_devedores"));
              estado.setQuantDividas(rs.getInt("qnt_div"));
              estado.setValorAcoes(rs.getDouble("sum_acoes"));
              estado.setQuantAcoes(rs.getInt("qnt_acoes"));
              
              arrayEstados.add(estado);
          }
          
          return arrayEstados;
    }
}
