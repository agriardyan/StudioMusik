<%-- 
    Document   : summary
    Created on : Nov 24, 2014, 7:48:45 PM
    Author     : root
--%>

<%@page import="com.rplt.studioMusik.model.DataPersewaanStudioMusik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String tanggal = "";
            String jamSewa = "";
            String kodeStudio = "";
            String durasiSewa = "";
            String namaPemesan = "";
            String noTelp = "";

            if (null != request.getParameter("namaPemesan")) {

                namaPemesan = request.getParameter("namaPemesan");
                noTelp = request.getParameter("noTelp");
                tanggal = session.getAttribute("tanggal").toString();
                jamSewa = session.getAttribute("jamSewa").toString();
                kodeStudio = session.getAttribute("kodeStudio").toString();
                durasiSewa = session.getAttribute("durasiSewa").toString();

                DataPersewaanStudioMusik dpsm = new DataPersewaanStudioMusik();
                dpsm.setmKodeStudio(kodeStudio);
                dpsm.setmNamaPenyewa(namaPemesan);
                dpsm.setmNomorTeleponPenyewa(noTelp);
                dpsm.setmTanggalSewa(tanggal);
                dpsm.setmJamSewa(jamSewa);
                dpsm.setmDurasi(Integer.parseInt(durasiSewa));
                dpsm.setmBiayaPelunasan(30000);
                dpsm.setmStatusPelunasan("BOOKING");

                DataPersewaanStudioMusik.simpanData(dpsm);

                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"Berhasil disimpan!\");");
                out.print("</script>");

                response.sendRedirect("halaman-utama-operator.jsp");

            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    </body>
</html>
