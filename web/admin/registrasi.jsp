<%-- 
    Document   : registrasi
    Created on : Apr 12, 2017, 12:13:43 PM
    Author     : edwin < edwinkun at gmail dot com >
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrasi Pengguna</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="/JWP01-UAS/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0; 
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Sistem Registrasi</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="/JWP01-UAS/admin/dosen.jsp">Dosen</a></li>
                        <li><a href="/JWP01-UAS/admin/LogoutServlet">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End of Header -->
        
        <!-- Container -->
        <div class="container" style="padding-top: 60px;">
            <form class="form-horizontal" id="form1" action="/JWP01-UAS/admin/RegistrasiServlet" method="POST">
                <fieldset>

                    <legend>Registrasi User</legend>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Username</label>  
                        <div class="col-md-4">
                            <input id="hidden1" name="id" type="hidden" value="<%= request.getAttribute("id") == null?"":request.getAttribute("id") %>">
                            <input id="nama" name="username" placeholder="Username Anda" class="form-control input-md" type="text" value="<%= request.getAttribute("username") == null?"":request.getAttribute("username") %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Password</label>  
                        <div class="col-md-4">
                            <input id="nama" name="password" placeholder="Password Anda" class="form-control input-md" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Nama</label>  
                        <div class="col-md-4">
                            <input id="nama" name="nama" placeholder="Nama Anda" class="form-control input-md" type="text" value="<%= request.getAttribute("nama") == null?"":request.getAttribute("nama") %>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="singlebutton"></label>
                        <div class="col-md-4">
                            <button id="simpan" type="submit" name="simpan" class="btn btn-primary">Simpan</button>
                        </div>
                    </div>

                </fieldset>
            </form>
            
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Nama</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="isiTable">
                    <% 
                        String[][] data = (String[][])request.getAttribute("data");
                        for(int i = 0; i < data.length; i++) {                                                    
                    %>
                    
                    <tr>
                        <td>
                            <%= data[i][0] %>
                        </td>
                        <td>
                            <%= data[i][1] %>
                        </td>
                        <td>
                            <%= data[i][2] %>
                        </td>
                        <td>
                            <%= data[i][3] %>
                        </td>
                        <td>
                            <a href="/JWP01-UAS/admin/RegistrasiServlet?id=<%=data[i][0]%>">Edit</a>
                        </td>
                        <td>
                            <a href="/JWP01-UAS/admin/RegistrasiServlet?hapus=<%=data[i][0]%>">Hapus</a>
                        </td>
                    </tr>
                    
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!-- End of Container -->
        
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p class="text-muted">JWP - UBL 2017</p>
            </div>
        </footer>
        <!-- End of Footer -->
        
        <script type="text/javascript" src="/JWP01-UAS/js/jquery.js"></script>
        <script type="text/javascript" src="/JWP01-UAS/js/bootstrap.js"></script>
    </body>
</html>