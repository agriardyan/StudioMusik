<%-- 
    Document   : halaman-home-studio
    Created on : Nov 15, 2014, 10:26:47 AM
    Author     : Lorencius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        @font-face{
            font-family: "Amplify_PersonalUseOnly";
            font-weight: bold;
            font-size: large;
            src: url('Amplify_PersonalUseOnly.ttf');
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMS</title>
        <link rel="shortcut icon" href="img/" type="image/png">
        <link href="semantic-ui/packaged/css/semantic.css" rel="stylesheet" type="text/css">
    </head>
    <body style="
          background-image: url('img/Studio.jpg'); 
          background-repeat: no-repeat; 
          background-size: cover; 
          background-attachment: fixed; 
          background-position: center;
          opacity: 0.9;">
        <div class="ui grid">
            <div class="row">
                <div class="six wide column">
                    <div class="ui basic segment" style="
                         width: 90%; 
                         position: absolute;">
                        <form method="POST">
                            <h1 style="font-family: 'Amplify_PersonalUseOnly'; font-size: 500%; color: white">
                                Sabha Music Studio
                            </h1>
                            <div class="form segment" id="mtixSignin">
                                <div class="field">
                                    <div class="ui ribbon label">Username</div>
                                    <div class="ui left labeled icon input">
                                        <input name="username" type="text" placeholder="Username">
                                        <i class="user icon"></i>
                                    </div>
                                </div>
                                <br>
                                <div class="field">
                                    <div class="ui ribbon label">Password</div>
                                    <div class="ui left labeled icon input">
                                        <input name="password" type="password" placeholder="Password">
                                        <i class="lock icon"></i>
                                    </div>
                                </div>
                                <br>
                                <div class="field">
                                    <div class="ui ribbon label">Connect as</div>
                                    <div class="ui toggle checkbox">
                                        <input id="check1" type="checkbox">
                                        <label for="check1" style="font-family:  fantasy; color: white">Admin</label>
                                    </div>
                                    <div class="ui toggle checkbox">
                                        <input id="check2" type="checkbox">
                                        <label for="check2" style="font-family:  fantasy; color: white">Operator</label>
                                    </div>
                                </div>
                                <br>
                                <div class="field">
                                    <input class="ui tiny submit button" type="submit" name="commit" value="Login">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="semantic-ui/packaged/javascript/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="semantic-ui/packaged/javascript/semantic.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
            });
        </script>
    </body>
</html>
