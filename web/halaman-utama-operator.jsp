<%-- 
    Document   : halaman-utama
    Created on : Nov 22, 2014, 9:16:05 AM
    Author     : Agustinus Agri
--%>

<%@page import="com.rplt.studioMusik.model.DataPegawai"%>
<%@page import="com.rplt.studioMusik.model.DataPersewaanStudioMusik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if (request.getParameter("logoutAd") != null) {
            response.sendRedirect("halaman-home-studio.jsp");
        }


    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="date/redmond.datepick.css" rel="stylesheet" type="text/css">
        <link href="jclockpicker/jquery-clockpicker.min.css" rel="stylesheet" type="text/css">
        <title>Halaman Utama Operator</title>
    </head>
    <body>
        <%            String tanggal = "";
            String jamSewa = "";
            String kodeStudio = "";
            String durasiSewa = "";
            String namaPemesan = "";
            String noTelp = "";
            String ketersediaan = "";
            String disable = "disabled";

            if (null != request.getParameter("commit")) {

                DataPersewaanStudioMusik dpsm = new DataPersewaanStudioMusik();

                dpsm.setmTanggalSewa(request.getParameter("tanggalSewa"));
                dpsm.setmJamSewa(request.getParameter("jamSewa"));
                dpsm.setmKodeStudio(request.getParameter("studio"));
                dpsm.setmDurasi(Integer.parseInt(request.getParameter("durasiSewa")));

//                out.println(dpsm.getmJamSewa());
//                out.println(dpsm.getmTanggalSewa());
//                out.println(dpsm.getmKodeStudio());
//                out.println(dpsm.getmDurasi());
                boolean cek = DataPersewaanStudioMusik.cekKetersediaanJadwal(dpsm);

                if (cek) {
                    tanggal = request.getParameter("tanggalSewa");
                    jamSewa = request.getParameter("jamSewa");
                    kodeStudio = request.getParameter("studio");
                    durasiSewa = request.getParameter("durasiSewa");

                    String biayaSewa = DataPersewaanStudioMusik.hitungBiayaSewa(dpsm.getmDurasi(), dpsm.getmKodeStudio());
                    double uangMuka = Double.parseDouble(biayaSewa) * 0.6;

                    ketersediaan = "Biaya sewa = " + biayaSewa + "<br />" + "Uang muka = " + uangMuka;
                    disable = "";

                    session.setAttribute("tanggal", tanggal);
                    session.setAttribute("jamSewa", jamSewa);
                    session.setAttribute("kodeStudio", kodeStudio);
                    session.setAttribute("durasiSewa", durasiSewa);
                    session.setAttribute("biayaSewa", biayaSewa);

                } else {
                    ketersediaan = "Pilih jadwal lain";
                    disable = "disabled";
                }

            }

//            if (null != request.getParameter("submit")) {
//
//                tanggal = request.getParameter("tanggalSewa");
//                jamSewa = request.getParameter("jamSewa");
//                kodeStudio = request.getParameter("studio");
//                durasiSewa = request.getParameter("durasiSewa");
//                namaPemesan = request.getParameter("namaPemesan");
//                noTelp = request.getParameter("noTelp");
//
//                DataPersewaanStudioMusik dpsm = new DataPersewaanStudioMusik();
//                dpsm.setmKodeStudio(kodeStudio);
//                dpsm.setmNamaPenyewa(namaPemesan);
//                dpsm.setmNomorTeleponPenyewa(noTelp);
//                dpsm.setmTanggalSewa(tanggal);
//                dpsm.setmJamSewa(jamSewa);
//                dpsm.setmDurasi(Integer.parseInt(durasiSewa));
//                dpsm.setmBiayaPelunasan(30000);
//                dpsm.setmStatusPelunasan("BOOKING");
//
//                DataPersewaanStudioMusik.simpanData(dpsm);
//            }
        %>
        <!--Menu bar-->
        <div class="container">
            <div class="ui menu">
                <a class="active item" href="halaman-utama-operator.jsp">
                    <i class="book icon"></i> BOOKING
                </a>
                <a class="item" href="halaman-pelunasan.jsp">
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
            <form method="POST">
                <h3 class="ui black inverted center aligned top attached header">Cek Ketersediaan Jadwal</h3>
                <div class="ui bottom attached segment">
                    <div id="formCek" class="ui two column middle aligned relaxed grid basic segment">
                        <div class="column">
                            <div class="ui form basic segment">
                                <div class="two fields">
                                    <div class="field">
                                        <!--<label>Tanggal Sewa</label>-->
                                        <div class="ui left labeled icon input">
                                            <input id="popupDatepicker" placeholder="Tanggal Sewa" type="text" name="tanggalSewa" value="<%= tanggal%>">
                                            <i class="calendar icon"></i>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <!--<label>Jam Sewa</label>-->
                                        <div class="ui left labeled icon input">
                                            <input id="popupClockpicker" placeholder="Jam Sewa" type="text" name="jamSewa" value="<%= jamSewa%>">
                                            <i class="time icon"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="two fields">
                                    <div class="field">
                                        <div class="ui fluid selection dropdown">
                                            <input name="studio" type="hidden" id="noStudio" value="<%= kodeStudio%>">
                                            <div class="default text">Studio</div>
                                            <i class="dropdown icon"></i>
                                            <div class="menu">
                                                <div class="item" data-value="101" >Studio 1</div>
                                                <div class="item" data-value="102" >Studio 2</div>
                                                <div class="item" data-value="103" >Studio 3</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <!--<label>Durasi Sewa</label>-->
                                        <div class="ui left labeled icon input">
                                            <input placeholder="Durasi Sewa" type="text" name="durasiSewa" value="<%= durasiSewa%>">
                                            <i class="time icon"></i>
                                        </div>
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
                                        <input type="submit" name="commit" class="big green ui submit button" value="Cek Jadwal">
                                        <!--                                    Cek Jadwal
                                                                        </div>-->
                                    </div>
                                    <div class="center aligned field">
                                        <h4 style="color: red"><% out.print(ketersediaan);%></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div> 
            </form>
        </div>


        <form action="summary.jsp" method="POST">
            <div class="ui one column grid">
                <div class="column">
                    <h3 class="ui black inverted center aligned top attached header">Pemesanan</h3>
                    <div class="ui form attached segment">
                        <div class="<%= disable%> field">
                            <input type="text" name="namaPemesan" placeholder="Nama Pemesan" <%= disable%> > 
                        </div>
                        <div class="<%= disable%> field">
                            <input type="text" name="noTelp" placeholder="Nomor Telepon Pemesan" <%= disable%> >
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui three column grid">
                <div class="column"></div>
                <div class="column">
                    <div class="field">
                        <input type="submit" name="submit" class="big red ui fluid button" value="Submit">
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
            var originalState = $('#formCek').clone();
            $('#formCek').replaceWith(originalState);
            //            var clickStudio1 = function(){
            //                document.getElementById("noStudio").val = "Studio 1";
            //            };
            //            var clickStudio2 = function(){
            //                document.getElementById("noStudio").val = "Studio 2";
            //            };
            //            var clickStudio3 = function(){
            //                document.getElementById("noStudio").val = "Studio 3";
            //            };

            $(document).ready(function() {
                $('#popupClockpicker').clockpicker({autoclose: true});
                $('#popupDatepicker').datepick({dateFormat: 'dd-M-yyyy'});
                $('.ui.dropdown').dropdown();
            });


            $('.ui.form').form({
                inline: true,
                on: 'blur',
                name: {
                    identifier: 'tanggalSewa',
                    rules: [
                        {
                            type: 'empty',
                            prompt: 'Masukkan tanggal penyewaan'
                        }
                    ]
                },
                gender: {
                    identifier: 'jamSewa',
                    rules: [
                        {
                            type: 'empty',
                            prompt: 'Masukkan jam sewa'
                        }
                    ]
                },
                username: {
                    identifier: 'studio',
                    rules: [
                        {
                            type: 'empty',
                            prompt: 'Masukkan studio yang dipilih'
                        }
                    ]
                },
                password: {
                    identifier: 'durasiSewa',
                    rules: [
                        {
                            type: 'empty',
                            prompt: 'Masukkan durasi sewa'
                        }
                    ]
                }
            });
        </script>
    </body>
</html>
