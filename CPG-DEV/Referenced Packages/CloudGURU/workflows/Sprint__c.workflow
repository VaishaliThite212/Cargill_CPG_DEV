<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Baseline_Estimate</fullName>
        <field>Baseline_Estimate__c</field>
        <formula>Effort_Estimate__c</formula>
        <name>Set Baseline Estimate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>true</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Baseline_Scope</fullName>
        <field>Baseline_Scope__c</field>
        <formula>Scope__c</formula>
        <name>Set Baseline Scope</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>true</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Start_Sprint</fullName>
        <field>Started__c</field>
        <literalValue>1</literalValue>
        <name>Start Sprint</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Start Sprint</fullName>
        <actions>
            <name>Set_Baseline_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Baseline_Scope</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Start_Sprint</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sprint__c.Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Sprint__c.Started__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
