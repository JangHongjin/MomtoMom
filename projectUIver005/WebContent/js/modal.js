// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
/*
$(function(){
    //$("#dialog").dialog();
    $("#id01").dialog({
        autoOpen:false, //자동으로 열리지않게
        position:"center", //x,y  값을 지정
        //"center", "left", "right", "top", "bottom"
        modal:true, //모달대화상자
        resizable:false, //크기 조절 못하게
        
        buttons:{
            "확인":function(){
                $(this).dialog("close");
            },"취소":function(){
                $(this).dialog("close");
            }
        }
    });

    //창 열기 버튼을 클릭했을경우
    $("#btn").on("click",function(){
        $("#id01").dialog("open"); //다이얼로그창 오픈                
    });
});*/


