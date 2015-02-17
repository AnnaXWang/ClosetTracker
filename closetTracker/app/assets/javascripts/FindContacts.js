function FindContacts(searchID,allContactsID,resultsID) {
	this.search = document.getElementById(searchID);
	this.result = document.getElementById(resultsID);
	this.originalContacts = document.getElementById(allContactsID);
	var obj = this;
	this.search.onkeyup = function(event) {
        obj.keyUp(event);
    }
    this.showResults = function(arr){
    	obj.originalContacts.style.display = 'none';
        if (arr.length != 0){
        	obj.result.innerHTML = '';
	        for (var i = 0; i < arr.length; i++){
	            var contactToShow = arr[i];
	            var displayedContact = document.createElement('tr');
	            displayedContact.innerHTML = "<td class = 'contact-index'><a href='/contacts/" + contactToShow[0] + "''>" + contactToShow[1] + "</a><span class = 'glyphicon glyphicon-chevron-right pull-right'></span></td>";
	            displayedContact.setAttribute('class','index-row');
	            obj.result.appendChild(displayedContact);
	        }
        }
    }
}
FindContacts.prototype.keyUp = function(event){
	var text = this.search.value;
	if(text == '' || null){
		this.result.innerHTML = '';
		return;
	}
	text = text.toLowerCase();
	text = encodeURIComponent(text);
	text = 'q=' + text;

	var aj = new AjaxAbstract('/contacts/search', text, this.showResults, 'yes');
	aj.sendRequest();
}