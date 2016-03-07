package br.ufsm.ceesp.controller;

import br.ufsm.ceesp.util.CargaArquivos;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 * Created by Rieffel on 06/03/2016.
 */
public class ServletController extends javax.servlet.http.HttpServlet {


    protected void processRequest(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String opcao = request.getParameter("opcao");

            if (opcao.equals("Enviar Arquivo")) {

                String arquivo = request.getParameter("arquivoCSV");
                InputStream in = new ByteArrayInputStream(arquivo.getBytes());

                CargaArquivos.carregaArquivoChamadosComercial(in);
            }
        }
    }


    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
