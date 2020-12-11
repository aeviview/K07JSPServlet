package eltag;

import model.MemberDAO;

/*
  	<EL에서 Java클래스의 메소드 호출 절차 및 방법>
  	1. 클래스와 메소드를 정의한다.
  		단, 메소드 정의시 반드시 "public static"으로 선언해야 한다.
 */
public class MyTagLib 
{
	/*
	  	메소드설명 : 매개변수로 전달된 문자열에
	  			숫자가아닌 문자가 포함되어 있는지 확인하는 메소드이다.
	  			전체가 숫자이면 true를 반환하고, 아니면 false를 반환한다.
	  			ex) 1234 => true, 송30 => false
	 */
	public static boolean isNumber(String value)
	{
		char[] chArr = value.toCharArray();
		
		for(int i=0 ; i<chArr.length ; i++)
		{
			if(!(chArr[i]>='0' && chArr[i]<='9'))
			{
				return false;
			}
		}
		return true;
	}
	
/////////////////////////////////////////////////////////////////
	//주민등록번호 체크 함수
	
	/*
	 	메소드설명 : 매개변수로 주민번호를 전달받아 성별을 판단한다.
	 		주민번호는 하이픈(-)을 포함한 형태로 전달된다고 가정한다.
	 */
	public static String getGender(String jumin)
	{
		String returnStr = "";
		//indexOf()를 통해 -의 위치를 찾아서 1을 더한다!
		int beginIdx = jumin.indexOf("-") + 1;
		//위에서 구한 인덱스를 통해 성별에 해당하는 문자를 잘라서 가져온다
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		//beginIdx는 8번째 문자열, +1은 자른다는뜻이다. 즉, 8번째 문자열을 잘라서 genderStr 넣는거야
		
		//쉬운 비교를 위해 정수로 변환한다
		int genderInt = Integer.parseInt(genderStr);
		//조건을 통해서 남자와 여자를 판단한다
		if(genderInt==1 || genderInt==3)
			returnStr = "남자";
		else if(genderInt==2 || genderInt==4)
			returnStr = "여자";
		else
			returnStr = "주민번호 오류";
			
		return returnStr;
	}
	
/////////////////////////////////////////////////////////////////
	//ChooseWhenOtherwise.jsp의 연습문제
	//아이디/패스워드/DB연결을 위한 드라이버명, URL을 인자로 전달받아 회원여부를 판단하는 메소드!
	public static boolean memberLogin(String id, String pw, String drv, String url)
	{
		MemberDAO dao = new MemberDAO(drv, url);
		boolean isBool = dao.isMember(id, pw);
		return isBool;
	}
	
/////////////////////////////////////////////////////////////////	
	
	//메소드 테스트를 위한 main메소드
	public static void main(String[] args)
	{
		boolean result1 = isNumber("1234");
		boolean result2 = isNumber("송30");
		System.out.println("결과1 : " + result1);
		System.out.println("결과2 : " + result2);
	}
	
}
