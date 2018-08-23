/**
 * made by cgs
 */

var categoryList = Array();

// #majorList, #middleList id를 가진 두 selectbox에 카테고리 리스트를 계층적으로 출력
var printCategoryList = function(){

  $.ajax({
    type : 'get',
    dataType : "json",
    url : "/categoryRecursiveList",
    data : {},
    beforeSend : function(xhr) {
      xhr.setRequestHeader("Content-Type", "application/json");
    },
    complete : function() {
    },
    success : function(serverData) {
      categoryList = serverData.categoryList;
      $("#majorList option").remove();
      $("#majorList").prepend("<option value=''>전체</option>");
      
      $(categoryList).each(function(categoryIdx) {
 
        if (categoryIdx == 0) {
          $("#middleList option").remove();
          $("#middleList").append("<option value=''>전체</option>");
          $("#subList option").remove();
          $("#subList").append("<option value=''>전체</option>");
        }
      
        $("#majorList").append("<option value='"+categoryList[categoryIdx].categoryNo+"'>"+ categoryList[categoryIdx].categoryText + "</option>");
      }); // $(categoryList).each
      
      // #majorList id를 가진 selectbox의 이벤트 발생 시 실행되는 함수
      $("#majorList").change(function() {
        var majorCategoryNo = $("#majorList option:selected").val();
        var majorCategoryText = $("#majorList option:selected").text();
        
        if (majorCategoryNo == '' || majorCategoryNo == null || majorCategoryNo == undefined) {
          $("#middleList option").remove();
          $("#middleList").append("<option value=''>전체</option>");
          $("#subList option").remove();
          $("#subList").append("<option value=''>전체</option>");
        }

        majorSelectedIdx = majorCategoryNo;

        $(categoryList).each(function(categoryIdx) {
          if (categoryList[categoryIdx].categoryNo == majorCategoryNo) {
            $("#middleList option").remove();
            $("#middleList").append("<option value=''>전체</option>");
            middleCategoryList = categoryList[categoryIdx].categoryList;

            $(middleCategoryList).each(function(middleCategoryIdx) {
              if (middleCategoryIdx == 0) {
                $("#subList option").remove();
                $("#subList").append("<option value=''>전체</option>");
              }
              $("#middleList").append("<option value='"+middleCategoryList[middleCategoryIdx].categoryNo+"'>"+ middleCategoryList[middleCategoryIdx].categoryText+ "</option>");
            });
          }
        });
      }); // $("#majorList").change
      
      $("#middleList").change(function() {
        var middleCategoryNo = $("#middleList option:selected").val();
        var middleCategoryText = $("#middleList option:selected").text();

        if (middleCategoryNo == '' || middleCategoryNo == null || middleCategoryNo == undefined) {
          $("#subList option").remove();
          $("#subList").append("<option value=''>전체</option>");
        }
        printCategoryChildList(middleCategoryNo);
      }); // $("#middleList").change
      
	},
    error : function(jqXHR, textStatus, errorThrown) {
    }
  }); // of $.ajax
} // of printCategoryList

// #subList id를 가진 selectbox에 카테고리 리스트를 출력
var printCategoryChildList = function(categoryNo) {
	
  //alert("printCategoryChildList");
  
  $.ajax({
    type : 'get',
    dataType : "json",
    url : "/categoryChildList",
    data : {
      "categoryParents" : categoryNo
    },
    async:false,
    beforeSend : function(xhr) {
      xhr.setRequestHeader("Content-Type", "application/json");
    },
    complete : function() {
    },
    success : function(serverData) {
      childList = serverData.categoryList;
      var subCategoryList = childList;
      $("#subList option").remove();
      $("#subList").append("<option value=''>전체</option>");
      $(subCategoryList).each(function(subCategoryIdx) {
        $("#subList").append("<option value='"+subCategoryList[subCategoryIdx].categoryNo+"'>" + subCategoryList[subCategoryIdx].categoryText + "</option>");
      });
    },
    error : function(jqXHR, textStatus, errorThrown) {
    }
  }); // of $.ajax
} // of printCategoryChildList

var majorCategoryNo = 0;
var middleCategoryNo = 0;
var subCategoryNo = 0;
var getCategoryInfo = function(subCategoryNo){
	
	//alert("getCategoryInfo");
    //alert("subCategoryNo"+ subCategoryNo);

	$.ajax({
		type : 'get',
		dataType : "json",
		url : "/categoryParents",
		data : {
			"categoryNo": subCategoryNo
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		complete : function() {
		},
		success : function(serverData) {
			  			
			middleCategoryNo = serverData.middleParents;
			majorCategoryNo = serverData.majorParents;

			//$("#majorList").find("option[value="+majorParents+"]").prop("selected", true);
			//$(".list_selectbox").find("option[value='"+middleParents+"']").prop("selected", true);
			//$("#majorList option:eq(3)").prop("selected", true);
		},
		error : function(jqXHR, textStatus, errorThrown) {
		}
	});
} // of getCategoryInfo()

var initCategoryEdit = function(categoryNo) {

  // 소분류를 파라미터로 받음
  // 소분류를 이용하여 대분류, 중분류 정보를 쿼리로 수집 > majorCategoryNo, middleCategoryNo
  getCategoryInfo(categoryNo);

  // 대분류 리스트 구성, 대분류 선택 
  // 선택된 대분류의 중분류 구성, 중분류 선택
  $.ajax({
    type : 'get',
    dataType : "json",
    url : "/categoryRecursiveList",
    data : {},
    beforeSend : function(xhr) {
      xhr.setRequestHeader("Content-Type", "application/json");
    },
    complete : function() {
    },
    success : function(serverData) {
      var categoryList = serverData.categoryList;
      var middleCategoryList = Array();

      $("#majorList option").remove();
      $("#majorList").prepend("<option value=''>전체</option>");
      
      $(categoryList).each(function(categoryIdx) {

        if (categoryIdx == 0) {
          $("#middleList option").remove();
          $("#middleList").append("<option value=''>전체</option>");
          $("#subList option").remove();
          $("#subList").append("<option value=''>전체</option>");
        }
        $("#majorList").append("<option value='"+categoryList[categoryIdx].categoryNo+"'>"+ categoryList[categoryIdx].categoryText + "</option>");
      
        if(categoryList[categoryIdx].categoryNo == majorCategoryNo)
        {
        	middleCategoryList = categoryList[categoryIdx].categoryList;
        }
      }); // $(categoryList).each

      $("#majorList").find("option[value="+majorCategoryNo+"]").prop("selected", true);

      $(middleCategoryList).each(function(middleCategoryIdx) {
          if (middleCategoryIdx == 0) {
            $("#subList option").remove();
            $("#subList").append("<option value=''>전체</option>");
          }
          $("#middleList").append("<option value='"+middleCategoryList[middleCategoryIdx].categoryNo+"'>"+ middleCategoryList[middleCategoryIdx].categoryText+ "</option>");
      }); // $(middleCategoryList).each

      $("#middleList").find("option[value="+middleCategoryNo+"]").prop("selected", true);

      // 선택된 중분류의 소분류 구성, 소분류 선택      
      printCategoryChildList(middleCategoryNo);

      $("#subList").find("option[value="+categoryNo+"]").prop("selected", true);
    },
	error : function(jqXHR, textStatus, errorThrown) {
	}
  }); // of $.ajax
  
  // 이벤트 적용 > 대분류 선택 시 중분류 소분류 초기화, 중분류 선택 시 소분류 초기화
  
}
