<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CPG_UpdateCustomerProfileName</fullName>
        <field>Name</field>
        <formula>&quot;| &quot; &amp;  Account__r.Name &amp; &quot; | &quot; &amp; TEXT(DATEVALUE(CreatedDate)) &amp; &quot; | &quot; &amp; Name &amp; &quot; | &quot;</formula>
        <name>Update Customer Profile Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CPG_UpdateCustomerProfileName</fullName>
        <actions>
            <name>CPG_UpdateCustomerProfileName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
