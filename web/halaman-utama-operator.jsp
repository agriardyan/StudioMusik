<%-- 
    Document   : halaman-utama-operator
    Created on : Nov 15, 2014, 11:59:58 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="date/jquery.datepick.css" rel="stylesheet" type="text/css">
        <link href="jclockpicker/jquery-clockpicker.min.css" rel="stylesheet" type="text/css">
        <title>Halaman Utama Operator</title>
    </head>
    <body>

        <div class="ui menu">
            <a class="active item" href="index.html">
                <i class="home icon"></i> TRANSAKSI PERSEWAAN
            </a>
            <div class="right menu">
                <form method="POST">
                    <div class="ui selection dropdown link item">
                        <i class="user icon"></i> OPERATOR <i class="dropdown icon"></i>
                        <div class="menu">
                            <table class="ui basic table">
                                <tr>
                                    <td>Nama</td>
                                    <td>${name}</td>
                                </tr>
                                <tr>
                                    <td>ID</td>
                                    <td>${username}</td>
                                </tr>
                            </table>
                            <input class="ui fluid tiny submit button" type="submit" name="logoutAd" value="Logout">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <h3 class="ui top center aligned attached inverted blue block header">
            Cek Ketersediaan Jadwal
        </h3>
        <br />
        <div class="ui two column middle aligned relaxed grid basic segment">
            <div class="column">
                <div class="field">
                    <div class="ui purple ribbon label">Tanggal Sewa</div>
                    <input type="text" id="popupDatepicker">
                </div>
                <br>
                <div class="ui two column middle aligned grid basic segment">
                    <div class="column">
                        <div class="field">
                            <div class="ui purple ribbon label">Jam Sewa</div>
                            <input id="input-a" value="" data-default="20:48">
                        </div>
                    </div>
                    <div class="column">
                        <div class="field">
                            <div class="ui purple ribbon label">Durasi Sewa</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui vertical divider"></div>
            <div class="center aligned column">
                <div class="huge green ui labeled icon button">
                    <i class="signup icon"></i>
                    Cek Ketersediaan Jadwal
                </div>
                <h6>if(tersedia) prompt message "JADWAL TERSEDIA" disini </h6>
            </div>
        </div>
        <div class="ui horizontal divider"></div>

        <h3 class="ui top center aligned attached inverted blue block header">
            Pencatatan Data Sewa
        </h3>

        <div class="ui form segment">
            <div class="field">
                <label>Nama Penyewa</label>
                <input type="text">
            </div>
            <div class="field">
                <label>Nomor Telepon Penyewa</label>
                <input type="text">
            </div>
            <div class="field">
                <label>Nomor Studio</label>
                <div class="ui fluid selection dropdown">
                    <i class="dropdown icon"></i>
                    <div class="default text">Nomor Studio</div>
                    <div class="menu">
                        <div class="item" data-value="1" data-text="Studio 1">
                            Studio 1
                        </div>
                        <div class="item" data-value="2" data-text="Studio 2">
                            Studio 2
                        </div>
                        <div class="item" data-value="3" data-text="Studio 3">
                            Studio 3
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="date/jquery.plugin.js" type="text/javascript"></script>
        <script src="date/jquery.datepick.js" type="text/javascript"></script>
        <script src="jclockpicker/jquery-clockpicker.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function (){
                var input = $('#input-a');
                input.clockpicker({autoclose: true});
                $('#popupDatepicker').datepick();
            });
//            $(function() {
//                $('#popupDatepicker').datepick();
//                $('#popupDatepickers').datepick();
//                $('#inlineDatepicker').datepick({onSelect: showDate});
                
//            });

            function showDate(date) {
                alert('The date chosen is ' + date);
            }
        </script>
    </body>
</html>
