<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Design_Approach_Approved</fullName>
        <description>Design Approach Approved</description>
        <protected>false</protected>
        <recipients>
            <field>Developer_Assigned__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CloudGURU/Design_Approach_Approved</template>
    </alerts>
    <alerts>
        <fullName>Design_Statement_Added</fullName>
        <description>Design Statement Added</description>
        <protected>false</protected>
        <recipients>
            <field>Requested_By__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CloudGURU/Notify_Requestor_Solution_Added</template>
    </alerts>
    <alerts>
        <fullName>Notify_Developer_Requirement_Assigned</fullName>
        <description>Notify Developer Requirement Assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Developer_Assigned__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CloudGURU/NotifyDevloperReqAssigned</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approach_Approach</fullName>
        <field>Stage__c</field>
        <literalValue>Approach Approval</literalValue>
        <name>Approach Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Developer_Assigned</fullName>
        <field>Stage__c</field>
        <literalValue>Developer Assigned</literalValue>
        <name>Developer Assigned</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estimation_Stage</fullName>
        <field>Stage__c</field>
        <literalValue>Estimation</literalValue>
        <name>Estimation Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mark_Requirement_as_Approved</fullName>
        <field>Approved__c</field>
        <literalValue>1</literalValue>
        <name>Mark Requirement as Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Planning_Stage</fullName>
        <field>Stage__c</field>
        <literalValue>Planning</literalValue>
        <name>Planning Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
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
        <fullName>Design Approach Added</fullName>
        <actions>
            <name>Design_Statement_Added</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Approach_Approach</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Design_Approach__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Design Approach Approved</fullName>
        <actions>
            <name>Design_Approach_Approved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Estimation_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Design_Approved__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Developer Assigned</fullName>
        <actions>
            <name>Notify_Developer_Requirement_Assigned</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Developer_Assigned</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Developer_Assigned__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Estimate Provided</fullName>
        <actions>
            <name>Planning_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Requirement__c.Effort_Estimate__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mark Requirement as Approved</fullName>
        <actions>
            <name>Mark_Requirement_as_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Build Complete Date</fullName>
        <actions>
            <name>Set_Build_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Completed__c</field>
            <operation>equals</operation>
            <value>100</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
