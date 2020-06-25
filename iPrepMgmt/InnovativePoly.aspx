<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InnovativePoly.aspx.cs" Inherits="iPrepMgmt.InnovativePoly" %>

<!DOCTYPE html>
<title>Log Out</title>
<style>
body{
 background: linear-gradient(to bottom left, #9966ff 0%, #990033 100%); 
  background-repeat:no-repeat;
  height:520px;
 }
.text-center{
  color:white;
  font-size:40px;
  margin-top:50px;
  font-family:times new roman;
}
.message1 {
  font-size:25px;
  color:white;
  margin-top:70px;
  font-family:times new roman;
 /* margin-left:420px; */
  text-align:center;
}
.message2{
 text-align:center;
  color:white;
  margin-top:20px;
  font-size:25px;
  margin-left:30px;
  font-family:times new roman;
}
button{
 padding: 10px 20px;
    text-align: center;
    text-decoration: none;
   font-size: 16px;
 cursor: pointer;
  border-radius:10px;
  margin-left:45%;

  color:black;
  background-color: white;
   
  }
button:hover{
  background-color:white;
  box-shadow: 4px 4px 1px #888888;
}
</style>
    

<body>
    <form id="form1" runat="server">
<%--        <div>
            <label>You have successfully log out. Goodbye.</label>
        </div>--%>
        <div class="container">
  <div class="heading">
<%--<h1 class="text-center">Holler!!!</h1>--%>
  </div>
 <p class="message1">You have successfully log out.</p>
    <p class="message2">If you want to login again, please click below</p>
   <a href="Home.aspx"  target="_new"><button type="button" class="login">Login here</button></a>
  </div>
    </form>
</body>

