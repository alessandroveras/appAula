<%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 18/12/2021
  Time: 03:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>AppAulas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
</head>
<body>

<c:import url="/WEB-INF/jsp/menu.jsp"/>

<div class="container mt-3">

    <c:if test="${not empty mensagem}">
        <div class="alert alert-success alert-dismissible fade show">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Confirmação!</strong> ${mensagem}
        </div>
    </c:if>

    <h2>Cadastramento de Atividades de Musculacao</h2>

    <form action="/musculacao" method="get">
        <button type="submit" class="btn btn-primary">Novo</button>
    </form>

    <hr>

    <c:if test="${not empty lista}">

        <h2>Total de Atividades de Musculacao: ${lista.size()}</h2>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>Id</th>
                <th>Descricao</th>
                <th>DuracaoMinutos</th>
                <th>Intensidade</th>
                <th>Supervisionada</th>
                <th>GrupamentoMuscular</th>
                <th>Aparelho</th>
                <th>Carga</th>
                <th>CaloriasPorMinuto</th>
                <th></th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="musculacao" items="${lista}">
                <tr>
                    <td>${musculacao.id}</td>
                    <td>${musculacao.descricao}</td>
                    <td>${musculacao.duracaoMinutos}</td>
                    <td>${musculacao.intensidade}</td>
                    <td>${musculacao.supervisionada}</td>
                    <td>${musculacao.grupamentoMuscular}</td>
                    <td>${musculacao.aparelho}</td>
                    <td>${musculacao.carga}</td>
                    <td>${musculacao.caloriasPorMinuto}</td>
                    <td><a href="/musculacao/${musculacao.id}/excluir">Excluir</a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </c:if>

    <c:if test="${empty lista}">
        <h2>Não existem atividades de musculacao cadastradas!!!</h2>
    </c:if>

</div>
<script type="text/javascript">
    window.setTimeout(function () {
        $(".alert-success").fadeTo(500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 3000);
</script>
</body>

</html>
