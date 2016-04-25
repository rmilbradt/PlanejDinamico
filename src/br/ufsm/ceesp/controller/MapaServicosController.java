package br.ufsm.ceesp.controller;

import br.ufsm.ceesp.beans.ServicoDAO;
import br.ufsm.ceesp.model.teste.Servico;
import br.ufsm.ceesp.util.CargaArquivos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;

/**
 * Created by politecnico on 02/03/2016.
 */
@Controller
public class MapaServicosController {

    @Autowired
    private ServicoDAO servicoDAO;

    @Autowired
    private CargaArquivos cargaArquivos;


    @RequestMapping("mapa-servicos.html")
    public String visualiza(@DateTimeFormat(pattern = "yyyy-MM-dd") Date data, Model model) {
        if(data != null) {
            model.addAttribute("servicos", servicoDAO.findServicosDia(data));
        }
        return "mapa-servicos";
    }

    @RequestMapping("lista-servicos.html")
    public String lista(@DateTimeFormat(pattern = "yyyy-MM-dd") Date data, Model model) {
        if(data != null) {
            model.addAttribute("servicos", servicoDAO.findServicosDia(data));
        }
        return "lista-servicos";
    }

    @RequestMapping(value = "carrega-mapa.html", method = RequestMethod.GET)
    public String formCarregarArquivo() throws IOException {
        return "carrega-mapa";
    }

    @RequestMapping(value = "carrega-mapa.html", method = RequestMethod.POST)
    public String carregarArquivo(MultipartFile arquivoCSV, Model model) throws IOException {
        if (arquivoCSV != null) {
            Collection<Servico> servicos = cargaArquivos.carregaArquivoChamadosComercial(arquivoCSV.getInputStream());
            model.addAttribute("servicos", servicos);
        }
        return "carrega-mapa";
    }

    @RequestMapping(value = "cadastra-servico.html")
    public String cadastraServico(Servico servico) {
        if (servico != null) {
            servicoDAO.criaServico(servico);
        }
        return "formulario-servico";
    }


}