/*************************************************************************************************************************************************************
*@ Version:        1.0
@ Author:     Sanhit.Hegde
@ Req No:     task 39     
@ Refer Classes:  
@ Purpose:        
**************************************************************************************************************************************************************/
trigger MasterTriggerTask on Task (before Insert) {
    
    /*********************Before Insert******************************************************/   
    If(Trigger.isBefore && Trigger.isInsert){
        beforeInsertorUpdate();
    }
   
    
    /********************methods to call helper class****************************************/   
    public void beforeInsertorUpdate(){
        TaskTriggerHelper methodCall = new TaskTriggerHelper (Trigger.new);
        methodCall.populateBusiness();
        
    }
     
         
    
    
}