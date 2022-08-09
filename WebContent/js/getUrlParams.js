// 사용법 : param = getUrlParams(); 하신 후에 param.num1 이라고 하면 파라미터 num1의 값이 됩니다!
function getUrlParams() {     
    var params = {};  
    
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, 
    	function(str, key, value) { 
        	params[key] = value; 
        }
    );     
    
    return params; 
}
