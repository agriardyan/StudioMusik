<%-- 
    Document   : lunas
    Created on : Nov 26, 2014, 8:17:23 PM
    Author     : root
--%>

<%@page import="com.rplt.studioMusik.model.DataPersewaanStudioMusik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if(request.getParameter("kode")!=null)
        {
            String kode = request.getParameter("kode");
            DataPersewaanStudioMusik.updateDataPelunasan(kode);
            
            response.sendRedirect("halaman-pelunasan.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
