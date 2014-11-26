<%-- 
    Document   : halaman-pelunasan
    Created on : Nov 22, 2014, 9:20:25 AM
    Author     : Lorencius
--%>

<%@page import="java.util.List"%>
<%@page import="com.rplt.studioMusik.model.DataPersewaanStudioMusik"%>
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
        <%
            String ketersediaan = "";
            String disable = "disabled";
            String kode = "";
            double pelunasan = 0;
            
            List<DataPersewaanStudioMusik> dataSewaList = null;

            if (null != request.getParameter("commit")) {

                dataSewaList = DataPersewaanStudioMusik.getDataListByKode(request.getParameter("notaBooking"));

                DataPersewaanStudioMusik dpsm = new DataPersewaanStudioMusik();

                if (!dataSewaList.isEmpty()) {
                    
                    kode = dataSewaList.get(0).getmKodeSewa();                    
                    pelunasan = dataSewaList.get(0).getmBiayaPelunasan() * 0.4;                    
                    ketersediaan = "Biaya pelunasan :<br />"+pelunasan;
                    disable = "";

                } else {
                    ketersediaan = "Nomor nota tidak ada!";
                    disable = "disabled";
                }

            }
        %>

        <!--Menu bar-->
        <div class="ui menu">
            <a class="item" href="halaman-utama-operator.jsp">
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

        <h3 class="ui black inverted center aligned top attached header">Transaksi Pelunasan</h3>
        <div class="ui bottom attached segment">
            <form method="POST">
                <div id="formCek" class="ui two column middle aligned relaxed grid basic segment">
                    <div class="column">
                        <div class="ui form basic segment">
                            <div class="field">
                                <div class="ui left labeled icon input">
                                    <input placeholder="Nomor Nota Booking" type="text" name="notaBooking">
                                    <i class="ticket icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ui vertical divider">
                    </div>
                    <div class="column">
                        <div class="ui form basic segment">
                            <div class="two fields">
                                <div class="field">
                                    <input type="submit" name="commit" class="big green ui submit button" value="Cek Nomor Nota!">
                                </div>
                                <div class="center aligned field">
                                    <h3 style="color: red"><% out.print(ketersediaan);%></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="ui one column grid">
            <div class="column">
                <h3 class="ui black inverted center aligned top attached header">Keterangan</h3>
                <div class="ui form attached segment">
                    <%
                        if (request.getParameter("commit") != null) {

                    %> 
                    <table class="ui table">
                        <thead>
                            <tr>
                                <th>KODE SEWA</th>
                                <th>KODE STUDIO</th>
                                <th>NAMA PENYEWA</th>
                                <th>NOMOR TELEPON</th>
                                <th>TANGGAL SEWA</th>
                                <th>JAM SEWA</th>
                                <th>JAM SELESAI</th>
                                <th>BIAYA PELUNASAN</th>
                                <th>STATUS PELUNASAN</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                for (int i = 0; i < dataSewaList.size(); i++) {
                            %>
                            <tr>
                                <td><%= dataSewaList.get(i).getmKodeSewa()%></td>
                                <td><%= dataSewaList.get(i).getmKodeStudio()%></td>
                                <td><%= dataSewaList.get(i).getmNamaPenyewa()%></td>
                                <td><%= dataSewaList.get(i).getmNomorTeleponPenyewa()%></td>
                                <td><%= dataSewaList.get(i).getmTanggalSewa()%></td>
                                <td><%= dataSewaList.get(i).getmJamSewa()%></td>
                                <td><%= dataSewaList.get(i).getmJamSelesai()%></td>
                                <td><%= dataSewaList.get(i).getmBiayaPelunasan()%></td>
                                <td><%= dataSewaList.get(i).getmStatusPelunasan()%></td>
                            </tr>

                            <%
                                    }
                                }
                            %>

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <form action="lunas.jsp">
            <div class="ui three column grid">
                <div class="column"></div>
                <div class="column">
                    <div class="field">
                        <input type="submit" name="submit" class="big red ui fluid button" value="submit" <%= disable %> >
                        <input type="hidden" name="kode" value="<%= kode %>" >
                    </div>
                </div>
                <div class="column"></div>
            </div>
        </form>

        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
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
