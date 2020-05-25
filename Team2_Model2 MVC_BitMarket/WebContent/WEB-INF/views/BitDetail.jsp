<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>
<body class="body-wrapper">
	<section class="section-sm" id="maxwidth">
		<!-- Container Start -->
			<div class="col-md-12" style="background-color: white;">
				<div class="row mt-30" >
					<!-- Left sidebar -->
					<div class="col-sm-12 col-md-7" >
						<div class="product-details">
							<div id="carouselExampleIndicators" class="product-slider carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner" >
									<div class="carousel-item active" id="detailpro">
										<img class="d-block w-100" style="height: 100%;" src="images/products/products-1.jpg"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="height: 100%;" src="images/products/products-2.jpg"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="height: 100%;" src="images/products/products-3.jpg"
											alt="Third slide">
									</div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
									data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
									data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>

						</div>
					</div>
					<div class="col-sm-12 col-md-5" style="margin-top: 50px;">
						<h2 class="product-title"> 맥북 15 인치 팝니다.</h2>
						<h1 class="product-title"> 3,000,000 원</h1>
						<hr>
						<div class="product-meta" >
							<ul class="list-inline">
								<li class="list-inline-item"><i class="fa fa-folder-open-o"></i> 카테고리<a href="">디지털/가전</a></li>
							</ul>
							
							<ul class="list-inline">
							<li class="list-inline-item"><i class="fa fa-heart"></i><a href="">10분전</a></li>
								<li class="list-inline-item"><i class="fa fa-eye"></i> 조회<a href="">32</a></li>
							</ul>
						</div>
						<hr>
						
							<div class="row">
								<!-- User Profile widget -->
								<div class= "col-sm-12 col-md-2" >
									<img class="rounded-circle" style="width: inherit; max-width: 100%; margin-bottom: 30px;" src="images/user/user-thumb.jpg" alt="">
									
								</div>
								<div class="col-sm-12 col-md-10" >
								<h4><a href="">미네미네</a></h4>
									<p class="member-time">동작구 사당동</p>
									
								</div>
								
							</div>
						
					</div>

				</div>
				<hr>

				<div>

					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
							aria-labelledby="pills-home-tab">
							<h3 class="tab-title">상품 정보</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia laudantium beatae quod
								perspiciatis, neque dolores eos rerum, ipsa iste cum culpa numquam amet provident
								eveniet
								pariatur, sunt repellendus quas voluptate dolor cumque autem molestias. Ab quod quaerat
								molestias culpa eius, perferendis facere vitae commodi maxime qui numquam ex voluptatem
								voluptate, fuga sequi, quasi! Accusantium eligendi vitae unde iure officia amet
								molestiae
								velit assumenda, quidem beatae explicabo dolore laboriosam mollitia quod eos, eaque
								voluptas
								enim fuga laborum, error provident labore nesciunt ad. Libero reiciendis necessitatibus
								voluptates ab excepturi rem non, nostrum aut aperiam? Itaque, aut. Quas nulla
								perferendis
								neque eveniet ullam?</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam sed, officia
								reiciendis
								necessitatibus obcaecati eum, quaerat unde illo suscipit placeat nihil voluptatibus ipsa
								omnis repudiandae, excepturi! Id aperiam eius perferendis cupiditate exercitationem,
								mollitia numquam fuga, inventore quam eaque cumque fugiat, neque repudiandae dolore qui
								itaque iste asperiores ullam ut eum illum aliquam dignissimos similique! Aperiam aut
								temporibus optio nulla numquam molestias eum officia maiores aliquid laborum et officiis
								pariatur, delectus sapiente molestiae sit accusantium a libero, eligendi vero eius
								laboriosam minus. Nemo quibusdam nesciunt doloribus repellendus expedita necessitatibus
								velit vero?</p>

						</div>


					</div>
				</div>
				<hr>
				<div >
					<h4>상품 문의</h4>
					<form action="#">
						<!-- Message -->
						<div >
							<label for="message">Message</label>
							<textarea class="form-control" id="message" rows="8"></textarea>
						</div>
						<div class="d-flex flex-row-reverse">
						<button class="btn btn-transparent">등록</button>
						<div class="form-group form-check">
							<label class="form-check-label">
							  <input class="form-check-input" type="checkbox" name="remember"> 비밀댓글 등록하기
							</label>
						</div>
					</div>
					</form>
				</div>

			</div>

			
		
	</section>

<%@ include file="/Include/footer.jsp"%>
</body>

</html>