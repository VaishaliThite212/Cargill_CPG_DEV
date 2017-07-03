<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_Team_of_Defect</fullName>
        <description>Notify Team of Defect</description>
        <protected>false</protected>
        <recipients>
            <field>Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CloudGURU/Defect_Opened_Notification_Template</template>
    </alerts>
    <alerts>
        <fullName>Notify_User_of_Defect_Resolution</fullName>
        <description>Notify User of Defect Resolution</description>
        <protected>true</protected>
        <recipients>
            <field>Raised_By__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CloudGURU/Defect_Resolved_Notification_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_Recordtype_to_Open</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Open</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Recordtype to Open</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>true</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Recordtype_to_Resolved</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Resolved</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Recordtype to Resolved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>true</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Build_Complete_Date</fullName>
        <field>Build_Complete_Date__c</field>
        <formula>Today()</formula>
        <name>Set Build Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Defect Opened%2FReOpened</fullName>
        <actions>
            <name>Notify_Team_of_Defect</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Change_Recordtype_to_Open</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Defect__c.Status__c</field>
            <operation>equals</operation>
            <value>Open,ReOpened</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Defect Resolved</fullName>
        <actions>
            <name>Notify_User_of_Defect_Resolution</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Change_Recordtype_to_Resolved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Defect__c.Status__c</field>
            <operation>equals</operation>
            <value>Resolved</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Build Complete Date</fullName>
        <actions>
            <name>Set_Build_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Defect__c.Completed__c</field>
            <operation>equals</operation>
            <value>100</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
