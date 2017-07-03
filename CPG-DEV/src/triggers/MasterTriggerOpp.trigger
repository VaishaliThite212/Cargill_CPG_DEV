/*************************************************************************************************************************************************************
 *@ Version:        1.0
@ Author:     Sanhit.Hegde
@ Req No:     task 39     
@ Refer Classes:  
@ Purpose:        
**************************************************************************************************************************************/
trigger MasterTriggerOpp on Opportunity (before Insert,before update) {

/*************Before Insert**********************************/
    If(Trigger.isBefore && Trigger.isInsert){
        beforeInsertorUpdate();
    }
  /*  If(Trigger.isBefore && Trigger.isupdate){
        stageValidation();
    }*/
   
     
/**************methods for calling helper class***************/
    Public Void beforeInsertorUpdate(){
        OpportunityTriggerHelper callMethod = new OpportunityTriggerHelper(Trigger.New,trigger.newmap);
        callMethod.populateBisiness();
        callMethod.populateoriginalName();
        
    }
   /* public void stageValidation(){
    OpportunityTriggerHelper callMethod = new OpportunityTriggerHelper(trigger.new,trigger.newmap);
     callMethod.preventClosedWonOpportunityAll();
      
    }*/
    
}