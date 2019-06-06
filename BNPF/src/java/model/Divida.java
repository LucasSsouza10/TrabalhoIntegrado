
package model;

import java.util.Calendar;

public class Divida {
    private String contrato;
    private String cnpj;
    private Calendar data;
    private double valor;

    public String getContrato() {
        return contrato;
    }

    public void setContrato(String contrato) {
        this.contrato = contrato;
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

    @Override
    public String toString() {
        return "Divida{" + "contrato=" + contrato + ", cnpj=" + cnpj + ", data=" + data + ", valor=" + valor + '}';
    }
    
    
    
}
