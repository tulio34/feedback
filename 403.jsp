<%-- 
    Document   : 403
    Created on : 16/11/2016, 10:28:23
    Author     : italo.teixeira
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Acesso negado!<</title>
        <style>
            *{
                color: #333;
                font-size: 12px;
                font-family: verdana;
            }
            #container{
                margin: 0 auto;
                width: 900px;
            }
            #idioma{
                float:right;
            }
            h3{
                margin-bottom:40px;
            }
            #alerta{
                background:#F6F8EB;
                border:1px solid #96BC31;
                padding:10px 10px 10px 100px;
            }
            #alerta h4{
                color:#488A43;
            }
        </style>
    </head>
    <body>
        <table width="900" align="center">
            <tr>
                <td>
                    <h3>Permissão de acesso</h3>
                    <div id="alerta">
                        <h4>${pageContext.request.userPrincipal.name}</h4>
                        <p>O seu perfil não possue permissão para acessar essa página!</p>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
