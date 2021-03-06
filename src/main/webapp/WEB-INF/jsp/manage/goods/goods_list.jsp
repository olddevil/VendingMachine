<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>自动售货机管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="../../common/common_css.jsp" %>
</head>
<body>

<!--Header-part-->
<%@ include file="../../common/common_top.jsp" %>
<!--Header-part-->

<!--sidebar-menu-->
<%@ include file="../../common/common_left.jsp" %>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> 
      <a href="<%=basePath1%>welcome" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a>
      <a href="<%=basePath1%>goods/goodss" class="current">商品列表</a>
    </div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
    <div class="row fluid">
      <sf:form action="goodss" method="post" id="Paramform" class="form-horizontal">
      <input type="hidden" name="currentPage" id="currentPage" value="1" />
		<div class="span12">
		  <div class="widget-box">
		      <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                 <h5>商品列表</h5>
              </div>
              
			  <div class="widget-content">
			      <table style="margin-bottom:5px;">
			            <tr>
			              <th>商品名:</th>
			              <th><input type="text" name="goodsName" id="goodsName" placeholder="按商品名搜索"/>&nbsp;&nbsp;</th>
		                  <th><input type="submit" value="搜索" class="btn btn-info"/>&nbsp;&nbsp;</th>
		                  <shiro:hasPermission name="goods:add">
		                  <td><a href="add" class="btn btn-success"/>添加</a>&nbsp;&nbsp;</td>
		                  </shiro:hasPermission>
		                  <shiro:hasPermission name="goods:dels">
		                  <td><input type="button" onclick="dels('goods');" value="批量删除" class="btn btn-danger"/></td>
		                  </shiro:hasPermission>
		                </tr>
			      </table>
			
			      <table class="table table-bordered table-striped with-check">
			         <thead>
			            <tr>
			              <th><input type="checkbox" onclick="selectAll('Id');" id="all" name="title-table-checkbox" /></th>
		                  <th style="width:25px;">序号</th>
		                  <th>商品名</th>
		                  <th>价格</th>
		                  <th>商品描述</th>
		                  <th>操作</th>
		                </tr>
			         </thead>
			         <tbody>
			           <c:forEach items="${vendGoodss}" var="vendGoods" varStatus="st">
				           <tr class="gradeX">
					          <th><input type="checkbox" name="Id" id="Id" value="${vendGoods.id}"/></th>
					          <td style="text-align:center;">${st.index+1}</td>
			                  <td>${vendGoods.goodsName}</td>
			                  <td>${vendGoods.price}</td>
			                  <td>${vendGoods.goodsInfo}</td>
			                  <td class="center">
			                     <shiro:hasPermission name="goods:edit">
			                     <a href="${vendGoods.id}/edit" class="btn btn-success icon-edit"/></a>&nbsp;&nbsp;
			                     </shiro:hasPermission>
			                     <shiro:hasPermission name="goods:del">
			                     <a href="javascript:void(0);" onclick="delconfirm(${vendGoods.id});" class="btn btn-danger  icon-trash"/></a>
			                     </shiro:hasPermission>
			                  </td>
			                </tr>
			           </c:forEach>
			         </tbody>
			      </table>
			  </div>
			  <div class="pagination alternate">
	              <ul>
	                <li><a href="javascript:changeCurrentPage('1')">首页</a></li>
	                <li><a href="javascript:changeCurrentPage('${page.currentPage -1}')">上一页</a></li>
	                <li class="active"> <a href="#">${page.currentPage}/${page.totalPage}</a> </li>
	                <li><a href="javascript:changeCurrentPage('${page.currentPage+1}')">下一页</a></li>
	                 <li><a href="javascript:changeCurrentPage('${page.totalPage}')">尾页</a></li>
	                <li>&nbsp;&nbsp;&nbsp;&nbsp;跳至第&nbsp; 
	                   <input id="currentPageText" type='text' value='${page.currentPage}' style="width:27px;height:15px;" />&nbsp;页&nbsp;
	                   <a href="javascript:changeCurrentPage2()" style="float:right;">GO</a>
	                </li>
	              </ul>
             </div>
		  </div>
		</div>
     </sf:form>
    </div>
  </div>
</div>

<!--end-main-container-part-->

<!--Footer-part-->
<%@ include file="../../common/common_bottom.jsp" %>

<!--end-Footer-part-->
<%@ include file="../../common/common_js.jsp" %>
<script type="text/javascript">
function delconfirm(id){
	 if(confirm("确定要删除吗?")){
		window.location.href=basePath+"goods/"+id+"/del";
	 }
}
</script>
</body>
</html>
