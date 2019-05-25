
package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import model.PessoaFisica;

public class PessoaFisicaDAO {
    
    private final Connection connection;
    
    public PessoaFisicaDAO() throws DAOException{
        this.connection = ConnectionFactory.getConnection();
    }
    
     public ArrayList<PessoaFisica> consultar(int anoInicial, int anoFinal, String nome) throws SQLException{
         PreparedStatement statment;
         ResultSet rs;
         ArrayList<PessoaFisica> arrayPessoas = new ArrayList<>();
         
         String sql = "SELECT cpf, nome, data_do_nascimento, estado_civil, qtd_dividas, qtd_processo FROM consultar_pessoas('%" + nome.toUpperCase() + "%', " +  anoInicial +", " +  anoFinal + ");";          
         
         statment = connection.prepareStatement(sql);
         rs = statment.executeQuery();
         
         while(rs.next()){
             PessoaFisica pessoa = new PessoaFisica();
             
             pessoa.setCpf(rs.getString("cpf"));
             pessoa.setNome(rs.getString("nome"));
             
             Calendar cal = Calendar.getInstance();
             cal.setTime(rs.getDate("data_do_nascimento"));
             pessoa.setDtNascimento(cal);
             
             pessoa.setEstadoCivil(rs.getString("estado_civil"));
             pessoa.setQuantDividas(rs.getInt("qtd_dividas"));
             pessoa.setQuantAcoes(rs.getInt("qtd_processo"));
             
             arrayPessoas.add(pessoa);
         }
        
         return arrayPessoas;
         
     }
}
