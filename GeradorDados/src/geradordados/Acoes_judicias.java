/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package geradordados;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author lucca
 */
public class Acoes_judicias {
    public static void main(String[] args){
        try {
             BufferedReader lerArqCpf = new BufferedReader(new InputStreamReader(new FileInputStream("cpfs.txt"), "ISO-8859-1"));
             BufferedReader lerArqCnpj = new BufferedReader(new InputStreamReader(new FileInputStream("gerarcnpj.txt"), "ISO-8859-1"));
             OutputStreamWriter gravarArq = new OutputStreamWriter(new FileOutputStream("Acoes_judiciais.sql"),"UTF-8");
             
             
             Random random = new Random();
             ArrayList<String> ArrayCnpj = new ArrayList();
             String cpf = lerArqCpf.readLine();
             String cnpj = lerArqCnpj.readLine();
             String ins = "";
             String cpfAux;
             
             
             while(cnpj != null){
                 ArrayCnpj.add(cnpj);
                 cnpj = lerArqCnpj.readLine();
             }
             
             while(cpf != null){
                 int j = random.nextInt(4);
                 for(int k = 0; k < j; k++){
                     
                    int i = random.nextInt(ArrayCnpj.size());
                    if(random.nextBoolean())
                        ins = "insert into acoes_judiciais values ('" + gerarProcesso() + "','" + cpf + "','" +  ArrayCnpj.get(i) + "','" +  gerarSP() + "','" + GeradorDados.gerarData() + "'," + Float.toString(300 + random.nextInt(50000)) + ");";
                    else{
                        while((cpfAux = GeradorDados.gerarCpf()).equals(cpf)){
                        
                        }
                        ins = "insert into acoes_judiciais values ('" + gerarProcesso() + "','" + cpf + "','" +  cpfAux + "','" +  gerarSP() + "','" + GeradorDados.gerarData() + "', " + Float.toString(300 + random.nextInt(50000)) + ");";
                    }
                    gravarArq.write(ins + "\n");
                    
                 }
                 cpf = lerArqCpf.readLine();
             }
             
             lerArqCnpj.close();
             lerArqCpf.close();
             gravarArq.close();
         } catch (IOException  ex) {
             System.err.printf("Erro na abertura do arquivo: %s.\n",
             ex.getMessage());
         }
    }

    private static String gerarProcesso() {
        Random gerador = new Random();
        String str = "";
        int digito;
        for (int i = 0; i < 10; i++) {
            digito  = gerador.nextInt(10);
            str = str + Integer.toString(digito);
        }
        return str;
    }

    private static String gerarSP() {
        //em espera, em andamento e finalizada
        Random random = new Random();
        int op = random.nextInt(3);
        
        switch(op){
            case 0:
                return "em espera";
            case 1:
                return "em andamento";
            case 2:
                return "finalizada";
        }
        return null;
    }
}
