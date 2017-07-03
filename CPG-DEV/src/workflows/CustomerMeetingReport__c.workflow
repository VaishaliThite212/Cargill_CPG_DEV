<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Customer_Meeting_Report_Name</fullName>
        <field>Name</field>
        <formula>Account__r.Name  &amp;&quot; | &quot;&amp; PrimaryAttendee__r.LastName  &amp;&quot; | &quot;&amp; MeetingDate1__c</formula>
        <name>Customer Meeting Report Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Customer Meeting Report Naming Convention</fullName>
        <actions>
            <name>Customer_Meeting_Report_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
