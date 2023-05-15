<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path }/resources/css/accountBook.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="accountBookTop.jsp"></jsp:include>
	<section id="content-area">
      <!-- ngIf: qHash.menu != null --><!-- ngInclude: --><div ng-if="qHash.menu != null" ng-include="" src="'/app/include/' + qHash.menu + '-view.html'" onload="contentOnload()" class="ng-scope"><div ng-controller="dashboard" class="ng-scope">
  <div class="page-content report-view">
    <h2 class="hidden-outline-title">전체 요약 통계</h2>
    <div class="content-header">
      <h2>대시보드</h2>
    </div>
    <div class="container">
    <div class="spending-category row-section" ng-class="{'dashboard-data-zero' : dashboardDataZero}">
        <div class="content-row-title-box">
          <!-- <h2 class="content-sub-title">SUMMARY ANALYSIS</h2> -->
        </div>
        <ul>
          <li>
            <section>
              <div class="data-section-title"><h4>분류별 지출</h4> <!-- <i class="material-icons">&#xE5D4;</i> --></div>
              <div class="graph-area" graph-large-category=""><div class="large-category-box" id="reports-category-event"><div id="large-category-area"><highchart class="large-category-expense ng-isolate-scope" config="graphOfCategorys" data-highcharts-chart="94"><div id="highcharts-uj3kug7-2439" dir="ltr" class="highcharts-container " style="position: relative; overflow: hidden; width: 410px; height: 400px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg version="1.1" class="highcharts-root" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;" xmlns="http://www.w3.org/2000/svg" width="410" height="400" viewBox="0 0 410 400"><desc>Created with Highcharts 6.2.0</desc><defs><clipPath id="highcharts-uj3kug7-2445"><rect x="0" y="0" width="390" height="375" fill="none"></rect></clipPath></defs><rect fill="#ffffff" class="highcharts-background" x="0" y="0" width="410" height="400" rx="0" ry="0"></rect><rect fill="none" class="highcharts-plot-background" x="10" y="10" width="390" height="375"></rect><rect fill="none" class="highcharts-plot-border" data-z-index="1" x="10" y="10" width="390" height="375"></rect><g class="highcharts-series-group" data-z-index="3"><g data-z-index="0.1" class="highcharts-series highcharts-series-0 highcharts-pie-series  highcharts-tracker" transform="translate(10,10) scale(1 1)" style="cursor:pointer;"><path fill="#2d7aa5" d="M 194.967259532506 26.75000333417799 A 160.75 160.75 0 0 1 343.55660351992435 248.9125235650188 L 333.1576412735297 244.61364691546748 A 149.4975 149.4975 0 0 0 194.9695513652306 38.00250310078553 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-0"></path><path fill="#ff7b3a" d="M 343.4951167282992 249.06104943752007 A 160.75 160.75 0 0 1 95.65555541022394 313.87738654185296 L 102.60966653150827 305.03096948392323 A 149.4975 149.4975 0 0 0 333.10045855731823 244.75177597689367 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-1"></path><path fill="#7d4aff" d="M 95.52922771696315 313.7779789251326 A 160.75 160.75 0 0 1 68.64284988068829 88.12981778357391 L 77.4878503890401 95.08573053872374 A 149.4975 149.4975 0 0 0 102.49218177677574 304.9385204003733 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-2"></path><path fill="#ff6861" d="M 68.7422832249128 88.00351033960109 A 160.75 160.75 0 0 1 163.47536838741917 29.871448964056412 L 165.68209260029982 40.90544753657247 A 149.4975 149.4975 0 0 0 77.5803233991689 94.96826461582901 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-3"></path><path fill="#d563ff" d="M 163.63301267449822 29.84000315196687 A 160.75 160.75 0 0 1 194.776721474955 26.750155064770723 L 194.79235097170815 38.00264421023678 A 149.4975 149.4975 0 0 0 165.82870178728334 40.8762029313292 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-4"></path></g><g data-z-index="0.1" class="highcharts-markers highcharts-series-0 highcharts-pie-series " transform="translate(10,10) scale(1 1)"></g></g><text x="205" text-anchor="middle" class="highcharts-title" data-z-index="4" style="color:#333333;font-size:18px;fill:#333333;" y="24"></text><text x="205" text-anchor="middle" class="highcharts-subtitle" data-z-index="4" style="color:#666666;fill:#666666;" y="24"></text><g class="highcharts-legend" data-z-index="7"><rect fill="none" class="highcharts-legend-box" rx="0" ry="0" x="0" y="0" width="8" height="8" visibility="hidden"></rect><g data-z-index="1"><g></g></g></g></svg></div></highchart><div class="add-chart-dialog"><p class="pie-category-name">최대지출 카테고리</p><p>경조사/회비</p><p>50,000원</p></div></div><div class="add-chart-part"><div><ul><!-- ngRepeat: lCat in markupData --><li ng-repeat="lCat in markupData" ng-click="pageLink({menu: 'category', category: lCat.name});" class="ng-scope"><span style="background-color:#2d7aa5" ng-bind-html="lCat.icon" class="ng-binding"><i class="material-icons"></i></span><span class="ng-binding">경조사/회비</span><span class="ng-binding">50,000원</span></li><!-- end ngRepeat: lCat in markupData --><li ng-repeat="lCat in markupData" ng-click="pageLink({menu: 'category', category: lCat.name});" class="ng-scope"><span style="background-color:#ff7b3a" ng-bind-html="lCat.icon" class="ng-binding"><i class="material-icons"></i></span><span class="ng-binding">식사</span><span class="ng-binding">47,000원</span></li><!-- end ngRepeat: lCat in markupData --><li ng-repeat="lCat in markupData" ng-click="pageLink({menu: 'category', category: lCat.name});" class="ng-scope"><span style="background-color:#7d4aff" ng-bind-html="lCat.icon" class="ng-binding"><i class="material-icons"></i></span><span class="ng-binding">뷰티/미용</span><span class="ng-binding">40,000원</span></li><!-- end ngRepeat: lCat in markupData --><li ng-repeat="lCat in markupData" ng-click="pageLink({menu: 'category', category: lCat.name});" class="ng-scope"><span style="background-color:#ff6861" ng-bind-html="lCat.icon" class="ng-binding"><i class="material-icons"></i></span><span class="ng-binding">카페/간식</span><span class="ng-binding">18,000원</span></li><!-- end ngRepeat: lCat in markupData --><li ng-repeat="lCat in markupData" ng-click="pageLink({menu: 'category', category: lCat.name});" class="ng-scope"><span style="background-color:#d563ff" ng-bind-html="lCat.icon" class="ng-binding"><i class="material-icons"></i></span><span class="ng-binding">생활/마트</span><span class="ng-binding">5,000원</span></li><!-- end ngRepeat: lCat in markupData --></ul></div></div></div></div>
            </section>
          </li>
          <li>
            <section>
              <div class="data-section-title"><h4>결제 방식별 지출</h4> <!-- <i class="material-icons">&#xE5D4;</i> --></div>
              <div class="methods-payment graph-area">
                <header>
                  <nav>
                    <ul>
                      <li class="active" ng-click="choiceTabBtn($event, 0)">지출</li>
                      <li ng-click="choiceTabBtn($event, 1)">수입</li>
                    </ul>
                  </nav>
                </header>

                <div class="tab-card-box active">
                  <div class="total-payment">
                    <p>전체</p>
                    <p><strong class="ng-binding">160,000 원</strong></p>
                  </div>
                  <ul>
                    <!-- ngRepeat: cardSumItem in amountGroupByCards track by $index --><!-- ngIf: $index < 4 --><li ng-repeat="cardSumItem in amountGroupByCards track by $index" ng-if="$index < 4" class="ng-scope">
                      <!-- ngIf: $index < 3 --><dl ng-if="$index < 3" class="ng-scope">
                        <dt class="ng-binding">현금</dt>
                        <dd class="ng-binding">160,000 원</dd>
                      </dl><!-- end ngIf: $index < 3 -->
                      <!-- ngIf: $index == 3 -->
                    </li><!-- end ngIf: $index < 4 --><!-- end ngRepeat: cardSumItem in amountGroupByCards track by $index -->
                  </ul>
                </div>
                <div class="tab-card-box" ng-click="choiceTabBtn($event)">
                  <div class="total-payment">
                    <p>전체</p>
                    <p><strong class="ng-binding">240,000 원</strong></p>
                  </div>
                  <ul>
                    <li>
                      <dl>
                        <dt>수입</dt>
                        <dd class="ng-binding">400,000 원</dd>
                      </dl>
                    </li>
                    <li>
                      <dl>
                        <dt>지출</dt>
                        <dd class="ng-binding">-160,000 원</dd>
                      </dl>
                    </li>
                  </ul>
                </div>
              </div>
            </section>
          </li>
        </ul>
      </div>
      <div class="temp-graph-section row-section" ng-class="{'dashboard-data-zero' : dashboardDataZero}">
        <ul>
          <li>
            <section ng-click="pageLink({menu:'report', subMenu: 'budget'})">
              <div class="data-section-title"><h4>예산 소진율</h4> <!-- <i class="material-icons">&#xE5D4;</i> --></div>
              <div class="graph-area" graph-budget-spend=""><div id="budget-spend"><div><highchart id="budget-spend-pie" config="budgetSpend" class="ng-isolate-scope" data-highcharts-chart="95"><div id="highcharts-uj3kug7-2446" dir="ltr" class="highcharts-container " style="position: relative; overflow: hidden; width: 330px; height: 200px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg version="1.1" class="highcharts-root" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;" xmlns="http://www.w3.org/2000/svg" width="330" height="200" viewBox="0 0 330 200"><desc>Created with Highcharts 6.2.0</desc><defs><clipPath id="highcharts-uj3kug7-2449"><rect x="0" y="0" width="310" height="175" fill="none"></rect></clipPath></defs><rect fill="#ffffff" class="highcharts-background" x="0" y="0" width="330" height="200" rx="0" ry="0"></rect><rect fill="none" class="highcharts-plot-background" x="10" y="10" width="310" height="175"></rect><rect fill="none" class="highcharts-plot-border" data-z-index="1" x="10" y="10" width="310" height="175"></rect><g class="highcharts-series-group" data-z-index="3"><g data-z-index="0.1" class="highcharts-series highcharts-series-0 highcharts-pie-series " transform="translate(10,10) scale(1 1)"><path fill="#37cc77" d="M 154.9842153267136 10.000001607457506 A 77.5 77.5 0 0 1 200.6459633432756 150.1314300528444 L 196.08136700894806 143.86828704755993 A 69.75 69.75 0 0 0 154.98579379404225 17.75000144671175 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-0"></path><path fill="#ddd" d="M 200.58330910068156 150.17704469286758 A 77.5 77.5 0 1 1 154.89235405479945 10.0000747590652 L 154.9031186493195 17.750067283158685 A 69.75 69.75 0 1 0 196.0249781906134 143.90934022358084 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-1"></path></g><g data-z-index="0.1" class="highcharts-markers highcharts-series-0 highcharts-pie-series " transform="translate(10,10) scale(1 1)"></g></g><text x="165" text-anchor="middle" class="highcharts-title" data-z-index="4" style="color:#333333;font-size:18px;fill:#333333;" y="24"></text><text x="165" text-anchor="middle" class="highcharts-subtitle" data-z-index="4" style="color:#666666;fill:#666666;" y="24"></text><g class="highcharts-legend" data-z-index="7"><rect fill="none" class="highcharts-legend-box" rx="0" ry="0" x="0" y="0" width="8" height="8" visibility="hidden"></rect><g data-z-index="1"><g></g></g></g></svg></div></highchart><div class="budget-spend-text"><p class="budget-spend-percent ng-binding">40%</p><p class="ng-binding">예산 : 400,000원</p></div></div></div></div>
            </section>
          </li>
          <li>
            <section ng-click="pageLink({menu:'report', subMenu: 'monthly'})">
              <div class="data-section-title"><h4>현재 하루 지출</h4> <!-- <i class="material-icons">&#xE5D4;</i> --></div>
              <div class="graph-area" graph-today-expense=""><div id="today-expense-graph"><highchart id="today-expense" config="todayExpense" class="ng-isolate-scope" data-highcharts-chart="96"><div id="highcharts-uj3kug7-2450" dir="ltr" class="highcharts-container " style="position: relative; overflow: hidden; width: 330px; height: 200px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg version="1.1" class="highcharts-root" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;" xmlns="http://www.w3.org/2000/svg" width="330" height="200" viewBox="0 0 330 200"><desc>Created with Highcharts 6.2.0</desc><defs><clipPath id="highcharts-uj3kug7-2453"><rect x="0" y="0" width="310" height="175" fill="none"></rect></clipPath></defs><rect fill="#ffffff" class="highcharts-background" x="0" y="0" width="330" height="200" rx="0" ry="0"></rect><rect fill="none" class="highcharts-plot-background" x="10" y="10" width="310" height="175"></rect><rect fill="none" class="highcharts-plot-border" data-z-index="1" x="10" y="10" width="310" height="175"></rect><g class="highcharts-series-group" data-z-index="3"><g data-z-index="0.1" class="highcharts-series highcharts-series-0 highcharts-pie-series " transform="translate(10,10) scale(1 1)"><path fill="#37cc77" d="M 57.25000810988229 134.78981811049653 A 97.75 97.75 0 0 1 238.53797551955313 83.99106831212318 L 230.1841779675978 89.06696148091086 A 87.975 87.975 0 0 0 67.02500729889407 134.78583629944688 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-0"></path><path fill="#ddd" d="M 238.58869267379688 84.07463165318346 A 97.75 97.75 0 0 1 252.7499511250041 134.65225001629167 L 242.97495601250364 134.6620250146625 A 87.975 87.975 0 0 0 230.22982340641718 89.14216848786512 Z" transform="translate(0,0)" stroke="#ffffff" stroke-width="1" stroke-linejoin="round" class="highcharts-point highcharts-color-1"></path></g><g data-z-index="0.1" class="highcharts-markers highcharts-series-0 highcharts-pie-series " transform="translate(10,10) scale(1 1)"></g></g><text x="165" text-anchor="middle" class="highcharts-title" data-z-index="4" style="color:#333333;font-size:18px;fill:#333333;" y="24"></text><text x="165" text-anchor="middle" class="highcharts-subtitle" data-z-index="4" style="color:#666666;fill:#666666;" y="24"></text><g class="highcharts-legend" data-z-index="7"><rect fill="none" class="highcharts-legend-box" rx="0" ry="0" x="0" y="0" width="8" height="8" visibility="hidden"></rect><g data-z-index="1"><g></g></g></g></svg></div></highchart><div class="today-expense-summary-data"><p style="color:#37cc77;" class="ng-binding">적정</p><p class="ng-binding"><span style="color:#37cc77;" class="ng-binding">10,666원</span> / 12,903원</p></div></div></div>
            </section>
          </li>
          <li>
            <section ng-click="pageLink({menu:'report', subMenu: 'weekly'})">
              <div class="data-section-title"><h4>주간 지출 추이</h4> <!-- <i class="material-icons">&#xE5D4;</i> --></div>
              <div class="graph-area column-line-graph-section" graph-weekly-expense=""><highchart id="this-weekly-expense" config="weeklyExpense" class="ng-isolate-scope" data-highcharts-chart="97"><div id="highcharts-uj3kug7-2454" dir="ltr" class="highcharts-container " style="position: relative; overflow: hidden; width: 310px; height: 170px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg version="1.1" class="highcharts-root" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;" xmlns="http://www.w3.org/2000/svg" width="310" height="170" viewBox="0 0 310 170"><desc>Created with Highcharts 6.2.0</desc><defs><clipPath id="highcharts-uj3kug7-2455"><rect x="0" y="0" width="239" height="109" fill="none"></rect></clipPath></defs><rect fill="#ffffff" class="highcharts-background" x="0" y="0" width="310" height="170" rx="0" ry="0"></rect><rect fill="none" class="highcharts-plot-background" x="61" y="10" width="239" height="109"></rect><g class="highcharts-grid highcharts-xaxis-grid " data-z-index="1"><path fill="none" data-z-index="1" class="highcharts-grid-line" d="M 69.5 10 L 69.5 119" opacity="1"></path><path fill="none" data-z-index="1" class="highcharts-grid-line" d="M 106.5 10 L 106.5 119" opacity="1"></path><path fill="none" data-z-index="1" class="highcharts-grid-line" d="M 143.5 10 L 143.5 119" opacity="1"></path><path fill="none" data-z-index="1" class="highcharts-grid-line" d="M 180.5 10 L 180.5 119" opacity="1"></path><path fill="none" data-z-index="1" class="highcharts-grid-line" d="M 216.5 10 L 216.5 119" opacity="1"></path><path fill="none" data-z-index="1" class="highcharts-grid-line" d="M 253.5 10 L 253.5 119" opacity="1"></path><path fill="none" data-z-index="1" class="highcharts-grid-line" d="M 290.5 10 L 290.5 119" opacity="1"></path></g><g class="highcharts-grid highcharts-yaxis-grid " data-z-index="1"><path fill="none" stroke="#e6e6e6" stroke-width="1" data-z-index="1" class="highcharts-grid-line" d="M 61 119.5 L 300 119.5" opacity="1"></path><path fill="none" stroke="#e6e6e6" stroke-width="1" data-z-index="1" class="highcharts-grid-line" d="M 61 65.5 L 300 65.5" opacity="1"></path><path fill="none" stroke="#e6e6e6" stroke-width="1" data-z-index="1" class="highcharts-grid-line" d="M 61 9.5 L 300 9.5" opacity="1"></path></g><rect fill="none" class="highcharts-plot-border" data-z-index="1" x="61" y="10" width="239" height="109"></rect><g class="highcharts-axis highcharts-xaxis " data-z-index="2"><path fill="none" class="highcharts-tick" stroke="#ccd6eb" stroke-width="1" d="M 69.5 119 L 69.5 129" opacity="1"></path><path fill="none" class="highcharts-tick" stroke="#ccd6eb" stroke-width="1" d="M 106.5 119 L 106.5 129" opacity="1"></path><path fill="none" class="highcharts-tick" stroke="#ccd6eb" stroke-width="1" d="M 143.5 119 L 143.5 129" opacity="1"></path><path fill="none" class="highcharts-tick" stroke="#ccd6eb" stroke-width="1" d="M 180.5 119 L 180.5 129" opacity="1"></path><path fill="none" class="highcharts-tick" stroke="#ccd6eb" stroke-width="1" d="M 216.5 119 L 216.5 129" opacity="1"></path><path fill="none" class="highcharts-tick" stroke="#ccd6eb" stroke-width="1" d="M 253.5 119 L 253.5 129" opacity="1"></path><path fill="none" class="highcharts-tick" stroke="#ccd6eb" stroke-width="1" d="M 290.5 119 L 290.5 129" opacity="1"></path><path fill="none" class="highcharts-axis-line" stroke="#ccd6eb" stroke-width="1" data-z-index="7" d="M 61 119.5 L 300 119.5"></path></g><g class="highcharts-axis highcharts-yaxis " data-z-index="2"><path fill="none" class="highcharts-axis-line" data-z-index="7" d="M 61 10 L 61 119"></path></g><g class="highcharts-series-group" data-z-index="3"><g data-z-index="0.1" class="highcharts-series highcharts-series-0 highcharts-line-series " transform="translate(61,10) scale(1 1)" clip-path="url(https://visualbank.io/app#highcharts-uj3kug7-2455)"><path fill="none" d="M 9.1923076923077 109 L 27.576923076923 109 L 45.961538461538 109 L 64.346153846154 109 L 82.730769230769 109 L 101.11538461538 109 L 119.5 109 L 137.88461538462 109 L 156.26923076923 109 L 174.65384615385 109 L 193.03846153846 10.899999999999991 L 211.42307692308 32.7 L 229.80769230769 109" class="highcharts-graph" data-z-index="1" stroke="#a859f8" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"></path><path fill="none" d="M -0.8076923076922995 109 L 9.1923076923077 109 L 27.576923076923 109 L 45.961538461538 109 L 64.346153846154 109 L 82.730769230769 109 L 101.11538461538 109 L 119.5 109 L 137.88461538462 109 L 156.26923076923 109 L 174.65384615385 109 L 193.03846153846 10.899999999999991 L 211.42307692308 32.7 L 229.80769230769 109 L 239.80769230769 109" stroke-linejoin="round" stroke="rgba(192,192,192,0.0001)" stroke-width="22" visibility="visible" data-z-index="2" class="highcharts-tracker-line"></path></g><g data-z-index="0.1" class="highcharts-markers highcharts-series-0 highcharts-line-series highcharts-tracker" transform="translate(61,10) scale(1 1)" clip-path="url(https://visualbank.io/app#highcharts-uj3kug7-2469)"><path fill="#a859f8" d="M 13 109 A 4 4 0 1 1 12.999998000000167 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 31 109 A 4 4 0 1 1 30.99999800000017 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 49 109 A 4 4 0 1 1 48.99999800000017 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 68 109 A 4 4 0 1 1 67.99999800000016 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 86 109 A 4 4 0 1 1 85.99999800000016 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 105 109 A 4 4 0 1 1 104.99999800000016 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 123 109 A 4 4 0 1 1 122.99999800000016 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 141 109 A 4 4 0 1 1 140.99999800000018 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 160 109 A 4 4 0 1 1 159.99999800000018 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 178 109 A 4 4 0 1 1 177.99999800000018 108.99600000066667 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 197 11 A 4 4 0 1 1 196.99999800000018 10.996000000666664 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 215 33 A 4 4 0 1 1 214.99999800000018 32.99600000066666 Z" class="highcharts-point"></path><path fill="#a859f8" d="M 233 109 A 4 4 0 1 1 232.99999800000018 108.99600000066667 Z" class="highcharts-point"></path></g></g><text x="155" text-anchor="middle" class="highcharts-title" data-z-index="4" style="color:#333333;font-size:18px;fill:#333333;" y="24"></text><text x="155" text-anchor="middle" class="highcharts-subtitle" data-z-index="4" style="color:#666666;fill:#666666;" y="24"></text><g class="highcharts-axis-labels highcharts-xaxis-labels " data-z-index="7"><text x="72.78503255665868" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0) rotate(-45 72.78503255665868 135)" y="135" opacity="1">20일</text><text x="109.55426332589067" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0) rotate(-45 109.55426332589067 135)" y="135" opacity="1">06일</text><text x="146.32349409512068" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0) rotate(-45 146.32349409512068 135)" y="135" opacity="1">20일</text><text x="183.09272486435069" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0) rotate(-45 183.09272486435069 135)" y="135" opacity="1">03일</text><text x="219.8619556335807" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0) rotate(-45 219.8619556335807 135)" y="135" opacity="1">17일</text><text x="256.63118640281067" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0) rotate(-45 256.63118640281067 135)" y="135" opacity="1">01일</text><text x="293.40041717204065" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0) rotate(-45 293.40041717204065 135)" y="135" opacity="1">15일</text></g><g class="highcharts-axis-labels highcharts-yaxis-labels " data-z-index="7"><text x="46" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0)" y="123" opacity="1">0만원</text><text x="46" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0)" y="69" opacity="1">5만원</text><text x="46" style="color:#666666;cursor:default;font-size:11px;fill:#666666;" text-anchor="end" transform="translate(0,0)" y="14" opacity="1">10만원</text></g></svg></div></highchart></div>
            </section>
          </li>
          <!-- <li>
            <section ng-click="pageLink({menu: 'transaction'})">
              <div class="data-section-title"><h4>수입 지출 추이</h4> <i class="material-icons">&#xE5D4;</i></div>
              <div class="graph-area column-line-graph-section2" graph-exp-inc-analysis></div>
            </section>
          </li> -->
        </ul>
      </div>
      <div class="temp-card-section row-section" ng-class="{'dashboard-data-zero' : dashboardDataZero}">
        <div class="content-row-title-box">
          <!-- <h2 class="content-sub-title">CONDITION</h2> -->
        </div>
        <ul>
          <!-- ngRepeat: condi in lv0DataList -->
          <!-- ngIf: lv0DataZero --><li class="three-section ng-scope" ng-if="lv0DataZero">
            <section>
              <h4 class="hidden-outline-title">표시할 내용이 없습니다.</h4>
              <div class="report-card-box">
                <div class="report-card-thumbmail" back-img="https://dfrlippt5ud4x.cloudfront.net/web/lv0_no_data.png" style="background-image: url(&quot;https://dfrlippt5ud4x.cloudfront.net/web/lv0_no_data.png&quot;);"></div>
                <div class="report-card-content">
                  <p class="card-category">Oops!</p>
                  <h5>표시할 정보가 없습니다.</h5>
                  <p class="card-text">지금 지출 내역을 추가해보세요.</p>
                </div>
              </div>
            </section>
          </li><!-- end ngIf: lv0DataZero -->
        </ul>
      </div>
    </div>
  </div>
</div></div><!-- end ngIf: qHash.menu != null -->
      <div id="scroll-top-btn" ng-click="pageTop()" ng-class="{show : showPageTopBtn}" class="show"><i class="material-icons"></i></div>
    </section>
	
	
	
	
	
	<jsp:include page="../footer.jsp" />
</body>
</html>