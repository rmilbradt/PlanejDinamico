package br.ufsm.ceesp.controller;

import br.ufsm.ceesp.model.Servico;
import br.ufsm.ceesp.util.CargaArquivos;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

/**
 * Created by Rieffel on 06/03/2016.
 */

public class ServletController extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");


        try {



                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload();

                // Parse the request
                FileItemIterator iter = upload.getItemIterator(request);
                while (iter.hasNext()) {
                    FileItemStream item = iter.next();
                    String name = item.getFieldName();
                    InputStream in = item.openStream();

                    if (name.equals("arquivoCSV")) {
                        Collection<Servico> servicos = CargaArquivos.carregaArquivoChamadosComercial(in);
                        request.setAttribute("servicos", servicos);
                    }
                }

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        String nextJSP = "/WEB-INF/jsp/mapa-servicos.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        System.out.println("passou aqui!");
        String nextJSP = "/WEB-INF/jsp/mapa-servicos.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request,response);

    }
}
