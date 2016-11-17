<%-- 
    Document   : avaliar
    Created on : 07/11/2016, 19:04:53
    Author     : italo.teixeira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html ng-app="telaAvaliar">

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avaliação de PDA</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon2.ico">
        <link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
        
<!--    <link src="bootstrap/css/bootstrap.css">-->
        <link href="css/estilo_tela_avaliar.css" type="text/css" rel="stylesheet">
        
        <script src="angular/angular.js"></script>
        
        <script>
            angular.module("telaAvaliar", []);
            angular.module("telaAvaliar").controller("telaAvaliarCtrl", function ($scope, $http) {
                $scope.salvar = salvar;
                $scope.avisoSucesso = false;
                $http.get("api/colaborador").
                        success(function(data) {
                            $scope.colaboradores= data;
                        })

                function salvar() {
                        $scope.avaliacao.dataAvaliacao = new Date().getTime();
                    $http.post("api/avaliacao", $scope.avaliacao).then(function(){$scope.avisoSucesso = true; $scope.avaliacao.numeroChamado = null;
                        $scope.avaliacao.colaborador = null; 
                        $scope.avaliacao.dataAtendimento = null;
                        $scope.avaliacao.historico = null;
                        $scope.avaliacao.nivel = null;
                });
                }
                 
                $scope.confirmaSair = function(){
                    var sair = confirm("Confirmar saida da avaliação?");
                    if (sair){
                            window.location.href="tela_login.html";
                    }
                }
           
            })

        </script>

    </head>

    <body ng-controller="telaAvaliarCtrl">
        <!-- <h1 ng-bind=" ''"></h1> -->
        
        <nav class="navbar navbar-default">
            
            <div class="container-fluid">
                
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand">Avaliação de PDA</a> 
                    <!--<img src="img/logomarca2.png" width="100px" height="50px">-->
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <div class="navbar-cabecalho" style="float: right;">
                    <form class="navbar-form navbar-left">
                        <button type="button" class="btn btn-danger" ng-click="confirmaSair()">Sair da avaliação</button>
                    </form>
                </div>           
            </div>         
        </nav>
        
        <div class="div-logomarca">
                <img src="img/logomarca1.png" class="logo"/>
        </div>
        
        <div class="div-cinza">
            
            <div class="container" style="margin: auto;">

                <form name="formAvaliar">

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="chamado">Número do chamado:&nbsp;</label>
                        <div class="col-sm-7" ng-class="{'has-error': formAvaliar.n_chamado.$error.pattern}">
                            <input type="text" class="form-control" name="n_chamado" id="chamado" placeholder="Nº do chamado" ng-model="avaliacao.numeroChamado" ng-pattern="/^[0-9]{0,10}$/" ng-required="true"/>
                        </div> 
                    </div>
                    <br><br>

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="repeatSelect">Atendente:&nbsp;</label>
                        <div class="col-sm-7">
                            <select name="repeatSelect" class="form-control" id="repeatSelect" ng-options="colaboradores.nome for colaboradores in colaboradores" 
                                ng-model="avaliacao.colaborador" ng-required="true">             
                            </select>            
                        </div>
                    </div>

                    <br><br>

                    <div class="form-group ">
                        <label class="control-label col-sm-3" for="dataAtt">Data do atendimento:&nbsp;</label>
                        <div class="col-sm-7">
                            <input type="date" class="form-control " name="data_atendimento" id="dataAtt" ng-model="avaliacao.dataAtendimento" placeholder="Data de atendimento" ng-required="true"/>
                        </div>
                    </div>

                   <br><br>

                    <div class="form-group">
                        <label for="historico" class="col-sm-3 control-label">Descrição: </label>
                        <div class="col-sm-7">
                            <textarea class="form-control" rows="5" name="message" id="historico" placeholder="Historico" ng-model="avaliacao.historico" ng-required="true"></textarea>
                        </div>
                    </div>
                   
                   <br><br> <br><br>

                    <div class="form-group"> 
                        <label class="control-label col-sm-3" for="nivel" style="margin-top: 20px;">Nível: </label>
                        <div class="col-sm-7">
                            <select class="form-control" id="nivel" style="margin-top: 15px;" ng-model="avaliacao.nivel" ng-required="true">
                                <option value="5">Excelente</option>
                                <option value="4">Bom</option>
                                <option value="3">Regular</option>
                                <option value="2">Ruim</option>
                                <option value="1">Péssimo</option>
                            </select>
                        </div>
                    </div> 

                </form>

                <div class="div-botoes" style="margin-right: 45%; margin-top: 30px;">   
                    
                    <div class="botoes">
                        <button type="button" class="btn btn-success" ng-click="salvar()" ng-disabled="formAvaliar.$invalid">Enviar</button>
                        <!--<input type="button" value="confirmar" ng-click="salvar()"/>-->
                    </div>

                    <div class="botoes">
                        <button type="button" class="btn btn-danger" ng-click="confirmaSair()">Cancelar</button>
                    </div>

                </div>
                

            </div>
            
              <div class="alert alert-danger fade in" ng-if="formAvaliar.n_chamado.$error.pattern">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                O número do chamado contém apenas números.
              </div>
                
             <div class="alert alert-success fade in" ng-if="avisoSucesso === true">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              Enviado com sucesso. Agradecemos a sua avaliação!
             </div>
                     
        </div>
            
            
    </body>
    
    <footer>            
        <div style="float: right; margin-right: 36.5%; margin-top: 5%;">
            <h3 class="naoSelecionavel" unselectable="on">
                Software desenvolvido pelos alunos do projeto Jovem Técnico MV 
            </h3>
        </div>
    </footer>

</html>
