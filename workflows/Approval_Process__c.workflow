<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Approval_Process_EntryCriteria_after_255</fullName>
        <description>It captures part of entry criteria that is after first 255 characters of the approval process entry criteria.</description>
        <field>Entry_Criteria_2__c</field>
        <formula>IF(LEN(Entry_Criteria__c) &gt; 255, RIGHT(Entry_Criteria__c, LEN(Entry_Criteria__c) - 255),null)</formula>
        <name>Approval Process EntryCriteria after 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Process_Entry_Criteria_till_255</fullName>
        <description>It captures first 255 characters of the approval process entry criteria field.</description>
        <field>Entry_Criteria_1__c</field>
        <formula>IF(LEN(Entry_Criteria__c) &gt; 255, LEFT(Entry_Criteria__c,255),Entry_Criteria__c)</formula>
        <name>Approval Process Entry Criteria till 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Split Approval Process Entry Criteria</fullName>
        <actions>
            <name>Approval_Process_EntryCriteria_after_255</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Approval_Process_Entry_Criteria_till_255</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Approval_Process__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>It will split the entry criteria in two fields if its length is more than 255 characters.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
