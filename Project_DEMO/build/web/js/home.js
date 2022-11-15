/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function buy(id){
    var m = document.f.num.value;
    document.f.action="buy?id="+id+"&num="+m;
    document.f.submit();
}

