<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>첨부 업로드</title>
</head>
<body>
      <form action="<%= application.getContextPath() %>/fileUpload"  method="post" enctype="multipart/form-data">
            파일 설명 : <input type="text" name="description"><br>
            파일1 : <input type="file" name="file1" multiple><br>
            파일2 : <input type="file" name="file2"><br>
            <input type="text" name="text"><br>
            <input type="submit" value="전송">
            <div class="card-body">
                                    <h4 class="card-title">회원 가입</h4>
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label">아이디</label>
                                        <div class="col-sm-9">
                                            <input type="text" maxlength="20" id="id" name="id"
										title="5~16자리의 영문+숫자 조합으로 입력해주세요"
										placeholder="이메일 형식으로 입력해 주세요" check_result="fail">  
										<button type="button" class="btn btn-primary" id="btn-idchk">중복확인</button>
										<!-- <img id="id_check_sucess" style="display: none;"> -->
                                        </div>
                                        <div class="col-sm-9 tdemail"></div>
                                        
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">비밀번호</label>
                                        <div class="col-sm-9">
                                           <input type="password" maxlength="20" id="pwd"
										name="pwd"
										title="8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다."
										placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="col-sm-9 tdpw"></div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email1" class="col-sm-3 text-right control-label col-form-label">비밀번호 확인</label>
                                        <div class="col-sm-9">
                                            <input type="password" maxlength="20" id="pwdCheck"
										name="pwdCheck" title="패스워드 확인" placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="col-sm-9 tdpwch"></div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">닉네임</label>
                                        <div class="col-sm-9">
                                           <input type="text" maxlength="20" id="nick"
										name="nick" title="닉네임" placeholder="사용할 닉네임을 입력해 주세요">
                                        </div>                                       
                                    </div>
      </form>
</body>
</html>

