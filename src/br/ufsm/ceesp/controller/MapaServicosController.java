package br.ufsm.ceesp.controller;

import br.ufsm.ceesp.beans.ServicoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by politecnico on 02/03/2016.
 */
@Controller
public class MapaServicosController {

    @Autowired
    private ServicoDAO servicoDAO;

    @RequestMapping("mapa-servicos.html")
    public String visualiza(Model model) {
        model.addAttribute("servicos", servicoDAO.findServicosDia(null));
        return "mapa-servicos";
    }

    @RequestMapping("lista-servicos.html")
    public String lista(Model model) {
        model.addAttribute("servicos", servicoDAO.findServicosDia(null));
        return "lista-servicos";
    }

}