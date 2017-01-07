<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/7
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="../js/jquery-1.7.2.min.js" type="javascript"></script>
<script>
    $(function(){
        alert("ss");
        $("#addDiv").hide();
        $("#addRule").click(function(){
            $("#addDiv").toggle();
        });
    });

</script>
<body>
<div>
    <div>
        <label>错误类别：</label>
        <select>
            <option>BankCard</option>
            <option>SettleBill</option>
            <option>UnSetledBill</option>
        </select>
        <input type="button"  value="查询"/>

    </div>
    <div>
        <table>
            <tr>
                <th>id</th>
                <th>表名</th>
                <th>错误类别</th>
                <th>错误字段</th>
                <th>操作</th>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" />
                </td>
                <td>xxxxxx</td>
                <td>xxxxxx</td>
                <td>xxxxxx</td>
                <td>
                    <input id="edit" type="button" value="编辑"/>
                    <input id="del" type="button" value="删除"/>
                </td>
            </tr>
        </table>
    </div>
    <hr>
    <div id="addRule">添加规则</div>
    <div  id="addDiv">
        <label>开始添加规则</label>

    </div>

</div>

</div>
</body>

</html>
