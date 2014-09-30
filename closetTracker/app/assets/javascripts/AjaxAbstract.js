function AjaxAbstract(url, param, funcToCall, async) {
	this.param = param;
	this.url = url;
	this.funcToCall = funcToCall;
	this.async = async;
}

AjaxAbstract.prototype.sendRequest = function(){
	var myXHR = new XMLHttpRequest();
	var urlToSend = this.url + '?' + this.param;
	myXHR.open('GET', urlToSend, this.async);
	myXHR.send();
	var obj = this;
	myXHR.onreadystatechange = function() {
		if (this.readyState != 4) { 
			return;
		}
		if (this.status != 200) { 
			return;
		}
		obj.funcToCall(JSON.parse(this.responseText));
	}
}