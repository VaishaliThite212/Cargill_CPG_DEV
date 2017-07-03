<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Clear_Approved_Date</fullName>
        <field>Approved_Date__c</field>
        <name>Clear Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Prepared_Date</fullName>
        <field>Prepared_Date__c</field>
        <name>Clear Prepared Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Reviewed_Date</fullName>
        <field>Reviewed_Date__c</field>
        <name>Clear Reviewed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Approval_in_Progress_to_False</fullName>
        <field>Approval_In_Progress__c</field>
        <literalValue>0</literalValue>
        <name>Set Approval in Progress to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Approval_in_Progress_to_True</fullName>
        <field>Approval_In_Progress__c</field>
        <literalValue>1</literalValue>
        <name>Set Approval in Progress to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Approved_to_False</fullName>
        <field>Approved__c</field>
        <literalValue>0</literalValue>
        <name>Set Approved to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Approved_to_True</fullName>
        <field>Approved__c</field>
        <literalValue>1</literalValue>
        <name>Set Approved to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Approved_Date</fullName>
        <field>Approved_Date__c</field>
        <formula>Today()</formula>
        <name>Update Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Prepared_Date</fullName>
        <field>Prepared_Date__c</field>
        <formula>Today()</formula>
        <name>Update Prepared Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Reviewed_Date</fullName>
        <field>Reviewed_Date__c</field>
        <formula>Today()</formula>
        <name>Update Reviewed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
