<%-- 
    Document   : manage_data_product_type_mobile
    Created on : 21 เม.ย. 2556, 16:37:09
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
     $(function(){
        $("#hide").click(function(){
            $("#show_data_product_type_mobile").slideUp("slow");
        });
        $("#show").click(function(){
            bind_data_product_type_mobile();
            $("#show_data_product_type_mobile").slideDown("slow");
        });
        
       $("#cmd_save").click(function(){
            $.ajax({
                url:"controller.manage_data_product_type_mobile?save",
                type:"post",
                data: $("#manage_data_product_type_mobile").serialize(),
                success:function(data){
                    if(data == "complete"){
                        alert("บันทึกข้อมูลแล้ว");
                        //เซ็ต1เป็นค่าdefault เพื่อไม่ให้มันเป้นค่าว่าง ไม่เช่นนั้นจะบันทึกไม่ได้
                        $("#mobile_type_id").val("1");
                        bind_data_product_type_mobile()
                        clear_data();
                    }
                    else if(data == "no_complete"){
                        alert("คุณกรอกไม่ได้กรอกข้อมูล หรือข้อมูลที่คุณกรอกซ้ำกัน");
                        clear_data();
                    }
                    else{
                        alert("ไม่สามารถบันทึกข้อมูลได้");
                    }
                }
            });
        });
    });
    function clear_data(){
        $("#mobile_type").val("");
        $("#detail").val("");
    }
    function bind_data_product_type_mobile(){
        $("#show_data_product_type_mobile").load("controller.manage_data_product_type_mobile?show_data_product_type_mobile");
    }
    
    function delete_data_product_type_mobile(mobile_type_id){
        if(confirm("กรุณายืนยันการลบอีกครั้ง !!!")){
            $.ajax({
                url:"controller.manage_data_product_type_mobile?delete",
                type:"post",
                data: {mobile_type_id : mobile_type_id},
                success:function(data){
                    if(data == "complete"){
                        bind_data_product_type_mobile();
                    }
                    else if(data = "no_complete"){
                        alert(data);
                    }
                }
            });
            return true;
        }else{
            return false;
        }
    }
    function edit_data_product_type_mobile(mobile_type_id){    
        $.ajax({
            url:"controller.manage_data_product_type_mobile?edit",
            type:"post",
            data: {mobile_type_id : mobile_type_id},
            success:function(data){
                //แยกคำที่รับค่ามาจากการresponse จากservletออกจากกันเพื่อนำมาใช้งาน
                var arr = data.split ( "," );
                $("#mobile_type_id").val(mobile_type_id); 
                $("#mobile_type").val(arr[0]); //ส่งไปเเบบhiddenเพื่อเก็บค่านี้ไว้ใช้งาน
                $("#detail").val(arr[1]);
            }
        });
    }
</script>
<form id="manage_data_product_type_mobile">
    <legend>ข้อมูลประเภทสินค้า(โทรศัพท์)</legend>
    <input type="button" class="btn-info btn-medium" value="แสดง" id="show">&nbsp;<input type="button" class="btn-info btn-medium" value="ซ่อน" id="hide">
    <div id="show_data_product_type_mobile">
    </div>
    <table>
        <tr>
            <td><input type="hidden" name="mobile_type_id" id="mobile_type_id" class="input-large" style="margin: 3px"></td>
        </tr>
        <tr>
            <td>ยี่ห้อ</td>
            <td><input type="text" name="mobile_type" id="mobile_type" class="input-xlarge" style="margin: 3px ;  height: 38px"></td>
        </tr>
        <tr>
            <td>รายละเอียดเพิ่มเติม</td>
            <td><textarea class="field span12" name ="detail" id="detail" cols ="14" rows="4" style="resize:none ; margin: 3px ; width: 300px"></textarea></td>
        </tr>
        <tr>
           <td colspan="8"><input type="button" id="cmd_save" class="btn btn-medium btn-info" value="บันทึกข้อมูล"  style ="margin-left: 115px; margin-right: 3px ;margin-top: 3px ; margin-bottom: 3px ;padding: 5px;width: 100px;height: 45px "></td>
        </tr>
    </table>
</form>

