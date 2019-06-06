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

    public ArrayList<Divida> consultar(String cpf) throws SQLException {
        PreparedStatement statement;
        ResultSet rs;
        ArrayList<Divida> arrayDividas = new ArrayList<>();

        String sql = "SELECT * FROM consultar_dividas('" + cpf + "');";

        statement = connection.prepareStatement(sql);
        rs = statement.executeQuery();

        while (rs.next()) {
            Divida divida = new Divida();

            divida.setCantrato(rs.getString("contrato"));
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