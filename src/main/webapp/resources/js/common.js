// 사용자 화면 중간에 새 창 띄우기
// 호출 할 부분은 이렇게 표시해주세요
// <a href="javascript:void(0)" onclick="openCenteredWindow('원래 링크 주소', '새 창 이름', 창 가로, 창 길이)">링크 텍스트</a>
// <a href="javascript:void(0)" onclick="openCenteredWindow('mypage', '머니또', 500, 400)">링크 텍스트</a>
function openCenteredWindow(url, name, width, height) {
  var dualScreenLeft = window.screenLeft || window.screenX;
  var dualScreenTop = window.screenTop || window.screenY;
  var screenWidth = window.innerWidth || document.documentElement.clientWidth || window.screen.width;
  var screenHeight = window.innerHeight || document.documentElement.clientHeight || window.screen.height;
  
  var left = (screenWidth - width) / 2 + dualScreenLeft;
  var top = (screenHeight - height) / 2 + dualScreenTop;
  var options = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
  
  window.open(url, name, options);
}