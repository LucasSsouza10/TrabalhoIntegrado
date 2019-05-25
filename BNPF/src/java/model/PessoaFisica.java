/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Calendar;

/**
 *
 * @author lucca
 */
public class PessoaFisica {
    String cpf;
    String nome;
    Calendar dtNascimento;
    String estadoCivil;
    int quantDividas;
    int quantAcoes;

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Calendar getDtNascimento() {
        return dtNascimento;
    }

    public void setDtNascimento(Calendar dtNascimento) {
        this.dtNascimento = dtNascimento;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public int getQuantDividas() {
        return quantDividas;
    }

    public void setQuantDividas(int quantDividas) {
        this.quantDividas = quantDividas;
    }

    public int getQuantAcoes() {
        return quantAcoes;
    }

    public void setQuantAcoes(int quantAcoes) {
        this.quantAcoes = quantAcoes;
    }
     
    
}
