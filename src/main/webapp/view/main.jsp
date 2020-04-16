<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
.recommend {
    background: #e66768;
    padding: 57px 0 62px 0;
}
.recommend h2 {
    text-align: center;
    font-size: 40px;
    color: #fff332;
    font-family: Microsoft YaHei,'NSB';
}
.recommend form {
    width: 840px;
    overflow: hidden;
    margin: 25px auto;
}
.field1 {
    width: 595px;
    float: left;
}
.recommend input {
    box-sizing: border-box;
    width: 595px;
    height: 59px;
    background: #fff url(/assets/_img/main/ico_srch_recommand-3c2b4b9….png) 96% center no-repeat;
    border: #a73f40 solid 1px;
    float: left;
    padding-left: 20px;
    font-size: 20px;
    color: #000;
    margin-bottom: 9px;
    outline: none;
}
.field1>ul {
    height: 270px;
    border: 1px solid #a73f40;
    background: #fff;
    float: left;
    overflow-x: hidden;
    overflow-y: visible;
}
.big_sort {
    width: 190px;
    margin-right: 9px;
    box-sizing: border-box;
}
.big_sort li {
    font-size: 15px;
    border-bottom: 1px solid #dddddd;
}
.big_sort li a {
    color: #cc4244;
    display: block;
    line-height: 44px;
    padding-left: 18px;
}
.small_sort {
    width: 396px;
    padding: 10px 13px;
    font-family: Microsoft YaHei,'NS';
    box-sizing: border-box;
}
.field2 {
    width: 235px;
    float: right;
}
.field2 dl {
    border: 1px solid #a73f40;
    background: #fff;
    position: relative;
}
.field2 dt {
    height: 59px;
    font-size: 20px;
    padding: 10px 15px;
    font-family: Microsoft YaHei,'NSL';
    box-sizing: border-box;
    color: #e66768;
    border-bottom: 1px solid #dddddd;
}
.field2 dd {
    height: 277px;
    box-sizing: border-box;
}
.field2 dd ul {
    height: 205px;
    padding: 12px 0;
    overflow-x: hidden;
    overflow-y: visible;
    box-sizing: border-box;
}
.field2 dd ul li.no-content {
    float: none;
    font-size: 17px;
    color: #b7b7b7;
    text-align: center;
    margin-top: 80px;
    padding: 0;
}
.field2 dd .btn {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 12px 16px;
    background-color: #fff;
}
.field2 dd .btn button {
    width: 194px;
    height: 48px;
    border-radius: 5px;
    border: 1px solid #e66768;
    background: #fff;
    color: #e66768;
    font-size: 15px;
}
</style>

<script type="text/javascript"> 

var email='${email}';
var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
$(document).ready(function(){
$("#emailform").submit(function(){
if ($('#email').val() == '') {
     alert('이메일주소를 입력해주세요');
     return false;
   }
if (exptext.test($('#email').val()) == false) {
	alert("이메일형식이 올바르지 않습니다.");
	document.getElementById('email').focus();
	return false;
}
if ($('#email') != null) {
    alert('이메일이 전송되셨습니다.')
  }
});
});

</script>
<%--  var message = '${msg}'; 
var returnUrl = '${url}'; 
alert(mag); 
document.location.href = url;   --%>
<body>

    <section id="home-section" class="hero">
        <div class="home-slider owl-carousel">
            <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-md-12 ftco-animate text-center">
                            <h1 class="mb-2"><spring:message code="mainslidetitle" />  </h1>
                            <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
                            <p><a href="#" class="btn btn-primary"><spring:message code="viewdetail" /></a></p>
                        </div>

                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-sm-12 ftco-animate text-center">
                            <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
                            <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
                            <p><a href="#" class="btn btn-primary"><spring:message code="viewdetail" /></a></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="recommend">
    	<div class="container">
    	<h2>내가 가진 재료로 레시피 추천받기</h2>
    	<form>
    	<fieldset class="field1">
    		<input type="text" class="search-ingre" placeholder="재료명으로 검색해보세요." autocomplete="off">
    		<ul class="big_sort">
    			<c:forEach var="nutrients" items="${nutrients}">
    			<li>
    				<a href="javascript:;">${nutrients}</a>
    			</li>
    			</c:forEach>
    		</ul>
    		<ul class="small_sort">
    			
    				
    		</ul>
    	</fieldset>
    	
    	<fieldset class="field2">
    		<dl>
    			<dt>내가 선택한 자료</dt>
    			<dd style="margin-bottom:0">
    				<ul class="selected-ingre">                  
                		<li class="no-content">재료를 선택해주세요.</li>
                	</ul>
                	<div class="btn">
                		<button type="submit">이 재료로 추천받기</button>
                	</div>
    			</dd>
    		</dl>
    	</fieldset>    				
    	</form>
    	</div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row no-gutters ftco-services">
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-shipped"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading"><spring:message code="chef_cir1" /></h3>
                            <span><spring:message code="chef_cir1_stxt" /></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-diet"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading"><spring:message code="chef_cir2" /></h3>
                            <span><spring:message code="chef_cir2_stxt" /></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-award"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading"><spring:message code="chef_cir3" /></h3>
                            <span><spring:message code="chef_cir3_stxt" /></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-customer-service"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading"><spring:message code="chef_cir4" /></h3>
                            <span><spring:message code="chef_cir4_stxt" /></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- <section class="ftco-section ftco-category ftco-no-pt">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                
                </div>
                 <div class="col-md-3">
                
                </div>
                 <div class="col-md-3">
                
                </div>
                 <div class="col-md-3">
                
                </div>
                </div>
                </div>
                </section> -->
    <section class="ftco-section ftco-category ftco-no-pt">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-6 order-md-last align-items-stretch d-flex">
                            <div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(images/category.jpg);">
                                <div class="text text-center">
                                    <h2>한 그릇의 품격</h2>
                                    <p>먹어는 봤나~</p>
                                    <p><a href="#" class="btn btn-primary">view +</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/category-1.jpg);">
                                <div class="text px-3 py-1">
                                    <h2 class="mb-0"><a href="#">Fruits</a></h2>
                                </div>
                            </div>
                            <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/category-2.jpg);">
                                <div class="text px-3 py-1">
                                    <h2 class="mb-0"><a href="#">Vegetables</a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/category-3.jpg);">
                        <div class="text px-3 py-1">
                            <h2 class="mb-0"><a href="#">Juices</a></h2>
                        </div>
                    </div>
                    <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/category-4.jpg);">
                        <div class="text px-3 py-1">
                            <h2 class="mb-0"><a href="#">Dried</a></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Home Chef</span>
                    <h2 class="mb-4">Best Store</h2>
                    <p>집에서도 만들어 먹을 수 있도록 홈쉐프만의 특급 레시피 밀키트</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="<%=request.getContextPath()%>/shopping/list" class="img-prod"><img class="img-fluid" src="images/product-1.jpg" alt="Colorlib Template">
                            <span class="status">30%</span>
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Bell Pepper</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-2.jpg" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Strawberry</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>$120.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-3.jpg" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Green Beans</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>$120.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-4.jpg" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Purple Cabbage</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>$120.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-5.jpg" alt="Colorlib Template">
                            <span class="status">30%</span>
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Tomatoe</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-6.jpg" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Brocolli</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>$120.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-7.jpg" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Carrots</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>$120.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a class="img-prod" href="#primary" data-toggle="modal">
                            <img class="img-fluid" src="images/product-8.jpg" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="#">Fruit Juice</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>$120.00</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                        <span><i class="ion-ios-menu"></i></span>
                                    </a>
                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <div class="container">
        <div class="row">
            <!-- Boxes de Acoes -->
            <div class="col-xs-12 col-sm-6 col-lg-8">
                <div class="box">
                    <div class="icon">
                        <div class="image"><i class="fa fa-soundcloud"></i></div>
                        <div class="info">

                            <!-- Modal -->
                            <div class="modal fade" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="slider_recipe">
                                            <div class="modal-header modal-header-primary">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <!-- <h1><i class="fa fa-bar-chart-o"></i> Client Reports</h1> -->
                                            </div>
                                            <div class="modal-body">
                                                <div class="sec_detail">
                                                    <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
                                                        <div class="carousel-inner">
                                                            <div class="carousel-item active">
                                                                <img src="images/food1.png" class="d-block w-100" alt="...">
                                                            </div>
                                                            <div class="carousel-item">
                                                                <img src="images/food2.jpeg" class="d-block w-100" alt="...">
                                                            </div>
                                                            <div class="carousel-item">
                                                                <img src="images/food1.png" class="d-block w-100" alt="...">
                                                            </div>
                                                        </div>
                                                        <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                        <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                            <span class="sr-only">Next</span>
                                                        </a>
                                                        <!--/.Controls-->
                                                        <ol class="carousel-indicators">
                                                            <li data-target="#carousel-thumb" data-slide-to="0" class="active"> <img class="d-block w-100" src="images/food1.png" class="img-fluid"></li>
                                                            <li data-target="#carousel-thumb" data-slide-to="1"><img class="d-block w-100" src="images/food2.jpeg" class="img-fluid"></li>
                                                            <li data-target="#carousel-thumb" data-slide-to="2"><img class="d-block w-100" src="images/food1.png" class="img-fluid"></li>
                                                        </ol>
                                                    </div>
                                                    <h2>영양정보<span>(하루 적정섭취량, 1인분 기준)</span></h2>
                                                    <h2>태그 정보</h2>
                                                    <h2>레시피 정보</h2>
                                                </div>
                                                <section class="sec_info">
                                                    <div class="aside">
                                                        <div class="top">
                                                            <div class="user">
                                                                <div class="img-cover">
                                                                    <a href="/profile/56">
                                                                        <img class="img_user" alt="" src="https://cloudfront.haemukja.com/vh.php?url=https://d1hk7gw6lgygff.cloudfront.net/uploads/user/image_file/56/thumb_2.jpg&amp;convert=jpgmin&amp;rt=600">
                                                                    </a>
                                                                </div>
                                                                <strong class="best"><a href="/profile/56">제이소다</a></strong>
                                                                <a target="_blank" href="http://blog.naver.com/prologue76">http://blog.naver.com/prologue76</a>
                                                            </div>

                                                            <h1>
                                                                부대찌개 맛있게 끓이는법~★
                                                                <strong>부대찌개</strong>
                                                            </h1>
                                                            <dl class="info_basic">
                                                                <dt class="time">조리시간</dt>
                                                                <dd>30분</dd>
                                                                <dt class="scrap">스크랩</dt>
                                                                <dd id="scrap-cnt">596</dd>
                                                                <!-- [D] 스크랩이 된 경우 :
														  <dt class="scrap on"><a href="#">스크랩</a></dt><dd>1,230</dd>
														  -->
                                                                <dt class="cal">칼로리</dt>
                                                                <dd>180.4 kcal</dd>
                                                            </dl>

                                                            <!-- [D] 버튼영역 추가 150314 -->
                                                            <div class="btn_area">
                                                                <form action="/bookmarks" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="JrdeLwIAsJoz2TbZWpLeD9W4Uni5B+173uSct89G4aXxaDw+MG/cEBaGB+8mp18r9xSbB/DEZsr19h3POOfebA==">
                                                                    <input type="hidden" name="linked_model_type" value="Recipe">
                                                                    <input type="hidden" name="linked_model_id" value="502">
                                                                    <button type="submit" class="btn_scrap">스크랩</button>
                                                                </form>
                                                            </div>
                                                            <!-- //버튼영역 추가 -->
                                                        </div>
                                                        <div class="mid">
                                                            <div class="share_area">
                                                                <ul>
                                                                    <li>
                                                                        <a href="javascript:;" class="fb-share" title="페이스북" data-url="https://haemukja.com/recipes/502"><img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_facebook-880fd35db6ca5773e84300f439878bf84d857d8f07e7f11638e4b42302995e49.png" alt="Ico facebook"></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:;" class="kakao-share" title="카카오스토리" data-url="https://haemukja.com/recipes/502" data-title="부대찌개 맛있게 끓이는법~★" data-desc="오랜만에 남편이 솜씨 좀 냈습니다 !! 남편이 저보다 요리를 더 잘 하거든요 ㅎ" data-img="https://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/5841/big_thumb_image.png"><img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_kakao-98fcf4e0b61235b23c1b79f7f0ca135132ed34986a999fc813f21006270ff680.png" alt="Ico kakao"></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:;" class="twt-share" title="트위터" data-text="부대찌개 맛있게 끓이는법~★" data-url="https://haemukja.com/recipes/502"><img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_twitter-91dabf8e5f2e6a6d5d7e24d23e2e97bc0b0dec449744d3d09c8517d28d8a8f57.png" alt="Ico twitter"></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:;" class="url-share" title="URL복사" data-url="https://haemukja.com/recipes/502"><img src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/recipe/ico_link-aea5416126998ebedd94eed415c80f247f802e116b2cd3f43661372731aadbb0.png" alt="Ico link"></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <a href="mailto:help@vitalhint.com" class="btn_report">신고하기</a>

                                                            <!-- [D] 신고하기 레이어
														  <div class="ly_report">
															<a href="javascript:;" class="btn_close">닫기</a>
															<dl>
															  <dt>신고하기</dt>
															  <dd>
																<input type="text" placeholder="제목을 입력하세요">
																<input type="email" placeholder="이메일을 입력하세요">
																<textarea></textarea>
															  </dd>
															</dl>
															<div class="btn_area">
															  <button type="button">취소</button>
															  <button type="button" class="btn_done">확인</button>
															</div>
														  </div>
														  <!-- 신고하기 레이어 -->

                                                        </div>

                                                        <div class="btm" style="position: relative; top: 0px; left: 0px; margin-left: 0px;">
                                                            <h2>재료리스트</h2>
                                                            <div class="dropdown">
                                                                2인 기준
                                                            </div>

                                                            <ul class="lst_ingrd">
                                                                <li><span>햄</span><em></em></li>
                                                                <li><span>오뎅</span><em></em></li>
                                                                <li><span>후추 약간</span><em></em></li>
                                                                <li><span>만두</span><em></em></li>
                                                                <li><span>청량고추</span><em></em></li>
                                                                <li><span>&lt;양념장&gt;</span><em></em></li>
                                                                <li><span>고추가루</span><em>1스푼</em></li>
                                                                <li><span>고추장</span><em>1스푼</em></li>
                                                                <li><span>다진마늘</span><em>1스푼</em></li>
                                                                <li><span>맛술</span><em>1스푼</em></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <!-- Modal -->
                        </div>
                    </div>
                </div>
                <div class="space"></div>
            </div>
        </div>
        <!-- /Boxes de Acoes -->
    </div>

    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_3.jpg);">
        <div class="container">
            <div class="row justify-content-center py-5">
                <div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
                    <span class="subheading">우리가 만드는 진짜 레시피</span>
                    <h2 class="mb-4">Home Chef</h2>

                </div>
                <div class="col-md-12">
                    <div class="col-md-12">

                        <div class="row">

                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="25486">0</strong>
                                        <span>총 쉐프수</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="124086">0</strong>
                                        <span>총 레시피수</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="54291">0</strong>
                                        <span>월 방문자수</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="486408">0</strong>
                                        <span>총 레시피 조회수</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
        <div class="container py-4">
            <div class="row d-flex justify-content-center py-5">
                <div class="col-md-6">
                    <h2 class="allia_txt ">제휴문의</h2>
                    <span>회원들과의 소통을 통한 자유 마케팅 활동</span>

                </div>
                <div class="col-md-6 d-flex align-items-center">
                    <form method="post" action="<%=request.getContextPath()%>/navermailtest" class="subscribe-form"  id="emailform">
                        <div class="form-group d-flex">
                            <input type="text" name="email"  id="email" class="form-control" placeholder="Enter email address">
                            <input type="submit" value="Subscribe" class="submit px-3">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>