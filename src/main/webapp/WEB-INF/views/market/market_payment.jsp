<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<link href="${path }/resources/css/socialBook.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/main.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style type="text/css">
.tabcontent {
	display: none;
}

.tabcontent.on {
	display: block;
}

.ddday {
	display: inline-block;
	background: #bb2649;
	color: white;
	padding: 12px;
	border-radius: 50%;
	font-size: 13px;
	font-weight: 400;
	box-shadow: 1px 1px 3px 1px rgb(0 0 0/ 43%);
	margin-top: 98px;
	margin-left: 170px;
	text-align: center;
	width: 60px;
	height: 60px;
}
/* 5.17cw================================================ */
     
.content {
    width: 100%;
}

.item_list_area {
    width: 1060px;
    min-height: 480px;
    margin: 0 auto 20px;
    overflow: hidden;
}

.breadcrumbs {
    margin: 33px 0 24px 10px;
}

ul {
    list-style: none;
}

.breadcrumbs li {
    float: left;
    padding-right: 5px;
    font-size: 12px;
    color: #666;
    line-height: 17px;
}

.main_area {
    height: 100%;
}

.main_area_center {
    width: 990px;
    margin: 0 auto;
}

.main_area_center .main {
    overflow: hidden;
}

.order_title_wrapper {
    border: 1px solid #e4e4e4;
    height: 77px;
    line-height: 77px;
    text-align: center;
}

.order_title_wrapper .title {
    font-size: 26px;
    color: #000;
    font-weight: 700;
}

.order_content_wrapper {
    border-left: 1px solid #e4e4e4;
    border-right: 1px solid #e4e4e4;
    border-bottom: 1px solid #e4e4e4;
    padding: 0 41px 60px;
    margin-bottom: 20px;
}

.order_card .card_cont.deal_card_cont {
    margin: 0;
}

.item_list>li {
    margin-top: 20px;
}

.order_card .card_box_list {
    position: relative;
    overflow: hidden;
}

.order_card .image_wrapper.image_wrapper_main_col_1 {
    width: 163px;
    height: 163px;
    float: left;
    margin-right: 20px;
}

.image_wrapper {
    width: 100%;
    background-color: #000;
    position: relative;
    border-radius: 6px;
}

.image_wrapper .image_outside {
    position: relative;
    padding-top: 100%;
    overflow: hidden;
    border-radius: 5px;
}

.image_wrapper .image_outside .image_centerbox {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    transform: translate(50%,50%);
}

.image_wrapper_main_col_1.deal_image_wrapper .thumbnail_img {
    cursor: default;
}

.image_wrapper .image_outside .thumbnail_img, .image_wrapper .image_outside .thumbnail_state_img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: auto;
    transform: translate(-50%,-50%);
    z-index: 10;
}

.order_card .cont .item_price, .order_card .cont .item_title {
    color: #000;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

.order_card .cont .item_title {
    font-size: 17px;
    line-height: 25px;
    margin: 0 0 1px;
}

.order_card .cont .item_price {
    font-size: 24px;
    padding-bottom: 8px;
}

.order_card .item_hasdeliveryfee {
    font-size: 14px;
    color: #72787f;
}

.breadcrumbs:after {
    clear: both;
    content: "";
    display: block;
}

.card_box:after {
    display: block;
    clear: both;
    content: "";
}

.order_card .card_cont ul li:after, .order_card:after {
    display: block;
    content: "";
    clear: both;
}

.order_card .title_box {
    /* height: 24px; */
    line-height: 24px;
    color: #000;
    font-size: 18px;
    font-weight: 700;
    border-bottom: 1px solid #9ea4aa;
    padding: 60px 0 16px;
    margin-bottom: 10px;
}

.order_card .parcel_wrapper .adress_label {
    float: left;
    margin-left: 10px;
    text-align: left;
    width: 163px;
}

.order_card .parcel_wrapper .label {
    height: 58px;
    line-height: 58px;
    color: #454c53;
    font-size: 15px;
}

.order_card .selectbox_order.se_order_adress {
    width: 498px;
    height: 36px;
    border: 1px solid #e8ebed;
    float: left;
    margin-top: 10px;
    border-radius: 3px;
}

.order_card .parcel_wrapper .se_order_adress {
    float: left;
    margin-right: 20px;
    margin-bottom: 10px;
}

.order_card .selectbox_order {
    position: relative;
    width: 200px;
    border: 1px solid #e5e5e5;
    z-index: 1;
}

.order_card .selectbox_order:before {
    content: "";
    position: absolute;
    top: 50%;
    right: 8px;
    width: 0;
    height: 0;
    margin-top: -1px;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #333;
}

.order_card .selectbox_order label {
    position: absolute;
    top: 1px;
    left: 5px;
    padding: 0 0.5em;
    z-index: -1;
    width: 450px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 36px;
    font-size: 14px;
}

.order_card .selectbox_order select {
    width: 100%;
    height: auto;
    line-height: normal;
    font-family: inherit;
    padding: 0.8em 0.5em;
    border: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    -webkit-appearance: none;
    -moz-appearance: none;
}

.order_card .parcel_wrapper .adress_btn_wrapper {
    float: left;
    margin-top: 10px;
    border-radius: 3px;
}

.order_card .parcel_wrapper .adress_btn_wrapper button {
    border: 1px solid #0484f6;
    color: #0484f6;
    font-size: 14px;
    padding: 8px 16px;
    text-align: center;
    height: 38px;
    border-radius: 3px;
}

.order_card .parcel_wrapper:after {
    clear: both;
    content: "";
    display: block;
}

.order_card .order_member_info li {
    line-height: 58px;
}

.order_card .order_member_info dt {
    float: left;
    font-size: 15px;
    color: #454c53;
    margin-left: 10px;
    text-align: left;
    width: 163px;
    height: 58px;
}

.order_card .order_member_info dd {
    float: left;
    font-size: 14px;
    color: #666;
    width: 704px;
}

.order_card .order_member_info dd.order_member_name input, .order_card .order_member_info dd.order_member_phone input {
    width: 200px;
}

.order_card .order_member_info .w_10 {
    float: left;
    margin-top: 10px;
    border-radius: 3px;
}

input[type=date], input[type=email], input[type=number], input[type=password], input[type=tel], input[type=text], textarea {
    -webkit-appearance: none!important;
    padding: 8px 0 8px 16px!important;
    font-size: 14px!important;
    outline: none!important;
    -webkit-box-sizing: border-box!important;
    -moz-box-sizing: border-box!important;
    box-sizing: border-box!important;
    line-height: 20px!important;
    border: 1px solid #e8ebed!important;
}

.order_card .order_member_info dd:after {
    clear: both;
    content: "";
    display: block;
}

.order_card .order_member_info dd {
    float: left;
    font-size: 14px;
    color: #666;
    width: 704px;
}

.order_card .order_member_info dl:after {
    clear: both;
    content: "";
    display: block;
}

.order_card .order_member_info dd.order_member_phone {
    padding-bottom: 12px;
}

.order_card .order_member_info dd {
    float: left;
    font-size: 14px;
    color: #666;
    width: 704px;
}

.order_card .order_member_info dd.order_member_name input, .order_card .order_member_info dd.order_member_phone input {
    width: 200px;
}

.order_card .order_member_info .w_10 {
    float: left;
    margin-top: 10px;
    border-radius: 3px;
}

.order_card .order_member_info dd:after {
    clear: both;
    content: "";
    display: block;
}

.order_card .order_member_info .div_input_st {
    border: 1px solid #e8ebed;
    background-color: #f5f6f7!important;
    color: #454c53;
    float: left;
    margin: 10px 10px 0 0;
    line-height: 36px;
    padding: 0 10px;
    min-width: 61px;
    border-radius: 3px;
}

.order_card .order_member_info .addr_search {
    border: 1px solid #0484f6;
    font-size: 14px;
    color: #0484f6;
    padding: 0 10px;
    border-radius: 3px;
    background-color: #fff;
    line-height: 36px;
}

.order_card .order_member_info .w_10 {
    float: left;
    margin-top: 10px;
    border-radius: 3px;
}

.order_card_left {
    float: left;
    width: 550px;
}

.wallet_wrapper.wallet_items_wrapper {
    font-weight: 700;
    padding: 0 10px;
    border-bottom: 0;
}

.order_card_left .wallet_wrapper {
    margin: 20px 0;
    border-bottom: 1px solid #e7e7e7;
}

.box_coupon {
    margin: 25px 0;
}

.box_coupon .title.order_sub_title {
    padding-top: 0;
}

.wallet_wrapper .title {
    color: #454c53;
    padding-top: 30px;
    font-size: 15px;
    letter-spacing: -.3px;
}

.box_coupon .title {
    float: left;
    color: #454c53;
    font-size: 14px;
    line-height: 31px;
}

.box_coupon .box_coupon_right {
    float: right;
    width: 78%;
}

.box_coupon .description {
    float: left;
    line-height: 31px;
    font-size: 13px;
    color: #72787f;
    margin-right: 15px;
}

.box_coupon .box_coupon_right .coupon_btn {
    float: left;
    border: 1px solid #c9cdd2;
    color: #454c53;
    font-size: 13px;
    text-align: center;
    padding: 5px 0;
    width: 73px;
    cursor: pointer;
}

.box_coupon .box_coupon_right .price {
    float: right;
    color: #000;
    font-size: 15px;
    line-height: 31px;
}

.box_coupon:after {
    display: block;
    clear: both;
    content: "";
}

.hide, .multiple {
    display: none;
}

.wallet_wrapper:after {
    clear: both;
    content: "";
    display: block;
}

.wallet_wrapper.wallet_items_wrapper {
    font-weight: 700;
    padding: 0 10px;
    border-bottom: 0;
}

.order_card_left .title_box.sub_title_box {
    padding-top: 1px;
}

.order_card_left .title_box.sub_title_box .payment_method {
    font-weight: 700;
}

.etc_other_wrapper_form {
    display: inline-block;
    float: right;
    text-align: right;
    cursor: pointer;
}

.other_wrapper_description {
    font-size: 12px;
    color: #454c53;
    padding: 2px 10px;
    border-radius: 15px;
    display: inline-block;
}

.order_card_left .pay_method_list.item_pay_method_list {
    margin: 0;
    padding: 0;
    border-bottom: 0;
}

.other_wrapper_div {
    float: left;
    width: 100%;
    margin-top: 8px;
}

.other_wrapper_div li {
    float: left;
    width: 33.3%;
}

.order_card_left .pay_method_list.item_pay_method_list .wrapper_div.other_wrapper_div_option {
    padding: 0;
    border-bottom: 0;
    border-top: 0;
}

.order_card_left .pay_method_list.item_pay_method_list .wrapper_div.other_wrapper_div_option.checked .info {
    border: 1px solid #0484f6;
    background-color: #0484f6;
}

.order_card_left .pay_method_list.item_pay_method_list .wrapper_div.other_wrapper_div_option .info {
    border: 1px solid #e8ebed;
    width: 94%;
    height: 43px;
    line-height: 2.3;
    text-align: center;
    margin-bottom: 13px;
    border-radius: 3px;
}

.order_card_left .pay_method_list.item_pay_method_list .info {
    position: relative;
}

.wrapper_div .info {
    float: left;
    width: 100%;
}

.order_card_left .pay_method_list.item_pay_method_list .wrapper_div.other_wrapper_div_option.checked .info label {
    color: #fff;
}

.order_card_left .pay_method_list li label {
    color: #454c53;
    font-size: 14px;
}

.wrapper_div:after {
    clear: both;
    display: block;
    content: "";
}

.other_wrapper_div:after {
    display: block;
    clear: both;
    content: "";
}

.other_wrapper_consignment {
    float: left;
    width: 100%;
    padding: 10px 0 0;
}

.other_wrapper_consignment>span {
    display: block;
    font-size: 13px;
    color: #72787f;
}

.order_card_left .pay_method_list.item_pay_method_list:after {
    display: block;
    clear: both;
    content: "";
}

.hide, .multiple {
    display: none;
}

.order_card_right {
    float: right;
    width: 304px;
}

.final_order_wrapper .final_order_price {
    border-bottom: 1px solid #9ea4aa;
    padding: 28px 22px 1px;
    background-color: #f5f6f7;
}

.final_order_wrapper .final_order_price dl {
    margin-bottom: 26px;
}

.final_order_wrapper .final_order_price dl dt {
    float: left;
    font-size: 15px;
    color: #454c53;
    text-align: left;
    line-height: 1;
}

.final_order_wrapper .final_order_price dl dd {
    float: right;
    font-size: 15px;
    color: #454c53;
    text-align: right;
    line-height: 1;
}

.final_order_wrapper .final_order_price dl:after {
    clear: both;
    content: "";
    display: block;
}

.final_order_wrapper .final_order_price dl.final_order_price_margin {
    margin-bottom: 22px;
}

.final_order_wrapper .final_order_price .payment_method_credit {
    color: #9ea4aa;
    font-size: 11px;
    margin-top: 8px;
    display: block;
}

.final_order_wrapper .final_order_price dl {
    margin-bottom: 26px;
}

.final_order_wrapper .final_order_price dl dt {
    float: left;
    font-size: 15px;
    color: #454c53;
    text-align: left;
    line-height: 1;
}

.final_order_wrapper .final_order_price dl dd {
    float: right;
    font-size: 15px;
    color: #454c53;
    text-align: right;
    line-height: 1;
}

.final_order_wrapper .order_total_price {
    background-color: #f5f6f7;
    padding: 28px 21px 26px;
}

.final_order_wrapper .order_total_price .title {
    color: #454c53;
    font-size: 15px;
    text-align: left;
    font-weight: 700;
}

.final_order_wrapper .order_total_price .price {
    color: #000;
    font-size: 26px;
    text-align: right;
    font-weight: 700;
}

.policy_area .info {
    float: left;
}

.policy_area .info .feature_option {
    padding-left: 22px;
    margin-top: 1px;
}

.feature_option {
    display: block;
    padding-left: 28px;
    font-size: 12px;
    color: #444;
    line-height: 21px;
}

.feature_option, .md_radio label {
    position: relative;
    cursor: pointer;
}

.policy_area .info .feature_option_checkbox_indicator {
    border-radius: 3px;
}

.feature_option_checkbox_indicator {
    position: absolute;
    top: 2px;
    left: 0;
    height: 15px;
    width: 15px;
    background: #fff;
    border: 1px solid #c9cdd2;
}

.final_order_wrapper .policy_area .description {
    margin: 11px 8px 0 25px;
    font-size: 12px;
    color: #454c53;
    line-height: 23px;
}

.txt_un {
    text-decoration: underline;
    cursor: pointer;
}

.txt-bl-12 {
    color: #0484f6;
    font-size: 12px;
    font-weight: 700;
}

.final_order_wrapper .success_btn.btn_disabled {
    opacity: .7;
}

.main_area_center .main:after {
    clear: both;
    content: "";
    display: block;
}
select {
    vertical-align: baseline;
    font-weight: 400;
    color: rgb(51, 51, 51);
    font-family: 돋움, Dotum, Arial;
    margin: 0px;
    padding: 0px;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
}

.final_order_wrapper .success_btn.btn_disabled {
    background-color: #b2e1f5!important;
}

.final_order_wrapper .success_btn {
    background-color: #0484f6;
    line-height: 60px;
    color: #fff;
    font-size: 18px;
    text-align: center;
    margin: 19px 0 10px;
    cursor: pointer;
}

.coupon_select_modal {
    width: 450px;
    height: auto;
}

.modal_wrapper {
    display: inline-block;
    background-color: #fff;
    position: relative;
    text-align: left;
    margin: 20px 0;
}

.modal_wrapper .modal_header {
    height: auto;
    position: relative;
}

.modal_wrapper .modal_header .modal_left_title {
    text-align: left;
    padding-left: 57px;
}

.modal_wrapper .modal_header .modal_left_title .label {
    font-size: 24px;
    color: #333;
    padding: 24px 0 11px;
}

.coupon_select_modal .modal_body {
    padding: 0 57px;
    border-top: 1px solid #9ea4aa;
    margin-top: 13px;
}

.modal_wrapper .modal_body {
    -ms-overflow-style: none;
    overflow-y: auto;
    height: 100%;
}

.coupon_select_modal .coupon_select_header {
    float: right;
    padding-top: 24px;
}

.coupon_select_modal .coupon_select_header .feature_option {
    font-size: 14px;
    color: #666;
    padding-left: 22px;
}

.feature_option {
    display: block;
    padding-left: 28px;
    font-size: 12px;
    color: #444;
    line-height: 21px;
}

.feature_option, .md_radio label {
    position: relative;
    cursor: pointer;
}

.feature_option_checkbox_indicator.checked {
    background: #0484f6!important;
    border: 1px solid #0484f6;
}

.feature_option_checkbox_indicator {
    position: absolute;
    top: 2px;
    left: 0;
    height: 15px;
    width: 15px;
    background: #fff;
    border: 1px solid #c9cdd2;
}

.feature_option_checkbox .feature_option_checkbox_indicator:after {
    left: 5px;
    top: 1px;
    width: 3px;
    height: 8px;
    border: solid #fff;
    border-width: 0 2px 2px 0;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
}

.feature_option_checkbox_indicator.checked:after {
    display: block;
}

.feature_option_checkbox_indicator:after {
    content: "";
    position: absolute;
    display: none;
}

.coupon_select_modal .coupon_select_list {
    float: left;
    width: 100%;
    border-top: 1px solid #9ea4aa;
    margin-top: 10px;
    min-height: 380px;
}

.coupon_select_modal .coupon_select_list ul li {
    padding: 16px 0;
    border-bottom: 1px solid #9ea4aa;
    position: relative;
}

.coupon_select_modal .coupon_select_list ul li .checkbox_list {
    float: left;
    width: 10%;
    position: relative;
    line-height: 105px;
}

.coupon_select_modal .coupon_select_list ul li .checkbox_list .feature_option {
    position: absolute;
    transform: translate(-48%,-55%);
    left: 48%;
    top: 45%;
}

.feature_option_checkbox_indicator {
    position: absolute;
    top: 2px;
    left: 0;
    height: 15px;
    width: 15px;
    background: #fff;
    border: 1px solid #c9cdd2;
}

.coupon_select_modal .coupon_select_list ul li .title {
    float: left;
    width: 90%;
    margin-top: 3px;
}

.coupon_select_modal .coupon_select_list ul li .title .sub_name {
    color: #000;
    letter-spacing: -.8px;
    font-size: 14px;
}

.coupon_select_modal .coupon_select_list ul li .title span {
    display: block;
}

.coupon_select_modal .coupon_select_list ul li .title .price {
    color: #000;
    font-size: 14px;
    letter-spacing: -.8px;
    font-weight: 700;
    margin-top: 1px;
}

.coupon_select_modal .coupon_select_list ul li .title .period {
    color: #454c53;
    letter-spacing: -.8px;
    font-size: 13px;
    margin-top: 10px;
}

.coupon_list ul li .coupon_left .condition, .coupon_select_modal .coupon_select_list ul li .title .condition {
    margin-top: 14px;
    position: relative;
}

.coupon_list ul li .coupon_left .condition>span, .coupon_select_modal .coupon_select_list ul li .title .condition>span {
    color: #72787f;
    font-size: 12px;
    float: left;
    line-height: 13px;
}

.coupon_list ul li .coupon_left .condition img, .coupon_select_modal .coupon_select_list ul li .title .condition img {
    width: 13px;
    float: left;
    margin-left: 4px;
}

.coupon_list ul li .coupon_left .condition .history_coupon_condition, .coupon_select_modal .coupon_select_list ul li .title .condition .history_coupon_condition {
    font-size: 12px;
    color: #454c53;
    letter-spacing: -.2px;
    display: none;
    position: absolute;
    padding: 11px 13px;
    text-align: left;
    width: 213px;
    background-color: #fff;
    border: 1px solid #93a4aa;
    z-index: 3;
    top: 14px;
    left: 0;
}

.coupon_list ul li .coupon_left .condition:after, .coupon_select_modal .coupon_select_list ul li .title .condition:after {
    display: block;
    clear: both;
    content: "";
}

.coupon_select_modal .coupon_select_list ul li .title .condition.mobile_condition {
    display: none;
}

.coupon_list ul li .coupon_left .condition, .coupon_select_modal .coupon_select_list ul li .title .condition {
    margin-top: 14px;
    position: relative;
}

.coupon_list ul li .coupon_left .condition .history_coupon_condition span:last-child, .coupon_select_modal .coupon_select_list ul li .title .condition span:last-child {
    margin-bottom: 0;
}

.coupon_list ul li .coupon_left .condition>span, .coupon_select_modal .coupon_select_list ul li .title .condition>span {
    color: #72787f;
    font-size: 12px;
    float: left;
    line-height: 13px;
}

.coupon_select_modal .coupon_select_list ul li:after {
    display: block;
    clear: both;
    content: "";
}

.coupon_select_modal .coupon_popup_footer {
    float: left;
}

.coupon_select_modal .coupon_popup_footer .coupon_popup_btn_box {
    text-align: center;
    margin: 30px 0 40px;
}

.coupon_select_modal .coupon_popup_footer .coupon_popup_btn_cancel {
    font-size: 15px;
    padding: 10px 0;
    border-radius: 3px;
    width: 148px;
    background-color: #a2b5bb;
    color: #fff;
}

.coupon_select_modal .coupon_popup_footer .coupon_popup_btn_submit {
    font-size: 15px;
    padding: 10px 0;
    border-radius: 3px;
    width: 148px;
    background-color: #0484f6;
    color: #fff;
    margin-left: 20px;
}




/* 끝 5.17cw================================================ */
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="item_list_area">
		<div class="breadcrumbs">
			<ul>
				<li><a href="/">HOME</a></li>
			</ul>
		</div>
		<div class="main_area">
			<div class="main_area_center">
				<div class="main">
					<div class="order_title_wrapper">
						<div class="title">주문서</div>
					</div>
					<div class="order_content_wrapper">
						<ul>
							<li class="order_card"><div class="card_cont deal_card_cont">
									<ul class="item_list">
										<li><div class="card_box card_box_list">
												<div
													class="image_wrapper image_wrapper_main_col_1 deal_image_wrapper">
													<div class="image_outside">
														<div class="image_centerbox">
															<img class="thumbnail_img"
																src="https://ccimg.hellomarket.com/images/2023/item/05/04/16/3014274_4045984_1.jpg?size=s4"
																alt="디올 어딕트 숄더백">
														</div>
													</div>
												</div>
												<div class="cont cont_main_col_1">
													<div class="item_title title_main_col_1">디올 어딕트 숄더백</div>
													<div class="item_price pri_main_col_1">1,599,000원</div>
													<div class="item_hasdeliveryfee">무료배송</div>
												</div>
											</div></li>
									</ul>
								</div></li>
							<li class="order_card "><div class="title_box">배송지</div>
								<div class="parcel_wrapper">
									<div class="label adress_label">배송지선택</div>
									<div class="selectbox_order se_order_adress">
										<label for="adressList">배송지를 선택해주세요.</label><select
											disabled=""><option hidden="">배송지를 선택해주세요.</option>0
										</select>
									</div>
									<div class="adress_btn_wrapper">
										<button type="button">주소 초기화</button>
									</div>
								</div>
								<ul class="order_member_info">
									<li><dl>
											<dt>이름</dt>
											<dd class="order_member_name">
												<input type="text" class="w_10" name="receiverName"
													placeholder="이름 입력" value="">
											</dd>
										</dl></li>
									<li><dl>
											<dt>연락처</dt>
											<dd class="order_member_phone">
												<input type="number" class="w_10" placeholder="숫자만 입력"
													value="">
											</dd>
										</dl></li>
									<li><dl>
											<dt>주소</dt>
											<dd>
												<div readonly="" name="senderHide" class="div_input_st">우편번호
													입력</div>
												<button class="addr_search">주소찾기</button>
											</dd>
										</dl></li>
									<li><dl>
											<dt></dt>
											<dd>
												<div readonly="" name="receiverAddr1" class="div_input_st">기본주소
													입력</div>
												<input type="text" name="receiverAddr2"
													placeholder="상세주소 입력" class="w_10" value="">
											</dd>
										</dl></li>
								</ul></li>
							<li class="order_card last_order_card"><div
									class="order_card_left">
									<div class="title_box">쿠폰/포인트 할인</div>
									<div>
										<div class="wallet_wrapper wallet_items_wrapper">
											<div class="box_coupon">
												<div class="title order_sub_title">쿠폰</div>
												<div class="box_coupon_right">
													<div>
														<div class="description">적용 0장 | 보유 3장</div>
														<div class="coupon_btn">쿠폰선택</div>
													</div>
													<div class="price">
														0<span>원</span>
													</div>
												</div>
											</div>
											<div class="certified_box hide">
												<div class="title_txt">
													<span>핸드폰 인증</span>
												</div>
												<div class="phone_number_box">
													<input type="number" placeholder="숫자만 입력">
													<button class="addr_search">인증요청</button>
												</div>
												<div class="auth_code_box">
													<input type="number" placeholder="인증번호 입력">
													<button class="addr_search">인증</button>
												</div>
											</div>
										</div>
									</div>
									<div class="title_box sub_title_box">
										<span class="payment_method"> 결제수단</span>
										<div class="etc_other_wrapper_form">
											<span class="other_wrapper_description other_wrapper_box">택배나
												등기 이외 방법으로 거래하시나요? <span>&gt;</span>
											</span>
										</div>
									</div>
									
									<div><div><ul class="pay_method_list item_pay_method_list"><div class="other_wrapper_div"><ul><li><div class="wrapper_div other_wrapper_div_option checked"><div class="info"><label for="Kakaopay" class="radio_desc">카카오페이</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="EasyBank" class="radio_desc">간편 계좌이체</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="CreditCard" class="radio_desc">신용카드</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="Toss" class="radio_desc">토스결제</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="MobilePhone" class="radio_desc">휴대폰</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="VirtualBank" class="radio_desc">무통장(가상계좌)</label></div><div class="exp"></div></div></li></ul></div><div class="other_wrapper_consignment"><span>카카오페이 수수료 : 3.2%</span></div></ul></div><div class="certified_box hide"><div class="title_txt"><span>핸드폰 인증</span></div><div class="phone_number_box"><input type="number" placeholder="숫자만 입력"><button class="addr_search">인증요청</button></div><div class="auth_code_box"><input type="number" placeholder="인증번호 입력"><button class="addr_search">인증</button></div></div></div>
									
									
									
									
									
									
									
									
									
									
									
									
									<div>
										<div class="certified_box hide">
											<div class="title_txt">
												<span>핸드폰 인증</span>
											</div>
											<div class="phone_number_box">
												<input type="number" placeholder="숫자만 입력">
												<button class="addr_search">인증요청</button>
											</div>
											<div class="auth_code_box">
												<input type="number" placeholder="인증번호 입력">
												<button class="addr_search">인증</button>
											</div>
										</div>
									</div>
								</div>
								<div class="order_card_right">
									<div class="title_box sub_last_title_box">최종결제금액</div>
									<div class="final_order_wrapper">
										<div class="final_order_price">
											<dl
												class="final_order_price_border_bottom final_order_price_padding">
												<dt>상품가격</dt>
												<dd>1,599,000원</dd>
											</dl>
											<dl>
												<dt>쿠폰 사용</dt>
												<dd>0원</dd>
											</dl>
											<dl class="final_order_price_margin">
												<dt>배송비</dt>
												<dd style="color: rgb(114, 120, 127); font-size: 13px;">무료배송</dd>
											</dl>
											<dl>
												<dt>
													결제수수료<span class="payment_method_credit">간편 계좌이체
														1.9%적용</span>
												</dt>
												<dd>30,381원</dd>
											</dl>
											<dl
												class="final_order_price_border_bottom final_order_price_padding">
												<dt>안전거래수수료</dt>
												<dd>1,000원</dd>
											</dl>
										</div>
										<div class="order_total_price">
											<div class="title">최종결제금액</div>
											<div class="price" id="orderTotalPrice">1,630,381원</div>
										</div>
										<div class="policy_area">
											<div class="info">
												<label class="feature_option feature_option_checkbox">&nbsp;
													<div class="feature_option_checkbox_indicator"></div>
												</label>
											</div>
											<div class="description">
												결제하기 클릭시 <span class="txt-bl-12 txt_un">결제시 유의사항</span> 및 <span
													class="txt-bl-12 txt_un">반품환불정책</span>을 모두 이해하고 이에 동의함을
												의미합니다.
											</div>
										</div>
										<div class="success_btn_box">
											<div class="success_btn btn_disabled">결제하기</div>
										</div>
									</div>
								</div></li>
							<form method="post" id="SETTLEBANK_PAYINFO"
								target="orderServiceForm">
								<input type="hidden" name="PMid"><input type="hidden"
									name="PAmt"><input type="hidden" name="PGoods"><input
									type="hidden" name="POid"><input type="hidden"
									name="PMname"><input type="hidden" name="PEname"
									value="HELLOMARKET"><input type="hidden" name="PUname"><input
									type="hidden" name="PNoti" value=""><input
									type="hidden" name="PNoteUrl"><input type="hidden"
									name="PNextPUrl"><input type="hidden" name="PCancPUrl"><input
									type="hidden" name="PUserid"><input type="hidden"
									name="PVtransDt"><input type="hidden" name="PBnkCd"><input
									type="hidden" name="PUiFlag" value="Y"><input
									type="hidden" name="PAppScheme" value="hellomarket://"><input
									type="hidden" name="PCardType" value="6"><input
									type="hidden" name="PChainUserId">
							</form>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>