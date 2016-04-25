package br.ufsm.ceesp.util;

import br.ufsm.ceesp.beans.EquipeDAO;
import br.ufsm.ceesp.model.ArquivoSaida;
import br.ufsm.ceesp.model.Equipe;
import br.ufsm.ceesp.model.Localizacao;
import br.ufsm.ceesp.model.Rota;
import br.ufsm.ceesp.model.teste.Servico;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

/**
 * Created by politecnico on 04/03/2016.
 */
@Repository
public class CargaArquivos {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private EquipeDAO equipeDAO;

    @Transactional
    public ArquivoSaida carregaArquivoSaida(InputStream in) throws IOException, ParseException {
        ArquivoSaida arq = new ArquivoSaida();
        arq.setRotas(new ArrayList<>());
        LeitorCSV leitorCSV = new LeitorCSV(in, '\t');
        SimpleDateFormat SDF_data = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat SDF_dataHora = new SimpleDateFormat("dd/MM/yyyy HH:mm");

        String[] linhaArquivo = leitorCSV.nextLine();
        String dataHora = SDF_data.format(new Date()) + " " + linhaArquivo[0];
        arq.setData(SDF_dataHora.parse(dataHora));
        arq.setNumEquipes(Integer.parseInt(linhaArquivo[1]));
        arq.setNumOrdensEmergenciaisNaoAtribuidas(Integer.parseInt(linhaArquivo[2]));
        linhaArquivo = leitorCSV.nextLine();
        Rota rota = null;
        while(linhaArquivo != null) {
            if (linhaArquivo.length == 5) {
                if (rota != null) {
                    arq.getRotas().add(rota);
                }
                rota = new Rota();
                Equipe equipe = equipeDAO.findByCodigo(Long.parseLong(linhaArquivo[0]));
                if (equipe == null) {
                    equipe = new Equipe();
                    equipe.setNumero(Long.parseLong(linhaArquivo[0]));
                    sessionFactory.getCurrentSession().save(equipe);
                }
                rota.setEquipe(equipe);

            } else {

            }
            linhaArquivo = leitorCSV.nextLine();
        }

        return null;
    }

    @Transactional
    public Collection<Servico> carregaArquivoChamadosComercial(InputStream in) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        NumberFormat nf = new DecimalFormat("#,##0.00");
        Collection<Servico> servicos = new ArrayList<>();
        LeitorCSV leitorCSV = new LeitorCSV(in, ';');
        try {
            String[] linha = leitorCSV.nextLine();
            linha = leitorCSV.nextLine();
            while (linha != null) {
                try {
                    Servico servico = new Servico();

                    servico.setNumOS(Long.getLong(linha[0]));
                    servico.setTipoOS(linha[1]);
                    Date dataGeracao = null;
                    try {
                        dataGeracao = sdf1.parse(linha[2]);
                    } catch (Exception e) {
                        dataGeracao = sdf2.parse(linha[2]);
                    }
                    Date dataPrazo = null;
                    try {
                        dataPrazo = sdf1.parse(linha[3]);
                    } catch (Exception e) {
                        dataPrazo = sdf2.parse(linha[3]);
                    }
                    servico.setDataRealizacao(dataGeracao);
                    servico.setDataPrazo(dataPrazo);
                    servico.setLocalizacao(new Localizacao());
                    servico.getLocalizacao().setLatitude(nf.parse(linha[4]).doubleValue());
                    servico.getLocalizacao().setLongitude(nf.parse(linha[5]).doubleValue());
                    try {
                        servico.setTempoExecucao(Integer.parseInt(linha[6]));
                    } catch (Exception e) {
                        servico.setTempoExecucao(null);
                    }
                    servico.setGrupo(linha[7]);
                    if (linha.length > 8) {
                        servico.setRegulada(linha[8]);
                    }
                    linha = leitorCSV.nextLine();
                    servicos.add(servico);
                    sessionFactory.getCurrentSession().save(servico);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return servicos;
    }

}
