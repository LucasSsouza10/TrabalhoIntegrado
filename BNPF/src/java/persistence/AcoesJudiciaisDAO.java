package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import model.AcoesJudiciais;

public class AcoesJudiciaisDAO {
    private final Connection connection;

    public AcoesJudiciaisDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }

    public ArrayList<AcoesJudiciais> consultar(String cpf, int anoI, int anoF) throws SQLException {
        PreparedStatement statement;
        ResultSet rs;
        ArrayList<AcoesJudiciais> arrayAcoes = new ArrayList<>();
            
        statement = connection.prepareStatement("SELECT * FROM consultar_acoes(?, ?, ?);");
        statement.setString(1, cpf);
        statement.setInt(2, anoI);
        statement.setInt(3, anoF);
        rs = statement.executeQuery();  

        while (rs.next()) {
            AcoesJudiciais acao = new AcoesJudiciais();

            acao.setNumProcesso(rs.getString("numero_do_processo"));
            acao.setIdentAutor(rs.getString("ident_autor"));
            acao.setSituacao(rs.getString("situacao"));

            Calendar cal = Calendar.getInstance();
            cal.setTime(rs.getDate("data"));
            acao.setData(cal);

            acao.setValor(rs.getDouble("valor"));

            arrayAcoes.add(acao);
        }

        return arrayAcoes;
    }
}
