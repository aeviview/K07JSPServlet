<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8"); //한글처리한다!

//web.xml에 설정된 초기화 파라미터를 가져온다(이미 지정되어 있는 내용이다)
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//bbs : Bulletin Board System 으로 전자게시판이라는 뜻이다
BbsDAO dao = new BbsDAO(drv, url); //DAO객체생성 및 DB커넥션!

/*
	파라미터를 저장할 용도로 생성한 Map컬렉션.
	여러개의 파라미터를 한꺼번에 저장한 후 DAO의 메소드를 호출할 때 전달.
	Map은 반드시 있을 필요는 없지만 없으면 귀찮은 일이 생긴다
		=> 차후 프로그램 업데이트에 의해 파라미터가 추가되더라도 Map을 사용하면 편하다!
*/
Map<String, Object> param = new HashMap<String, Object>();

//검색어가 입력된 경우 전송된 폼값을 받아 Map에 저장한다
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");

/*
	리스트 페이지에 최초 진입시에는 파라미터가 없으므로
	if로 구분하여 파라미터가 있을때만 Map에 추가한다.
*/
if(searchWord!=null)
{
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
}

//board테이블에 입력된 전체 레코드 갯수를 카운트하여 반환한다.
int totalRecordCount = dao.getTotalRecordCount(param);

//board테이블의 레코드를 select하여 결과셋을 List컬렉션으로 반환한다.
List<BbsDTO> bbs = dao.selectList(param);

//DB자원해제
dao.close();
%>

<!DOCTYPE html>
<html lang="en">
<!-- 긴 코드를 잘라내기 위해 include를 사용한다! -->
<jsp:include page="../common/boardHead.jsp" />
<body>
<div class="container">
	<div class="row">		
		<jsp:include page="../common/boardTop.jsp" />
	</div>
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp" />
		
		<div class="col-9 pt-3">
		
		<!-- ########## 게시판의 body 부분 start ########## -->
			<h3>게시판 - <small>이런저런 기능이 있는 게시판입니다.</small></h3>
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto">	
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<!-- 검색부분이 null값이 아니고 title이라면 selected 한다라는 뜻(밑에 표현식) -->
							<option value="title"
							<%=(searchColumn!=null && searchColumn.equals("title")) ? "selected" : "" %>>제목</option>
							<option value="content"
							<%=(searchColumn!=null && searchColumn.equals("title")) ? "selected" : "" %>>내용</option>
							<!-- 이름으로 검색하려면 JDBC와 Join이 필요하므로 차후 업뎃할께 -->
							<!-- <option value="id">작성자</option> -->
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="searchWord" class="form-control"/>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-warning">
								<i class='fa fa-search' style='font-size:20px'></i>
							</button>
						</div>
					</div>
				</form>	
			</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th width="10%">번호</th>
						<th width="50%">제목</th>
						<th width="15%">작성자</th>
						<th width="10%">조회수</th>
						<th width="15%">작성일</th>
					<!-- <th>첨부</th> -->
				</tr>
				</thead>
				<tbody>				
				
				<%
				/*
					List컬렉션에 입력된 데이터가 없을 때 true를 반환하는 if절!
				*/
				if(bbs.isEmpty()) //컬렉션에 데이터가 없을 때 true를 반환하는 함수 isEmpty()
				{
					//게시물이 없는경우!
				%>
					<tr>
						<td colspan="6" align="center" height="100">
							등록된 게시물이 없습니다^^
						</td>
					</tr>
				<%
				}
				else
				{
					//게시물이 있는경우! 가상번호 선언!
					int vNum = 0; //게시물의 가상번호로 사용할 변수
					int countNum = 0;
					
					/*
						컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 갯수만큼 증가
						즉, DB가 반환해준 레코드의 갯수만큼 반복하면서 출력한다.
					*/
					for(BbsDTO dto : bbs)
					{
						/*
							전체 레코드수를 이용하여 가상번호를 부여하고
							반복할 시에 1씩 차감한다.
							=> 이게 뭐냐면 게시판에 글이 하나 삭제 될 때,
							게시판의 일련번호가 -1되는 거라고 보면 된다!
						*/
						vNum = totalRecordCount --;
				%>		
						<!-- 리스트반복 start -->
						<tr>
			               <td class="text-center"><%=vNum %></td>
			               <td class="text-left">
			                  <a href="BoardView.jsp?num=<%=dto.getNum() %>">
			                     <%=dto.getTitle() %>
			                  </a>
			               </td>
			               <td class="text-center"><%=dto.getId() %></td>
			               <td class="text-center"><%=dto.getPostdate() %></td>
			               <td class="text-center"><%=dto.getVisitcount() %></td>
			               <!-- <td class="text-center"><i class="material-icons" style="font-size:20px">
			               								attach_file</i></td> -->
			            </tr>
						<!-- 리스트반복 end-->
				<%
					}//for-each문 끝
				}//if문 끝
				%>
				</tbody>
				</table>
					
			</div>
			
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
<!-- 					<button type="button" class="btn">Basic</button> -->
						<button type="button" class="btn btn-primary"
						onclick="location.href='BoardWrite.jsp';">글쓰기</button>
						<!-- 바깥쪽에는 더블쿼테이션 안쪽에는 싱글쿼테이션을 써야지 에러가 생기지 않는다! -->
<!-- 					<button type="button" class="btn btn-secondary">수정하기</button> -->
<!-- 					<button type="button" class="btn btn-success">삭제하기</button> -->
<!-- 					<button type="button" class="btn btn-info">답글쓰기</button> -->
<!-- 					<button type="button" class="btn btn-warning">리스트보기</button> -->
<!-- 					<button type="button" class="btn btn-danger">전송하기</button> -->
<!-- 					<button type="button" class="btn btn-dark">Reset</button> -->
<!-- 					<button type="button" class="btn btn-light">Light</button> -->
<!-- 					<button type="button" class="btn btn-link">Link</button> -->
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>		
						<li class="page-item active"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>		
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-right"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</div>				
			</div>		

		</div>
	</div>
	
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	
	<jsp:include page="../common/boardBottom.jsp" />

</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>

	아~~~~힘들다...ㅋ
 -->