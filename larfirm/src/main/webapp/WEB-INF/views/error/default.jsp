<%--
  Created by IntelliJ IDEA.
  User: dkask
  Date: 2020-11-01
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
code : ${es.code}
history : ${es.historyBack}
<script>
   <c:if test="${true eq es.historyBack}">
        alert('${es.message}');
        history.back();
   </c:if>

</script>
</body>
</html>
