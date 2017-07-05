<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CP_UpdateAccountPlanName</fullName>
        <field>Name</field>
        <formula>&quot;| &quot; &amp;  Account__r.Name &amp; &quot; | &quot; &amp;  TEXT(DATEVALUE(CreatedDate)) &amp; &quot; | &quot; &amp;  Name &amp; &quot; | &quot;</formula>
        <name>Update Account Plan Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reject_Status_Update</fullName>
        <field>Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Reject Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Update</fullName>
        <field>Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CPG_UpdateAccountPlanName</fullName>
        <actions>
            <name>CP_UpdateAccountPlanName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
