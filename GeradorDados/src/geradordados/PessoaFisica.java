package geradordados;

import Conexao.ConexaoDB;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.time.LocalDate;
import java.util.*;

public class PessoaFisica {
    public static void gerarPessoaFisica() {
        try {
            BufferedReader lerArq = new BufferedReader(new InputStreamReader(new FileInputStream("nomes.txt"), "ISO-8859-1"));
            OutputStreamWriter gravarArq = new OutputStreamWriter(new FileOutputStream("banco.sql"),"UTF-8");
            OutputStreamWriter gravarArq1 = new OutputStreamWriter(new FileOutputStream("cpfs.txt"),"UTF-8");
            OutputStreamWriter gravarArq2 = new OutputStreamWriter(new FileOutputStream("datas.txt"),"UTF-8");
 
            String linha = lerArq.readLine(); // lê a primeira linha
            // a variável "linha" recebe o valor "null" quando o processo
            // de repetição atingir o final do arquivo texto
            ConexaoDB con = new ConexaoDB();
        
            while (linha != null) {
                String cpf = gerarCpf();
                String data = gerarData(-18263); // -18263 é referente ao cast do epochDay 1920-01-01 para int
                String ins = "insert into Pessoa_Fisica values (" + "'" + cpf + "'" + ", " + "'" + linha.toUpperCase() + "'" + ", " + "'" +  data+ "'" + ", " + "'" + gerarEC()  + "'" + ", '" + gerarUF() + "');"; 
                if(con.insere(ins)){
                  gravarArq.write(ins + "\n");
                  gravarArq1.write(cpf + "\n");
                  gravarArq2.write(data + "\n");
                  linha = lerArq.readLine(); // lê da segunda até a última linha
                }
            }

            lerArq.close();
            gravarArq.close();
            gravarArq1.close();
            gravarArq2.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n",
            e.getMessage());
        }
    }

    public static String gerarCpf() {
        Random gerador = new Random();
        String str = "";
        int digito;
        int v1= 0, v2 = 0, id = 8;
        for (int i = 0; i < 9; i++) {
            if(i == 0){
                digito  = gerador.nextInt(9) + 1;
            }
            else{
                digito  = gerador.nextInt(10);
            }
            str = str + Integer.toString(digito);
            v1 = v1 + digito * (9 - (id % 10));
            v2 = v2 + digito * (9 - ((id + 1)%10));
            id--;
        }
            v1 = (v1 % 11) % 10;
            v2 = v2 + v1 * 9;
            v2 = (v2 % 11) % 10;
            
            str = str + Integer.toString(v1) + Integer.toString(v2);
        return str;
    }

    public static String gerarData(int min) {
        Random random = new Random();
        int minDay = min;
        int maxDay = (int) LocalDate.of(2019, 12, 31).toEpochDay();
        
        long randomDay = minDay + random.nextInt(maxDay - minDay);

        LocalDate randomBirthDate = LocalDate.ofEpochDay(randomDay);
        String dataFormatada;
            if(randomBirthDate.getMonthValue() < 10 && randomBirthDate.getDayOfMonth() < 10)
                dataFormatada = "0" + Integer.toString(randomBirthDate.getDayOfMonth()) + "/0" + Integer.toString(randomBirthDate.getMonthValue()) + "/" + Integer.toString(randomBirthDate.getYear());
            else if(randomBirthDate.getMonthValue() < 10)
                dataFormatada = Integer.toString(randomBirthDate.getDayOfMonth()) + "/0" + Integer.toString(randomBirthDate.getMonthValue()) + "/" + Integer.toString(randomBirthDate.getYear());
            else if(randomBirthDate.getDayOfMonth() < 10)
                dataFormatada = "0" + Integer.toString(randomBirthDate.getDayOfMonth()) + "/" + Integer.toString(randomBirthDate.getMonthValue()) + "/" + Integer.toString(randomBirthDate.getYear());
            else
                dataFormatada = Integer.toString(randomBirthDate.getDayOfMonth()) + "/" + Integer.toString(randomBirthDate.getMonthValue()) + "/" + Integer.toString(randomBirthDate.getYear());

                
        return dataFormatada;
    }

    private static String gerarEC() {
        Random random = new Random();
        int op = random.nextInt(4);
        
        switch(op){
            case 0:
                return "Casado(a)";
            case 1:
                return "Solteiro(a)";
            case 2:
                return "Divorciado(a)";
            case 3: 
                return "Viuvo(a)";
        }
        return null;
    }

    private static String gerarUF() {
        String ufs[] = {"AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR","SC", "SP", "SE", "TO"};
        
        Random random = new Random();
        
        return ufs[random.nextInt(27)];
    }
}
