<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div class="container">
    <div class="row">
        <h1 class="jumbotron" style="text-align: center; margin: 50px 0;">���ŵ��</h1>
    </div>
    <div class="form-group shopInfo">
       <form action="/shop/register" method="post" id="enrollForm">
            <div>
                 <label for="sid">��ǰ��ȣ</label> 
                 <input type="text" class="form-control" name="sid"
               id="sid" value="${svo.sid }">
            </div>
            <div>
                 <label for="email">�̸���</label> 
                 <input type="email" class="form-control" name="email"
               id="email" value="${svo.email }">
            </div>
            <div>
                 <label for="sid">��ǰ�̸�</label> 
                 <input type="text" class="form-control" name="sname"
               id="sname" value="${svo.sname }">
            </div>
            <div>
                 <label for="category">ī�װ�</label> 
                 <input type="text" class="form-control" name="category"
               id="category" value="${svo.category }">
            </div>
            <div>
                 <label for="price">����</label> 
                 <input type="text" class="form-control" name="price"
               id="price" value="${svo.price }">
            </div>
            <div>
                 <label for="value">��ǰ����</label> 
                 <input type="text" class="form-control" name="value"
               id="value" value="${svo.value }">
            </div>
            <div class="btn_section">
                <button id="reg" class="btn" type="submit">���</button>
            </div>
       </form>
    </div>
</div>