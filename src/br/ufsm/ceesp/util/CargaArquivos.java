package br.ufsm.ceesp.util;

import br.ufsm.ceesp.model.Servico;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

/**
 * Created by politecnico on 04/03/2016.
 */
public class CargaArquivos {

    public static Collection<Servico> carregaArquivoChamadosComercial(InputStream in) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Collection<Servico> servicos = new ArrayList<>();
        LeitorCSV leitorCSV = new LeitorCSV(in, ';');
        try {
            String[] linha = leitorCSV.nextLine();
            linha = leitorCSV.nextLine();
            while (linha != null) {
                Servico servico = new Servico();

                servico.setNumOS(Long.getLong(linha[0]));
                servico.setTipoOS(linha[1]);
                Date dataGeracao;

                linha = leitorCSV.nextLine();
                servicos.add(servico);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return servicos;
    }

}
