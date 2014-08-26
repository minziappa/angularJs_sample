<form id="form1" name="form1" enctype="multipart/form-data">
    <input type="file" id="upload" name="upload">
    <input type="button" value="Send" onclick="sendFile();" />
</form>
<span id="serverresponse"></span><br/>
<span id="progress_percentage"></span><br/>
<span id="speed"></span><br/>
<span id="ETR"></span><br/>

<hr id="progress">

<script type="text/javascript">
var uploaded = 0, prevUpload = 0, speed = 0, total = 0, remainingBytes = 0, timeRemaining = 0;

function bin2String(array) {
	var result = "";
	for (var i = 0; i < array.length; i++) {
		result += String.fromCharCode(parseInt(array[i], 2));
	}
	return result;
}

function uploadProgress(e)
{
	if (e.lengthComputable) 
	{
		uploaded = e.loaded;
		total = e.total;
		//percentage
		var percentage = Math.round((e.loaded / e.total) * 100);
		document.getElementById('progress_percentage').innerHTML = percentage + '%';
		document.getElementById('progress').style.width = percentage + '%';
		//document.getElementById("remainingbyte").innerHTML =  j.BytesToStructuredString(e.total - e.loaded);//remaining bytes
		//document.getElementById('uploadedbyte').innerHTML = j.BytesToStructuredString(e.loaded);//uploaded bytes
		//document.getElementById('totalbyte').innerHTML = j.BytesToStructuredString(e.total);//total bytes
	}
}

function UploadSpeed()
{
	//speed
	speed = uploaded - prevUpload;
	prevUpload = uploaded;
	//document.getElementById("speed").innerHTML = j.SpeedToStructuredString(speed);

	//Calculating ETR
	remainingBytes = total - uploaded;
	timeRemaining = remainingBytes / speed;
	// document.getElementById("ETR").innerHTML = i.SecondsToStructuredString(timeRemaining);
}

function sendFile()
{
    var url = "/sample/index/ajaxUploadFile";
    var formData = new FormData(document.getElementById("form1"));
    xhr = new XMLHttpRequest();    
    xhr.open("POST", url, true);
    xhr.onreadystatechange = function()
    {
        if(xhr.readyState == 4 && xhr.status == 200)
        {
            document.getElementById("serverresponse").innerHTML = xhr.responseText;
        }
    }
    xhr.upload.addEventListener('progress', uploadProgress, false);

    xhr.send(formData); //Send to server
}
</script>