/** 
 * 
 */
var doSearch = function(searchText) {
	$.ajax({
		type : 'get',
		dataType : "json",
		url : '<c:url value="/apiList"/>',
		data : {
			"openapiName" : searchText.openapiName,
			"openapiCategory" : searchText.openapiCategory
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		complete : function() {
		},
		success : function(serverData) {
			console.log(serverData);
			var apiList = serverData.openapiList;
			$(apiList).each(function(apiIndx) {
				var api = apiList[apiIndx];
				var resultType = "";
				if (api.openapiResultType == 1) {
					resultType = "CSV";
				} else if (api.openapiResultType == 2) {
					resultType = "XML";
				} else if (api.openapiResultType == 3) {
					resultType = "JSON";
				} else if (api.openapiResultType == 4) {
					resultType = "ZIP";
				}
				var html = "";
				html += '<li>';
				html += '  <div class="detailIist_tit">';
				html += '    <input type="checkbox" id=""><label for="">'
					+ api.openapiName
					+ '</label> <a href="'+api.openapiUrl+'">'
					+ api.openapiUrl.split('?')[0] + '</a>';
				if (api.openapiUseType == 1) {
					html += '<div class="btns">';
					html += '<a class="download_link" href="'+api.openapiUrl+'"> <button type="button" id='+api.openapiNo+' class="btn_detail_download">다운로드</button></a>';
					html += '</div>';
				} else {
					if (api.use == true) {
						html += '    <div class="btns">';
						html += '      <span class="">사용신청완료</span>';
						html += '    </div>';
					} else {
						html += '    <div class="btns">';
						html += '      <button type="button" id='+api.openapiNo+' class="btn_detail_app">사용신청</button>';
						html += '    </div>';
					}
				}
				html += '  </div>';
				html += '  <div class="detailIist_cont">'
					+ api.openapiComment + '</div>';
				html += '  <div class="detailIist_info">';
				html += '    <span>활용 :<strong>'
					+ (api.openapiUseType == 1 ? 'FILE' : 'RESTful')
					+ '</strong></span> <span>결과 :<strong>'
					+ resultType
					+ '</strong></span> <span>제공처 :<strong>'
					+ api.openapiProvider + '</strong></span>';
				html += '  </div>';
				html += '</li>';
				$(".api_detailIist").append(html);

				if (api.openapiUseType == 1) {
					setClickEventDownload("button[id=" + api.openapiNo + "]", api.openapiUrl);
				} else {
					setClickEventUse("button[id=" + api.openapiNo + "]", api, 1);
				}
			});
		},
		error : function(jqXHR, textStatus, errorThrown) {
		}
	}); // $.ajax
} // of doSearch