@isTest
public class TaskTriggerHelper_Test {
    static testMethod void validateHelper(){
        Business__c b = new Business__c();
        b.BusinessUnitAlias__c = 'Foods Brazil';
        b.Name = 'Cargill Foods Brazil';
        b.CargillEnterprise__c = 'FoodIngredientsBioIndustrialFIBI';
        b.CargillGroup__c = 'GoToMarket (GTM)';
        Insert b;
        
        
        Task insertNew = new Task();
        insertNew.Subject ='Test';
        insertNew.OwnerId = [select Id from User  Limit 1].ID;
        insertNew.Priority = 'Normal';
        insertNew.Status ='Open';
        Insert insertNew;
    }

}