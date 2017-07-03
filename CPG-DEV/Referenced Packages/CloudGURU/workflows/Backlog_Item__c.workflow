<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Effort_Estimate_Copy</fullName>
        <field>Effort_Estimate_Copy__c</field>
        <formula>Effort_Estimate__c</formula>
        <name>Effort Estimate (Copy)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>true</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Effort_Remaining_Copy</fullName>
        <field>Effort_Remaining_Copy__c</field>
        <formula>Effort_Remaining__c</formula>
        <name>Effort Remaining (Copy)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Copy Estimate Numbers</fullName>
        <actions>
            <name>Effort_Estimate_Copy</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Effort_Remaining_Copy</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Backlog_Item__c.Reference__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
