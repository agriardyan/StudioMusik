<%-- 
    Document   : halaman-utama
    Created on : Nov 22, 2014, 9:16:05 AM
    Author     : Agustinus Agri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="date/redmond.datepick.css" rel="stylesheet" type="text/css">
        <link href="jclockpicker/jquery-clockpicker.min.css" rel="stylesheet" type="text/css">
        <title>Halaman Utama Owner</title>
    </head>
    <body>
        <%
            if (null != request.getParameter("commit")) {
                String bulan = request.getParameter("bulan");
                String tahun = request.getParameter("tahunSewa");
            }
        %>
        <!--Menu bar-->
        <div class="container">
            <div class="ui inverted menu">
                <a class="active item" href="halaman-utama-owner.jsp">
                    <i class="book icon"></i> LIHAT LAPORAN
                </a>
                <a class="item" href="">
                    <i class="money icon"></i> UBAH HARGA
                </a>
                <div class="right menu">
                    <form method="POST">
                        <div class="ui dropdown link item">
                            <i class="user icon"></i> OWNER <i class="dropdown icon"></i>
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

            <h3 class="ui black inverted center aligned top attached header">Laporan Bulanan</h3>
            <div class="ui bottom attached segment">
                <form method="POST">
                    <div id="formCek" class="ui two column middle aligned relaxed grid basic segment">
                        <div class="column">
                            <div class="ui form basic segment">
                                <div class="two fields">
                                    <div class="field">
                                        <div class="ui fluid selection dropdown">
                                            <input name="bulan" type="hidden" id="noStudio">
                                            <div class="default text">Bulan</div>
                                            <i class="dropdown icon"></i>
                                            <div class="menu">
                                                <div class="item" data-value="1" >Januari</div>
                                                <div class="item" data-value="2" >Februari</div>
                                                <div class="item" data-value="3" >Maret</div>
                                                <div class="item" data-value="4" >April</div>
                                                <div class="item" data-value="5" >Mei</div>
                                                <div class="item" data-value="6" >Juni</div>
                                                <div class="item" data-value="7" >Juli</div>
                                                <div class="item" data-value="8" >Agustus</div>
                                                <div class="item" data-value="9" >September</div>
                                                <div class="item" data-value="10" >Oktober</div>
                                                <div class="item" data-value="11" >November</div>
                                                <div class="item" data-value="12" >Desember</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui left labeled icon input">
                                            <input placeholder="Tahun" type="text" name="tahunSewa">
                                            <i class="time icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ui vertical divider">
                        </div>
                        <div class="column">
                            <div class="field">
                                <input type="submit" name="commit" class="big green ui fluid button" value="Lihat Laporan!">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <div class="ui one column grid">
            <div class="column">
                <h3 class="ui black inverted center aligned top attached header">Laporan</h3>
                <div class="ui form attached segment">
                    <div class="field">
                        <input type="text" name="nama" placeholder="Nama Pemesan"> 
                    </div>
                    <div class="field">
                        <input type="text" name="notelp" placeholder="Nomor Telepon Pemesan">
                    </div>
                </div>
            </div>

        </div>

        <div class="ui three column grid">
            <div class="column"></div>
            <div class="column">
                <div class="field">
                    <input type="submit" name="commit" class="big yellow ui fluid button" value="Cetak Laporan">
                </div>
            </div>
            <div class="column"></div>
        </div>


        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script src="jclockpicker/jquery-clockpicker.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            var originalState = $('#formCek').clone();
            $('#formCek').replaceWith(originalState);

            $(document).ready(function() {
                $('#popupClockpicker').clockpicker({autoclose: true});
                $('#popupDatepicker').datepick({dateFormat: 'dd-M-yyyy'});
                $('.ui.dropdown').dropdown();
            });
        </script>
    </body>
</html>
