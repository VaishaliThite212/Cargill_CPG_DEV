/*********************************************************************
Author: sanhita.hegde(sanhita.hegde@accenture.com)
class:TaskHelper
Description: Helps "MastertTask" trigger
************************************************************************/
public with sharing class TaskTriggerHelper {
    Private List<Task> newTaskList = new List<Task>();
    /*********************************************************************
Author: sanhita.hegde(sanhita.hegde@accenture.com)
class:TaskHelper
Description: constructor
************************************************************************/
    public TaskTriggerHelper( List<Task> newTriggerList){
        newTaskList = newTriggerList ;
        
    }
    /*****************************************************************************************************************************
Author:sanhita.hegde
Description: Populate the Business__c  field on Task by cargill_Business_Unit__c  from Assigned user record.
method name : populateBisiness()
*********************************************************************************************************************************/
    public void populateBusiness(){
        try{
            List<Id> taskOwnerId = new List<Id>();
            For(Task t:newTaskList){
                taskOwnerId.add(t.OwnerId);
            }
            Map<Id,String> userBusiness = new Map<Id,String>();
            //get the cargill_Business_Unit__c from Assigned User 
            for(User u:[select Id,cargill_Business_Unit__c from User where Id IN:taskOwnerId LIMIT 10000]){
                userBusiness.put(u.Id,u.cargill_Business_Unit__c);
            }
            //get the Id of Business record so that we can assign it to look up field.
            Map<String,Id> businessUnitMap = new Map<String,Id>();
            for(Business__c bUnit:[select Id,Name from Business__c where Name IN:userBusiness.Values() LIMIT 10000]){
                businessUnitMap.put(bUnit.Name,bUnit.Id);
            }
            For(Task t:newTaskList){
                if(t.Business__c == null){
                    t.Business__c = businessUnitMap.get(userBusiness.get(t.OwnerId));
                }
            }
        }
        catch(Exception e){
            Throw e;
        }
    }
    
    
}