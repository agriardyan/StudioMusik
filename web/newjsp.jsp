<%-- 
    Document   : newjsp
    Created on : Nov 16, 2014, 12:15:52 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
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

        <h1>Cek Ketersediaan Jadwal</h1>
        <div class="ui two column middle aligned relaxed grid basic segment">
            <div class="column">
                <div class="field">
                    <div class="ui purple ribbon label">Tanggal Sewa</div>
                    <h2>DateTime Picker goes here</h2>
                </div>
                <div class="ui two column middle aligned relaxed grid basic segment">
                    <div class="column">
                        <div class="field">
                            <div class="ui purple ribbon label">Jam Sewa</div>
                            <h2>Time picker goes here</h2>
                        </div>
                    </div>
                    <div class="column">
                        <div class="field">
                            <div class="ui purple ribbon label">Durasi Sewa</div>
                            <h2>Durasi goes here</h2>
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
                <h4>if(tersedia) prompt message "JADWAL TERSEDIA" disini </h4>
            </div>
        </div>
        <div class="ui horizontal divider"></div>

        <br/>

        <h1>Pencatatan Data Sewa</h1>

        <div class="ui form segment">
            <div class="field">
                <label>Nama Penyewa</label>
                <input type="text">
            </div>
            <div class="field">
                <label>Nomor Telepon Penyewa</label>
                <input type="text">
            </div>
        </div>
        


    </body>
</html>
