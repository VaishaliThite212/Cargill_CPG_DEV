<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Mark_Appendix_False</fullName>
        <field>isAppendix__c</field>
        <literalValue>0</literalValue>
        <name>Mark Appendix False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>true</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mark_Appendix_True</fullName>
        <field>isAppendix__c</field>
        <literalValue>1</literalValue>
        <name>Mark Appendix True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>true</protected>
    </fieldUpdates>
    <rules>
        <fullName>Mark Appendix False</fullName>
        <actions>
            <name>Mark_Appendix_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Section__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Appendix</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mark Appendix True</fullName>
        <actions>
            <name>Mark_Appendix_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Section__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Appendix</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
