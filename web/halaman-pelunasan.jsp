<%-- 
    Document   : halaman-pelunasan
    Created on : Nov 22, 2014, 9:20:25 AM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="date/redmond.datepick.css" rel="stylesheet" type="text/css">
        <link href="jclockpicker/jquery-clockpicker.min.css" rel="stylesheet" type="text/css">
        <title>Halaman Utama Operator</title>
    </head>
    <body>
        <!--Menu bar-->
        <div class="ui inverted menu">
            <a class="item" href="halaman-utama.jsp">
                <i class="book icon"></i> BOOKING
            </a>
            <a class="active item" href="halaman-pelunasan.jsp">
                <i class="money icon"></i> TRANSAKSI PELUNASAN
            </a>
            <div class="right menu">
                <form method="POST">
                    <div class="ui dropdown link item">
                        <i class="user icon"></i> OPERATOR <i class="dropdown icon"></i>
                        <div class="menu">
                            <table class="ui basic table">
                                <tr>
                                    <td>Nama</td>
                                    <td>${name}</td>
                                </tr>
                                <tr>
                                    <td >ID</td>
                                    <td>${username}</td>
                                </tr>
                            </table>
                            <input class="ui fluid tiny submit button" type="submit" name="logoutAd" value="Logout">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--End of Menu bar-->
        
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script src="jclockpicker/jquery-clockpicker.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.ui.dropdown').dropdown();
            });
        </script>
    </body>
</html>
