//Trigger to be moved to TriggerFactory
trigger CustomerProfileTrigger on CustomerProfile__c (before Insert) {
    for(CustomerProfile__c cp:Trigger.New){
        //Default Owner to be set as current user if not specified
        if(cp.owner__c==null){
            cp.owner__c=userInfo.getuserid();
        }
    }
}