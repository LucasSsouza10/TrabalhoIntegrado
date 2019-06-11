package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import model.Divida;

public class DividaDAO {

    private final Connection connection;

    public DividaDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }

    public ArrayList<Divida> consultar(String cpf, int anoI, int anoF) throws SQLException {
        PreparedStatement statement;
        ResultSet rs;
        ArrayList<Divida> arrayDividas = new ArrayList<>();

        statement = connection.prepareStatement("SELECT * FROM consultar_dividas(?, ?, ?);");
        statement.setString(1, cpf);
        statement.setInt(2, anoI);
        statement.setInt(3, anoF);
        rs = statement.executeQuery();

        while (rs.next()) {
            Divida divida = new Divida();

            divida.setContrato(rs.getString("contrato"));
            divida.setCnpj(rs.getString("cnpj"));

            Calendar cal = Calendar.getInstance();
            cal.setTime(rs.getDate("data"));
            divida.setData(cal);

            divida.setValor(rs.getDouble("valor"));

            arrayDividas.add(divida);
        }

        return arrayDividas;
    }
}
