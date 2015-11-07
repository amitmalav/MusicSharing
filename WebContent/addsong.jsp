<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Songs</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
	
}
%>

<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<a class = "navbar-brand col-md-3" href = "home.jsp">Home</a>
<a class = "navbar-brand col-md-3" href = "feedback.jsp">Give Feedback</a>
<a class = "navbar-brand col-md-3" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>
<form action="AddSong" method="post" role="form" class="form-horizontal">

	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="link" class="col-md-2 control-label">Link to the track:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="link" id="link" required>
				</div>
				<div class="col-md-4">
					<div class="btn btn-primary" id="check">Check song on youtube</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="albumname" class="col-md-2 control-label">Album/Movie:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="albumname" required>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="artistname" class="col-md-2 control-label">ArtistName:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="artistname" required>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="trackname" class="col-md-2 control-label">Trackname:</label>
				<div class="col-md-3">
					<input readonly type="text" class="form-control" name="trackname" id="trackname" required>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="playtime" class="col-md-2 control-label">Playtime(in seconds):</label>
				<div class="col-md-3">
					<input readonly type="text" class="form-control" name="playtime" id="playtime" required>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="rating" class="col-md-2 control-label">Trackrating:</label>
				<div class="col-md-3">
					<input readonly type="text" class="form-control" name="trackrating" id="trackrating" required>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group col-md-10 form-group row">
		<div class="col-md-2"></div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	$("#check").click(function(){
		if( $("#link")=="" ){
			alert("Please fill in the link!");
		}
		else{
			var videoId=$("#link").val();
			var i=videoId.length;
			videoId=videoId.substring(i-11,i);
			var myApiKey="AIzaSyACtgBkuPn6l-OZGEbxeUm3e7syA3j5IXY";
			console.log(videoId);
			$.getJSON('https://www.googleapis.com/youtube/v3/videos?id='+videoId+'&key='+myApiKey+'&part=snippet&callback=?',function(data){
				if (typeof(data.items[0]) != "undefined") {
			    	console.log(data.items[0].snippet);
			    	$("#trackname").val(data.items[0].snippet.title);
				}
				else{
			    	console.log('video not exists');
				}
			});
			$.getJSON('https://www.googleapis.com/youtube/v3/videos?id='+videoId+'&key='+myApiKey+'&part=statistics&callback=?',function(data){
				if (typeof(data.items[0]) != "undefined") {
			    	var likes=parseInt(data.items[0].statistics.likeCount);
			    	var dislikes=parseInt(data.items[0].statistics.dislikeCount);
			    	var sum=parseInt(parseInt(likes)+parseInt(dislikes));
			    	console.log(sum);
			    	if(sum==0){
			    		var rating=0;
			    		$("#trackrating").val(rating);
			    	}
			    	else{
			    		console.log(sum,"asdf");
			    		var rating=(likes/sum)*5;
			    		$("#trackrating").val(rating);
			    	}
				}
				else{
			    	console.log('video not exists');
				}
			});
			$.getJSON('https://www.googleapis.com/youtube/v3/videos?id='+videoId+'&key='+myApiKey+'&part=contentDetails&callback=?',function(data){
				if (typeof(data.items[0]) != "undefined") {
			    	console.log(data.items[0].contentDetails);
			    	var time=data.items[0].contentDetails.duration;
			    	var len=time.length;
			    	console.log(time);
			    	var time=time.substring(0,len-1);len--;
			    	console.log(time);
			    	var sec=0, min=0, hour=0;
			    	if(time[len-1]>'0' && time[len-1]<'9'){
			    		sec=parseInt(time[len-1]);
			    		time=time.substring(0,len-1);len--;
			    		console.log(time);
			    	}
			    	if(time[len-1]>'0' && time[len-1]<'9'){
			    		sec=sec+(parseInt(time[len-1])*10);
			    		time=time.substring(0,len-1);len--;
			    		console.log(time);
			    	}
			    	time=time.substring(0,len-1);len--;
		    		console.log(time);
		    		if(time[len-1]>'0' && time[len-1]<'9'){
			    		min=parseInt(time[len-1]);
			    		time=time.substring(0,len-1);len--;
			    		console.log(time);
			    	}
		    		if(time[len-1]>'0' && time[len-1]<'9'){
			    		min=(parseInt(time[len-1])*10)+min;
			    		time=time.substring(0,len-1);len--;
			    		console.log(time);
			    	}
		    		time=time.substring(0,len-1);len--;
		    		console.log(time);
		    		if(time[len-1]>'0' && time[len-1]<'9'){
		    			var x=time.substring(2,len);
			    		hour=parseInt(x);	
		    		}
		    		var fin=(hour*3600)+min*60+sec;
		    		console.log(fin,sec,min,hour,time.substring(3,1),time,time[0],time[1],time[2],len);
		    		$("#playtime").val(fin);
				}
				else{
			    	console.log('video not exists');
			    	var txt="";
			    	$("#link").val(txt);
			    	alert("This link doesn't exist. Please provide a valid link.");
				}
			});
		}
	});
</script>
</body>
</html>