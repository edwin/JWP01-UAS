<%-- 
    Document   : dosen
    Created on : May 22, 2017, 12:36:26 PM
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
    <body onload="callAjax()">
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
                        <li><a href="#">Home</a></li>
                        <li class="active"><a href="/JWP01-UAS/admin/dosen.jsp">Dosen</a></li>
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

                    <legend>Registrasi Dosen</legend>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ID Dosen</label>  
                        <div class="col-md-4">
                            <input id="hidden1" name="id" type="hidden" value="">
                            <input id="iddosen" name="iddosen" placeholder="ID Dosen" class="form-control input-md" type="text" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Nama Dosen</label>  
                        <div class="col-md-4">
                            <input id="namadosen" name="namadosen" placeholder="Nama Dosen" class="form-control input-md" type="text" value="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="singlebutton"></label>
                        <div class="col-md-4">
                            <button id="simpan" onclick="save()" type="button" name="simpan" class="btn btn-primary">Simpan</button>
                        </div>
                    </div>

                </fieldset>
            </form>
            
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>Id Dosen</th>
                        <th>Nama Dosen</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="isiTable">
                    <tr>
                    </tr>
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
        
        <script>
            function getAjax(url, success) {
                var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                xhr.open('GET', url);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState > 3 && xhr.status == 200)
                        success(xhr.responseText);
                };
                xhr.send();
                return xhr;
            }
            
            function save() {
                var iddosen = document.getElementById('iddosen').value;
                var namadosen = document.getElementById('namadosen').value;
                
                getAjax('/JWP02-UAS/AddDosenServlet?iddosen='+iddosen+"&namadosen="+namadosen, function(data){ 
                    callAjax();
                });
            }
            
            function deleteDosen(iddosen) {
                getAjax('/JWP02-UAS/DeleteDosenServlet?iddosen='+iddosen, function(data){ 
                    callAjax();
                });
            }
            
            function getDosen(iddosen) {
                getAjax('/JWP02-UAS/GetDosenServlet?iddosen='+iddosen, function(data){ 
                    var obj = JSON.parse(data);
                    document.getElementById("iddosen").value = obj.iddosen;
                    document.getElementById("namadosen").value = obj.namadosen;
                });
            }
            
            function callAjax() {
                document.getElementById("iddosen").value = "";
                document.getElementById("namadosen").value = "";
                    
                getAjax('/JWP02-UAS/DosenServlet', function(data){ 
                    var obj = JSON.parse(data);
                    var isiTable = document.getElementById("isiTable");
                    isiTable.innerHTML = "";
                    
                    var content = "";
                    for(var i = 0; i < obj.dosens.length; ++i) {
                        var iddosen = obj.dosens[i]["iddosen"];
                        var namadosen = obj.dosens[i]["namadosen"];
                        content += "<tr><td>"+iddosen+"</td><td>"+namadosen+"</td><td><a onclick=\"getDosen('"+iddosen+"');\" href=\"#\">Edit</a></td><td><a onclick=\"deleteDosen('"+iddosen+"');\" href=\"#\">Hapus</a></td></tr>"
                    }
                    isiTable.innerHTML = content;
                });
            }
        </script>
    </body>
</html>