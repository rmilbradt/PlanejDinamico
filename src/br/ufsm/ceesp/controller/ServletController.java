package br.ufsm.ceesp.controller;

import br.ufsm.ceesp.util.CargaArquivos;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 * Created by Rieffel on 06/03/2016.
 */
public class ServletController extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String opcao = request.getParameter("opcao");

            if (opcao.equals("Enviar Arquivo")) {

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload();

                // Parse the request
                FileItemIterator iter = upload.getItemIterator(request);
                while (iter.hasNext()) {
                    FileItemStream item = iter.next();
                    String name = item.getFieldName();
                    InputStream stream = item.openStream();
                    if (item.isFormField()) {
                        System.out.println("Form field " + name + " with value "
                                + Streams.asString(stream) + " detected.");
                    } else {
                        System.out.println("File field " + name + " with file name "
                                + item.getName() + " detected.");
                        // Process the input stream
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        /*// Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Parse the request
        List<FileItem> items = upload.parseRequest(request);

        // Process the uploaded items
        Iterator<FileItem> iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = iter.next();

            if (item.isFormField()) {
                processFormField(item);
            } else {
                processUploadedFile(item);
            }
        }*/

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
