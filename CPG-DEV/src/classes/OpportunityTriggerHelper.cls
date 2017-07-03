/*****************************************************************************************************************************
Author:sanhita.hegde
Description: Helps MasterOpp trigger
name :OpportunityTriggerHelper 
*********************************************************************************************************************************/
public with Sharing class  OpportunityTriggerHelper {
    Private List<Opportunity> newOppList = new List<Opportunity>();
    Private map<id,opportunity> mapOfOpportunities = new map<id,opportunity>();
    /*****************************************************************************************************************************
Author:sanhita.hegde
Description: Helps MasterOpp trigger
name :OpportunityTriggerHelper constructor
*********************************************************************************************************************************/
    public OpportunityTriggerHelper( List<Opportunity> newTriggerList,map<id,opportunity>mapOftrigger){
        newOppList = newTriggerList ;
        mapOfOpportunities = mapOftrigger;
    }
    
    /*****************************************************************************************************************************
Author:sanhita.hegde
Description: Populate the Business__c  field on opprtunity by cargill_Business_Unit__c  from owner user record.
method name : populateBisiness()
*********************************************************************************************************************************/
    public void populateBisiness(){
        try{
            List<Id> taskOwnerId = new List<Id>();
            For(Opportunity t:newOppList){
                taskOwnerId.add(t.OwnerId);
            }
            Map<Id,String> userBusiness = new Map<Id,String>();
            //get the assigned users from user records
            
            for(User u:[select Id,cargill_Business_Unit__c from User where Id IN : taskOwnerId LIMIT 10000]){
                userBusiness.put(u.Id,u.cargill_Business_Unit__c);
            }
            
            //Get the business records with the same name mentioned in User record
            Map<String, Id>businessUnitMap = new Map<String, Id>();
            for(Business__c bUnit : [select Id,Name from Business__c where Name IN:userBusiness.Values() LIMIT 10000]){
                businessUnitMap.put(bUnit.Name, bUnit.Id);
            }
            For(Opportunity t:newOppList){
                if(t.Business__c == null){
                    t.Business__c =businessUnitMap.get(userBusiness.get(t.OwnerId));
                }
            }   
        }
        catch(Exception e){
            throw e;
        }
        
        
    }
    
    public void populateoriginalName(){
        For(Opportunity ot:newOppList){
            if(ot.OriginalName__c== null){
                ot.OriginalName__c =ot.Name;
                
            }
            
        }
    }
}