package geradordados;

import Conexao.ConexaoDB;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Dividas {
     public static void gerarDividas() {
        try {
            BufferedReader lerArqCpf = new BufferedReader(new InputStreamReader(new FileInputStream("cpfs.txt"), "ISO-8859-1"));
            BufferedReader lerArqDatas = new BufferedReader(new InputStreamReader(new FileInputStream("datas.txt"), "ISO-8859-1"));
            BufferedReader lerArqCnpj = new BufferedReader(new InputStreamReader(new FileInputStream("gerarcnpj.txt"), "ISO-8859-1"));
            OutputStreamWriter gravarArq = new OutputStreamWriter(new FileOutputStream("Dividas.sql"),"UTF-8");


            Random random = new Random();
            ArrayList<String> ArrayCnpj = new ArrayList();
            String cpf = lerArqCpf.readLine();
            String data = lerArqDatas.readLine();
            String cnpj = lerArqCnpj.readLine();
            String ins = "";


            while(cnpj != null){
                ArrayCnpj.add(cnpj);
                cnpj = lerArqCnpj.readLine();
            }
             
            ConexaoDB con = new ConexaoDB();
             
            while(cpf != null){
                int j = random.nextInt(9);
                int k = 0;
                while(k < j){    
                    int i = random.nextInt(ArrayCnpj.size());
                    
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                   LocalDate localDate = LocalDate.parse(data, formatter);
                   localDate = localDate.plusYears(18);
                   
                   int minDay = (int) localDate.toEpochDay();
                    
                    ins = "insert into divida values ('" + gerarContrato() + "','" + cpf + "','" +  ArrayCnpj.get(i) + "','" + PessoaFisica.gerarData(minDay) + "', " + Float.toString(300 + random.nextInt(50000)) + ");";
                    if(con.insere(ins)){
                        gravarArq.write(ins + "\n");
                        k++;
                    }

                 }
                cpf = lerArqCpf.readLine();
                data = lerArqDatas.readLine();

            }
             
            lerArqCnpj.close();
            lerArqCpf.close();
            lerArqDatas.close();
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
        for (int i = 0; i < 10; i++) {
            if(i == 0){
                digito  = gerador.nextInt(9) + 1;
            }
            else{
                digito  = gerador.nextInt(10);
            }
            str = str + Integer.toString(digito);
        }
        return str;
    }
}
