<%-- 
    Document   : index
    Created on : Nov 16, 2014, 7:26:01 PM
    Author     : root
--%>

<%@page import="com.rplt.studioMusik.model.DataPegawai"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sabha Music Studio</title>
        <link rel="shortcut icon" href="img/Deep_User.png" type="image/png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width; initial-scale=1.0">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
        <link href="bxslider/jquery.bxslider.css" rel="stylesheet" type="text/css">
        <style>
            .bx-wrapper ul li { height: 480px; }
            /*                    .bx-wrapper, .bx-viewport{
                                    height: 700px !important;
                                }*/
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("username") != null) {
                if (session.getAttribute("role").equals("Owner")) {
                    response.sendRedirect("halaman-utama-admin.jsp");
                } else if (session.getAttribute("role").equals("Operator")) {
                    response.sendRedirect("halaman-utama-operator.jsp");
                }
            }

            if (null != request.getParameter("commit")) {
                session = request.getSession(true);
                session.setMaxInactiveInterval(60 * 60 * 24);
                int login = DataPegawai.validateLoginCredential(request.getParameter("username"), request.getParameter("password"), request.getParameter("commit"));
                switch (login) {
                    case 0:
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert(\"Unregistered username\");");
                        out.print("</script>");
                        break;
                    case 1:
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert(\"Username or Password or Role was incorrect\");");
                        out.print("</script>");
                        break;
                    case 2:
                        session.setAttribute("role", "Operator");
                        session.setAttribute("name", request.getParameter("username"));
                        session.setAttribute("username", request.getParameter("username"));
                        response.sendRedirect("halaman-utama-operator.jsp");
                        break;
                    case 3:
                        session.setAttribute("role", "Owner");
                        session.setAttribute("name", request.getParameter("username"));
                        session.setAttribute("username", request.getParameter("username"));
                        response.sendRedirect("halaman-utama-admin.jsp");
                        break;
                    default:
                        System.err.println("ENTER DEFAULT");
                        break;
                }
            }
        %>

        <!--Menu bar-->
        <div class="ui menu">
            <a class="active item" href="index.html">
                <i class="home icon"></i> HOME
            </a>
            <a class="item" href="homeOwner.html">
                <i class="video icon"></i> PRODUCT
            </a>
            <a class="item" href="homeOperator.html">
                <i class="user icon"></i> ABOUT US
            </a>
            <div class="right menu">
                <a class="item" id="loginButton">
                    <i class="sign in icon"></i> LOGIN
                </a>
            </div>
        </div>

        <!--Sidebar-->
        <div class="ui black floating vertical right sidebar menu">
            <div class="item">
                <div class="ui form segment" id="sideLogin">
                    <div class="field">
                        <div class="ui purple ribbon label">Username</div>
                        <div class="ui left labeled icon input">
                            <input type="text">
                            <i class="user icon"></i>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui purple ribbon label">Password</div>
                        <div class="ui left labeled icon input">
                            <input type="password">
                            <i class="lock icon"></i>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui fluid selection dropdown">
                            <input name="connect as" type="hidden">
                            <i class="dropdown icon"></i>
                            <div class="default text">Connect as</div>
                            <div class="menu">
                                <div class="item" data-value="admin" data-text="Admin">
                                    <i class="user icon"></i>
                                    ADMIN
                                </div>
                                <div class="item" data-value="operator" data-text="Operator">
                                    <i class="users icon"></i>
                                    OPERATOR
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui tiny red submit button"> Login </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Main body-->
        <h4 class="ui top center aligned attached inverted blue block header">
            LATEST NEWS
        </h4>
        <div class="ui segment attached">
            <ul id="slider1">
                <li><img src="img/Kucing Berdoa.jpg" alt="slide1" title="Kucing Berdoa"></li>
                <li><img src="img/Kucing Galau.jpg" alt="slide2" title="Kucing Galau"></li>
                <li><img src="img/Kucing Natal.jpg" alt="slide2" title="Kucing Natal"></li>
                <li><img src="img/Kucing Fotografer.jpg" alt="slide2" title="Kucing Fotografer"></li>
            </ul>
        </div>
        <h4 class="ui top center aligned attached inverted blue block header">
            UPCOMING EVENT @SABHA
        </h4>
        <div class="ui segment attached">
            <ul id="slider2">
                <li><img src="img/11.jpg" alt="slide1" title="Domo"></li>
                <li><img src="img/12.jpg" alt="slide2" title="AKB48"></li>
                <li><img src="img/13.jpg" alt="slide3" title="The North Face"></li>
            </ul>
        </div>
        <!--        <div class="ui grid">
                    <div class="thirteen wide column">
                        <div class="ui segment">
                        </div>
                    </div>
                    <div class="three wide column">
                        <div class="ui segment">
                            <h3>Coming Soon</h3>
                            <ul id="slider1">
                                <li><img src="img/11.jpg" alt="slide1" title="Echo ganteng"></li>
                                <li><img src="img/12.jpg" alt="slide2" title="AKB48"></li>
                                <li><img src="img/13.jpg" alt="slide3" title="The North Face"></li>
                            </ul>
                            <h3>Now Playing</h3>
                            <ul id="slider2">
                                <li><img src="img/11.jpg" alt="slide1" title="Echo ganteng"></li>
                                <li><img src="img/12.jpg" alt="slide2" title="AKB48"></li>
                                <li><img src="img/13.jpg" alt="slide3" title="The North Face"></li>
                            </ul>
                        </div>
                    </div>
                </div>-->
        <!--Script-->
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="bxslider/jquery.bxslider.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            //Reset dropdown value when reload
            var originalState = $('#sideLogin').clone();
            $('#sideLogin').replaceWith(originalState);
//            var originalState = $('.button.log-in').clone();
//            $('.button.log-in').replaceWith(originalState);

            $(document).ready(function() {
                //Slideshow 1
                $('#slider1').bxSlider({
                    speed: 1000, //transition speed
                    mode: 'horizontal', //transition mode
                    captions: true, //captions based on its title
                    auto: true, //auto slide
                    autoStart: true, //auto start when the page load
//                    autoHover: true, //auto pause when hovering
                    autoControls: false,
                    adaptiveHeight: true
//                    slideWidth: 400//width of slide
                });
                //Slideshow 2
//                $('#slider2').bxSlider({
//                    speed: 2000, //transition speed
//                    mode: 'horizontal', //transition mode
//                    captions: true, //captions based on its title
//                    auto: true, //auto slide
//                    autoStart: true, //auto start when the page load
////                    autoHover: true, //auto pause when hovering
//                    autoControls: false,
//                    adaptiveHeight: true
//                    slideWidth: 400//width of slide
//            });
                $('#slider2').bxSlider({
                    speed: 1000,
                    auto: true,
                    autoStart: true,
                    autoControls: false,
                    captions: true,
                    slideWidth: 300,
                    minSlides: 2,
                    maxSlides: 3,
                    moveSlides: 1,
                    slideMargin: 10
                });
                //Dropdown state change
                $('.ui.dropdown')
                        .dropdown({action: 'updateForm'});
                //Menu change handler
//                var $menuItem = $('.menu a.item'),
//                        handler = {
//                            activate: function() {
//                                $(this)
//                                        .addClass('active')
//                                        .closest('.ui.menu')
//                                        .find('.item')
//                                        .not($(this))
//                                        .removeClass('active')
//                                        .end;
//                            }
//                        };
//                $menuItem.
//                        on('click', handler.activate);
                //Login button handler
                $("#loginButton").click(function() {
                    $('.ui.black.sidebar')
                            .sidebar({
                                overlay: false,
                                transition: 'push'})
                            .sidebar('toggle');
                })
//                        .on('hover', function() {
//                            $('.sign in.icon')
//                                    .popup({
//                                        content: 'Admin or Operator'
//                                    })
//                                    .popup('toggle');
//                        })
                        ;
            });
        </script>
    </body>
</html>
