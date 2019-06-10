package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import model.Uf;

public class UfDAO {

    private final Connection connection;

    public UfDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }

    public Uf consultar(String sigla) throws SQLException {
        PreparedStatement statement;
        ResultSet rs;
        Uf unid = new Uf();

        statement = connection.prepareStatement("SELECT * FROM consultar_uf(?);");
        statement.setString(1, sigla);
        rs = statement.executeQuery();

        if(rs.next()) {
            unid.setNome(rs.getString("nome"));
            unid.setCapital(rs.getString("capital"));
            unid.setRegiao(rs.getString("regiao"));   
        }

        return unid;
    }
}
