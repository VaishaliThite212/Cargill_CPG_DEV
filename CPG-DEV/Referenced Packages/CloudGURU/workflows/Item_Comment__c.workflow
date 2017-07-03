<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_User_of_Comment</fullName>
        <description>Notify User of Comment</description>
        <protected>false</protected>
        <recipients>
            <field>Notification_User__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CloudGURU/Notify_User</template>
    </alerts>
    <rules>
        <fullName>Send Notification to User</fullName>
        <actions>
            <name>Notify_User_of_Comment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Item_Comment__c.Notification_User__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
