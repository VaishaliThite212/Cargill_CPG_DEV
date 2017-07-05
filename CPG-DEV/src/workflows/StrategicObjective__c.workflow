<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CPG_UpdateStrategicObjectiveName</fullName>
        <field>Name</field>
        <formula>&quot;| &quot; &amp;  CustomerProfile__r.Account__r.Name &amp; &quot; | &quot; &amp; TEXT(DATEVALUE(CreatedDate)) &amp; &quot; | &quot; &amp; Name &amp; &quot; | &quot;</formula>
        <name>Update Strategic Objective Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CPG_UpdateStrategicObjectiveName</fullName>
        <actions>
            <name>CPG_UpdateStrategicObjectiveName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
