
package model;

import java.util.Calendar;

public class AcoesJudiciais {
    private String numProcesso;
    private String identAutor;
    private String situacao;
    private Calendar data;
    private double valor;

    public String getNumProcesso() {
        return numProcesso;
    }

    public void setNumProcesso(String numProcesso) {
        this.numProcesso = numProcesso;
    }

    public String getIdentAutor() {
        return identAutor;
    }

    public void setIdentAutor(String identAutor) {
        this.identAutor = identAutor;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
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
