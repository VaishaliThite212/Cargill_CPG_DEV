/**
@Author - Harshavi Tanguturi
@name - ProductActivationUpdateTrigger
@CreateDate - 01-19-2017
@Description - This is a trigger to update the opportunity products based on the products
@Revision-
*/ 
trigger ProductActivationUpdateTrigger on Product2 (after update) {
   
    if(Trigger.IsUpdate){
    ProductActivationTriggerHelper.retrieveProduct(Trigger.new,Trigger.oldMap);
    }
}