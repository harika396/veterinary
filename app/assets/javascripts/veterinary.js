// $(document).ajaxSend(function(e, xhr, options) {  var token = $("meta[name='csrf-token']").attr("content");   xhr.setRequestHeader("X-CSRF-Token", token); });  

function selectAllfeatures(){

    var inputs = document.getElementsByTagName("input");
    check_box = document.getElementById('chkall');
   
    
    if (check_box.checked == true) {
        for (var i = 0; i < inputs.length; i++) {
            inputs[i].checked = true;
        }
    }
    else {
        for (var i = 0; i < inputs.length; i++) {
            inputs[i].checked = false;
        }
    }
}

function selectAllPrivileges(){

    var inputs = document.getElementsByTagName("input");
    check_box = document.getElementById('chkall');
   
    
    if (check_box.checked == true) {
        for (var i = 0; i < inputs.length; i++) {
            inputs[i].checked = true;
        }
    }
    else {
        for (var i = 0; i < inputs.length; i++) {
            inputs[i].checked = false;
        }
    }
}


function selectAllRoles(index){
	temp = $(".roles_class_" + index);
    //temp = document.getElementsByClassName('roles_class_' + index);
    main_check = document.getElementById('select_all_roles_' + index);
    if (main_check.checked == true) {
        for (i = 0; i < temp.length; i++) {
            if (temp[i].disabled != true) {
				temp[i].checked = true;
			}
        }
    }
    else {
        for (i = 0; i < temp.length; i++) {
            temp[i].checked = false;
        }
    }
    return false;
}


function change_account(){
  account_id = $("#push_account").val();
  if (account_id == ''){
    $("#apps").empty();
    return;
  }  
  url_path = "/get_account_apps/?account_id=" + account_id;
  $.ajax({
    url : url_path,
    success : function(result) {

    },
  }); 

} 

function select_account_sources(app_type){
  if (app_type == 2){
    $("#account_sources").show();
  }
}

function select_business_model(business_model_type){
 if (business_model_type == 1)
 {
  $("#revenue_share").show();
  $("#subscription").hide();
 }
 else if (business_model_type==2){
  $("#subscription").show();
  $("#revenue_share").show();
 }
 else if (business_model_type ==3 ){
  $("#subscription").show();
  $("#revenue_share").hide();
 }
 else{
  $("#subscription").hide();
  $("#revenue_share").hide();
 }

}

function calculate_total_amount(count){

  if (isNaN($("#invoice_tax_percentage").val())){
    alert("Please Enter valid tax %");
    return
  }

  if (isNaN($("#invoice_item_"+count+"_price").val())){
    alert("Please Enter valid Amount");
    return
  }

  if (isNaN($("#invoice_item_"+count+"_discount_percentage").val()) || $("#invoice_item_"+count+"_discount_percentage").val() > 100){
    alert("Please Enter valid discount and shold not exceed 100");
    return
  }

  temp = document.getElementsByClassName('item-count');
  n = parseInt(temp.length);
  total_amount = 0;
  gross_amount = 0;
  total_discount = 0;
  for (i=1;i<=n;i++)
  { 
    price = parseInt($("#invoice_item_"+i+"_price").val()) ;
    discount = parseInt($("#invoice_item_"+i+"_discount_percentage").val()) ;
    net_amount = price - (price*discount/100);
    total_amount+=net_amount
    gross_amount+=price
    total_discount+=(price*discount/100)
    $("#invoice_item_"+i+"_total").val(net_amount);
  }
  tax_percentage = $("#invoice_tax_percentage").val();
  tax_amount = total_amount*tax_percentage/100
  total_amount_with_tax = total_amount + tax_amount;
  $("#invoice_total_amount").val(total_amount_with_tax);
  $("#total-invoice-item").html(total_amount);
  $("#gross_amount").val(gross_amount);
  $("#total_discount_amount").val(total_discount);
  $("#tax_amount").val(tax_amount);
}

function updateStatus(obj_id, conf_status)
{
  var answer = confirm("Are you sure you want to change status?");
    if (answer){
     url_path = "/invoices/update_status/" + obj_id ;
      $.ajax({
        url: url_path,
        type: "POST",
      })
    }
    
    return false; 
} 


function showError(msg)
{
    $("#error_div").show();
    $('#error_div').html(msg);
    $("#error_div").fadeOut(10000);
}

function check_invoice_items(){
  temp = document.getElementsByClassName('item-count');
  n = parseInt(temp.length);
  for (i=1;i<=n;i++)
  { 
    if ( $("#invoice_item_"+i+"_name").val() == ''){
    alert("Invoice item name  can't be blank");
    return false;
    }
  }
}

function ValidatePushMessaging(){
    var errorMessage;
    if ($("#push_account").val() == ''){
        errorMessage = "Select Account" ;
    }
    if ($("#push_app_id").val() == null){
        if (!errorMessage){
            errorMessage = "Select App id" ;
           }
        else{
            errorMessage+="\nSelect App id"
        }    
    }
    if ($("#push_message").val() == ''){
         if (!errorMessage){
            errorMessage = "Enter Message" ;
           }
        else{
            errorMessage+="\nEnter Message"
        }    
    }
    if (errorMessage) {
        errorMessage = "Please correct the following errors: \n" + errorMessage;
        alert(errorMessage, 350, 200);
        return false;
    }

}
