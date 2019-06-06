
package model;

import java.util.Calendar;

public class Divida {
    private String cantrato;
    private String cnpj;
    private Calendar data;
    private double valor;

    public String getCantrato() {
        return cantrato;
    }

    public void setCantrato(String cantrato) {
        this.cantrato = cantrato;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public Calendar getData() {
        return data;
    }

    public void setData(Calendar data) {
        this.data = data;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
    
    
}
