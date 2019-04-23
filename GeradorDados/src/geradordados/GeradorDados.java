package geradordados;

public class GeradorDados {
    public static void main(String[] args){
        System.out.println("Populando tabela de Pessoa Fisica");
        PessoaFisica.gerarPessoaFisica();
        System.out.println("Populando tabela de Dividas");
        Dividas.gerarDividas();
        System.out.println("Populando tabela de Acoes Judiciais");
        Acoes_judicias.gerarAcoesJudicias();
        
        System.out.println("Tabelas preenchidas");
    }
}
