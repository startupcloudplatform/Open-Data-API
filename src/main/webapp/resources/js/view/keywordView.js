/*
 * made by cgs
 * 2018-06-18
 */

var myKeywordSearch = function(curl, searchText) {
	
  $.ajax({
    type : 'get',
    dataType : "json",
    url : curl,
    data : {
      "userNo" : searchText,
    },
    beforeSend : function(xhr) {
      xhr.setRequestHeader("Content-Type", "application/json");
    },
    complete : function() {
    },
    success : function(serverData) {
    	
    	var keywordList = serverData.keywordList;
    	
    	// apiList -> keywordList로 수정

    	$(keywordList).each(function(apiIndx) {
    	  if(apiIndx < 5)
    	  {
        	var html = "";
        	html += '<li><a href="#">'+keywordList[apiIndx].searchKeyword+'</a></li>';
        	
        	$(".popula_list").append(html);
    	  }
    	});
    },
    error : function(jqXHR, textStatus, errorThrown){
    }
  });  
} // of myKeywordSearch

var popularKeywordSearch = function(curl) {

	  $.ajax({
	    type : 'get',
	    dataType : "json",
	    url : curl,
	    data : {
	    },
	    beforeSend : function(xhr) {
	      xhr.setRequestHeader("Content-Type", "application/json");
	    },
	    complete : function() {
	    },
	    success : function(serverData) {
	    },
	    error : function(jqXHR, textStatus, errorThrown){
	    }
	  });
	  
} // of popularKeywordSearch

