<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style>
.content_wrap {
	   width: 80%;
	   float:left;
	   min-height:700px;
}
.content_subject {
	   font-size: 40px;
	   font-weight: bolder;
	   padding-left: 15px;
	   background-color: gray;
	   height: 80px;
	   line-height: 80px;
	   color: white;	
}
.table_wrap {
    	padding: 20px 35px;
}
.table {
	width: 100%;
   	border: 1px solid #d3d8e1;
    	text-align: center;
    	border-collapse: collapse;
}
.table td {
	padding: 10px 5px;
	border : 1px solid #e9ebf0;
}
.table thead {
	background-color: #f8f9fd;	
	font-weight: 600;
}
.th_column_1{
	width:120px;
}
.th_column_3{
	width:110px;
}
.th_column_4{
	width:140px;
}
.th_column_5{
	width:140px;
}
.th_column_6{
	width:50px;
}
a {
	text-decoration: none;
}
ul {
	list-style: none;
	text-align: center;
}
</style>
<div class="content_wrap">
    <div class="content_subject"><h4>���� ���</h4></div>
    
   <div class="col-sm-12 col-md-6">
	<form action="/shop/list" method="get">
		<div class="input-group mb-3">
		<c:set value="${pgn.pgvo.type }" var="typed"/>
  			<select class="form-select" name="type">
    			<option ${typed == null ? 'selected':'' }>Choose...</option>
    			<option value="n" ${typed eq 'n' ? 'selected':'' }>��ǰ�̸�</option>
    			<option value="d" ${typed eq 'd' ? 'selected':'' }>��ǰ��ȣ</option>
    			<option value="m" ${typed eq 'm' ? 'selected':'' }>�̸���</option>
    			<option value="nd" ${typed eq 'nd' ? 'selected':'' }>��ǰ�̸� or ��ǰ��ȣ</option>
    			<option value="dm" ${typed eq 'dm' ? 'selected':'' }>��ǰ��ȣ or �̸���</option>
    			<option value="nm" ${typed eq 'nm' ? 'selected':'' }>��ǰ�̸� or �̸���</option>
  			</select>
  			<input class="form-control" type="text" name="keyword" placeholder="Search" value="${pgn.pgvo.keyword }">
  			<input type="hidden" name="pageNo" value="1">
  			<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
  			<button type="submit" class="btn btn-success position-relative">
  			Search
  			<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    		${pgn.totalCount }
    		<span class="visually-hidden">unread messages</span></span>
  			</button>
		</div>
	</form>
	</div> 
    
    <div class="table_wrap">
         <table class="table">
	   <thead>
	       <tr>
	            <td class="th_column_1">��ǰ��ȣ</td>
	            <td class="th_column_2">�̸���</td>
	            <td class="th_column_3">��ǰ�̸�</td>
	            <td class="th_column_4">ī�װ�</td>
	            <td class="th_column_5">����</td>
	            <td class="th_column_6">��ǰ����</td>
	       </tr>	   
	   </thead>
	   <tbody>
	   <c:forEach items="${list }" var="svo">
	       <tr>
	           <td>${svo.sid}</td>
	           <td><a href="/shop/detail?sid=${svo.sid}&pageNo=${pgn.pgvo.pageNo}&qty=${pgn.pgvo.qty}">${svo.email }</a></td>
	           <td>${svo.sname}</td>
	           <td>${svo.category}</td>
	           <td>${svo.price}</td>
	           <td>${svo.value}</td>
	       </tr>
	   </c:forEach>    
	   </tbody>      
         </table>
       
 	
         
         <!-- paging -->
         <ul class="pagination justify-content-center">
	<c:if test="${pgn.prev }">
    	  <li class="page-item">
      	  <a href="/shop/list?pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}" class="page-link">Prev</a>
    	  </li>
          </c:if>
          <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
            <li class="page-item ${pgn.pgvo.pageNo == i ? 'active':''}"
            aria-current="page">
            <a class="page-link" href="/shop/list?pageNo=${i }&qty=${pgn.pgvo.qty}">${i }</a>
            </li>
          </c:forEach>
          <c:if test="${pgn.next }">
            <li class="page-item">
            <a class="page-link" href="/shop/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}">Next</a>
            </li>
         </c:if>
        </ul>
    </div>
</div>
<script>
let isUp = '<c:out value="${isUp}"/>';
let isDel = '<c:out value="${isDel}"/>';
if (parseInt(isUp)) {
	alert('���Ű� �Ϸ� �Ǿ����ϴ�');
}
if (parseInt(isDel)) {
	alert('���� ���� �Ǿ����ϴ�');
}



</script>