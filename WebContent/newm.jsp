<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html,body{	padding:0px; margin:0px; width:100%; height:100%	}
	table{	border-spacing:0px;	}
	td{	padding:0px; }
	a{	text-decoration:none;	}
	.lgnform{width:400px;  color: #565656;
    padding: .5rem; display: inline-block; border: 1px solid #ccc; box-shadow: inset 0 1px 3px #ddd;
    border-radius: 4px; vertical-align: middle; box-sizing: border-box; font-size: inherit;
	}
	.lgnbtn{
	background-color:#929add; color:#fff; display:block; position:relative; overflow:hidden; font-size: 1.2rem; width:400px; padding:.5rem;
	}
	.age{
	width:80px; padding:.5rem; display: inline-block; border: 1px solid #ccc; box-shadow: inset 0 1px 3px #ddd; border-radius: 4px; vertical-align: middle; box-sizing: border-box; font-size: inherit;
}
</style>
</head>
<body>

<table width=100% height=100% align=center style="background-image: url(/cupid/img/hhhhh.png);  background-repeat: no-repeat; background-size:100%; content:''; opacity : 0.8; filter:alpha(opacity=80); z-index:-1;">
	<tr>
		<td width=15%>			
		</td>
		<td width=70%>
			<table width=100%>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>				
				<tr>
					<td width=35%>
					</td>
					<!-- 폼이 테이블을 감싸면 형태가 엉클어짐 -->
					<form name="signin" onsubmit="return send()" action=".do" method="post">
					<td width=60% height=40px style="font-size:30px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						간단한 회원가입
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>
				<tr>
					<td height=40px align=right>
						이름
						&nbsp;&nbsp;
					</td>
					<td>
						 <input type="text" name="name" class="lgnform">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>
				<tr>
					<td height=40px align=right>
						성별
						&nbsp;&nbsp;
					</td>
					<td>
						<table width=400px>
							<tr>
								<td height=40px>
									<label title="남성"> <input type="radio" name="gender" value="boy">남자</label>
									<label title="여성"> <input type="radio" name="gender" value="girl">여자</label>
								</td>
								<td align=right>
									<label>나이</label>
									<select name="age" class="age">
										<option value=""></option>
					
										<option value="18">18</option>
					
										<option value="19">19</option>
					
										<option value="20">20</option>
					
										<option value="21">21</option>
					
										<option value="22">22</option>
					
										<option value="23">23</option>
					
										<option value="24">24</option>
					
										<option value="25">25</option>
					
										<option value="26">26</option>
					
										<option value="27">27</option>
					
										<option value="28">28</option>
					
										<option value="29">29</option>
					
										<option value="30">30</option>
					
										<option value="31">31</option>
					
										<option value="32">32</option>
					
										<option value="33">33</option>
					
										<option value="34">34</option>
					
										<option value="35">35</option>
					
										<option value="36">36</option>
					
										<option value="37">37</option>
					
										<option value="38">38</option>
					
										<option value="39">39</option>
					
										<option value="40">40</option>
					
										<option value="41">41</option>
					
										<option value="42">42</option>
					
										<option value="43">43</option>
					
										<option value="44">44</option>
					
										<option value="45">45</option>
					
										<option value="46">46</option>
					
										<option value="47">47</option>
					
										<option value="48">48</option>
					
										<option value="49">49</option>
					
										<option value="50">50</option>
					
										<option value="51">51</option>
					
										<option value="52">52</option>
					
										<option value="53">53</option>
					
										<option value="54">54</option>
					
										<option value="55">55</option>
					
										<option value="56">56</option>
					
										<option value="57">57</option>
					
										<option value="58">58</option>
					
										<option value="59">59</option>
					
										<option value="60">60</option>
					
										<option value="61">61</option>
					
										<option value="62">62</option>
					
										<option value="63">63</option>
					
										<option value="64">64</option>
					
										<option value="65">65</option>
					
										<option value="66">66</option>
					
										<option value="67">67</option>
					
										<option value="68">68</option>
					
										<option value="69">69</option>
					
										<option value="70">70</option>
					
										<option value="71">71</option>
					
										<option value="72">72</option>
					
										<option value="73">73</option>
					
										<option value="74">74</option>
					
										<option value="75">75</option>
					
										<option value="76">76</option>
					
										<option value="77">77</option>
					
										<option value="78">78</option>
					
										<option value="79">79</option>
					
										<option value="80">80</option>
					
										<option value="81">81</option>
					
										<option value="82">82</option>
					
										<option value="83">83</option>
					
										<option value="84">84</option>
					
										<option value="85">85</option>
					
										<option value="86">86</option>
					
										<option value="87">87</option>
					
										<option value="88">88</option>
					
										<option value="89">89</option>
					
										<option value="90">90</option>
					
										<option value="91">91</option>
					
										<option value="92">92</option>
					
										<option value="93">93</option>
					
										<option value="94">94</option>
					
										<option value="95">95</option>
					
										<option value="96">96</option>
					
										<option value="97">97</option>
					
										<option value="98">98</option>
					
										<option value="99">99</option>
					
									</select>
								</td>
							</tr>
						</table>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>
				<tr>
					<td height=40px align=right>
						이메일
						&nbsp;&nbsp;
					</td>
					<td>
						<input type="email" name="email" placeholder="email@example.com" class="lgnform">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>
				<tr>
					<td height=40px align=right>
						비밀번호
						&nbsp;&nbsp;
					</td>
					<td>
						<input type="password" name="password" minlength="8" maxlength="20"
						placeholder="당신의 비밀번호는 " class="lgnform"><br>
						<input type="password" name="password_re" minlength="8"
						maxlength="20" placeholder="비밀번호 재입력 " class="lgnform">
					</td>
					<td>
						
					</td>
				</tr>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>
				<tr>
					<td height=100px>
					</td>
					<td>
						알파벳 또는 숫자 (8~20 자)를 사용할 수 있습니다. <br>
						추가 보안을 위해 이메일의 패스워드와<br>
						같은 패스워드를 사용하지 마세요.
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>
				<tr>
					<td align=right>
						<input type="checkbox" name="terms">
					</td>
					<td>
						예,<a href="">이용 약관</a> 및 <a href="">개인 정보 취급 방침</a> 에 동의합니다
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=3 height=10px>
					</td>
				</tr>
				<tr>
					<td height=40px>
					</td>
					<td>
						<button type="submit" class="lgnbtn">회원가입하기</button>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
		<td width=15%>
		</td>
	</tr>
	<tr>
		<td colspan=3>
		</td>
	</tr>
</table>
</form>





</body>
</html>