<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Renewal_Opportunity_Notification</fullName>
        <description>Renewal Opportunity Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cargill_Protein_Email_Templates/Automated_Renewal_Opportunity_Notice</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_RecordType_to_Closed_Opp</fullName>
        <description>Update the RecordType to Closed Opportunity</description>
        <field>RecordTypeId</field>
        <lookupValue>Closed_Opportunity</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change RecordType to Closed Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_CloseDate_to_Estimated_Close_Date</fullName>
        <field>EstimatedCloseDate__c</field>
        <formula>CloseDate</formula>
        <name>Copy CloseDate to Estimated Close Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_Original_User_Input_Opp_Name</fullName>
        <field>OriginalName__c</field>
        <formula>Name</formula>
        <name>Copy Original User Input Opp Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Order_Of_workflow</fullName>
        <field>WorkFlowOrder__c</field>
        <formula>1</formula>
        <name>Set Order Of workflow</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateOpportunityStageToExplore</fullName>
        <field>StageName</field>
        <literalValue>Explore</literalValue>
        <name>Update Opportunity Stage To Explore</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opportunity_Name_1</fullName>
        <field>Name</field>
        <formula>IF(
   ISNEW(),
       BusinessAlias__c &amp; &quot; | &quot; &amp; Account.Name &amp; &quot; | &quot;&amp; CloseDateTEXT__c &amp;&quot; | &quot;&amp; Name,
       IF(
          ISCHANGED(Business__c),
          SUBSTITUTE(Name, PRIORVALUE(BusinessAlias__c),BusinessAlias__c),
          Name
          )
   )</formula>
        <name>Update Opportunity Name 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opporunity_Name</fullName>
        <field>Name</field>
        <formula>IF(
   ISNEW(),
       BusinessAlias__c &amp; &quot; | &quot; &amp; Account.Name &amp; &quot; | &quot;&amp; CloseDateTEXT__c &amp;&quot; | &quot;&amp; OriginalName__c,
       IF(
          ISCHANGED(CloseDate) || ISCHANGED(Business__c) ,
             BusinessAlias__c &amp; &quot; | &quot; &amp; Account.Name &amp; &quot; | &quot;&amp; CloseDateTEXT__c &amp;&quot; | &quot;&amp; OriginalName__c,
          Name
          )
   )</formula>
        <name>Update Opporunity Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>namedefault</fullName>
        <field>Name</field>
        <formula>IF( 
ISNEW(), 
BusinessAlias__c &amp; &quot; | &quot; &amp; Account.Name &amp; &quot; | &quot;&amp; CloseDateTEXT__c &amp;&quot; | &quot;&amp; Name, 
IF( 
ISCHANGED(CloseDate) || ISCHANGED(Business__c) , 
BusinessAlias__c &amp; &quot; | &quot; &amp; Account.Name &amp; &quot; | &quot;&amp; CloseDateTEXT__c &amp;&quot; | &quot;&amp; OriginalName__c, 
Name 
) 
)</formula>
        <name>namedefault</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>nameforClone</fullName>
        <field>Name</field>
        <formula>IF( 
ISCHANGED(CloseDate) || ISCHANGED(Business__c) ||ISCHANGED( AccountId ), 
BusinessAlias__c &amp; &quot; | &quot; &amp; Account.Name &amp; &quot; | &quot;&amp; CloseDateTEXT__c &amp;&quot; | &quot;&amp; OriginalName__c , 
Name 
)</formula>
        <name>nameforClone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Convert CLOSED Opps to Locked</fullName>
        <actions>
            <name>Change_RecordType_to_Closed_Opp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won,Closed Lost</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Naming Convention</fullName>
        <actions>
            <name>Update_Opporunity_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Opportunity Name to Cargill Opportunity Naming Convention:
Business Alias | Account Name | Close Date | User Provide Opportunity Name

Update the Naming Convention if any of the component values change.</description>
        <formula>(ISNEW() || ISCHANGED(Business__c) || ISCHANGED(CloseDate))&amp;&amp;( IsApexCloned__c = false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Naming Convention For Cloned Records</fullName>
        <actions>
            <name>nameforClone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This will Update the fields for cloned records this workflow will update the default value for opportunity</description>
        <formula>AND(    RecordType.Name &lt;&gt; &quot;Project&quot;,    CreatedDate != LastModifiedDate,    IsApexCloned__c == TRUE,    OR(       ISCHANGED(CloseDate),       ISCHANGED(AccountId),       ISCHANGED(BusinessAlias__c)       )     )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Renewal Opportunity Notification</fullName>
        <actions>
            <name>Renewal_Opportunity_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Sends the email notification to the owner when created by != owner of the record.</description>
        <formula>AND(CreatedBy.Id != OwnerId, IsApexCloned__c = True)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Estimated Close Data on Create</fullName>
        <actions>
            <name>Copy_CloseDate_to_Estimated_Close_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Copy the originally estimated Close Date to Estimated Close Date on Create.</description>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>SetDefaultOpportunityStage</fullName>
        <actions>
            <name>UpdateOpportunityStageToExplore</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Opportunity Stage default to &quot;Explore&quot;</description>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
