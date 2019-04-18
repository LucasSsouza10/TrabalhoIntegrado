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
public class Dividas {
     public static void main(String[] args) {
         try {
             BufferedReader lerArqCpf = new BufferedReader(new InputStreamReader(new FileInputStream("cpfs.txt"), "ISO-8859-1"));
             BufferedReader lerArqCnpj = new BufferedReader(new InputStreamReader(new FileInputStream("gerarcnpj.txt"), "ISO-8859-1"));
             OutputStreamWriter gravarArq = new OutputStreamWriter(new FileOutputStream("Dividas.sql"),"UTF-8");
             
             
             Random random = new Random();
             ArrayList<String> ArrayCnpj = new ArrayList();
             String cpf = lerArqCpf.readLine();
             String cnpj = lerArqCnpj.readLine();
             String ins = "";
             
             
             while(cnpj != null){
                 ArrayCnpj.add(cnpj);
                 cnpj = lerArqCnpj.readLine();
             }
             
             while(cpf != null){
                 int j = random.nextInt(4);
                 for(int k = 0; k < j; k++){
                     
                    int i = random.nextInt(ArrayCnpj.size());

                    ins = "insert into divida values ('" + gerarContrato() + "','" + cpf + "','" +  ArrayCnpj.get(i) + "','" +  GeradorDados.gerarData() + "', " + Float.toString(300 + random.nextInt(50000)) + ");";
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

    private static String gerarContrato() {
        Random gerador = new Random();
        String str = "";
        int digito;
        for (int i = 0; i < 8; i++) {
            digito  = gerador.nextInt(10);
            str = str + Integer.toString(digito);
        }
        return str;
    }
}
