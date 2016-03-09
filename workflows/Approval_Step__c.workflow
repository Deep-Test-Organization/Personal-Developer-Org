<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Approval_Step_Criteria_after_255</fullName>
        <description>It captures part of criteria that is after first 255 characters of the approval step criteria.</description>
        <field>Criteria_2__c</field>
        <formula>IF(LEN(Criteria__c) &gt; 255, RIGHT(Criteria__c, LEN(Criteria__c) - 255),null)</formula>
        <name>Approval Step Criteria after 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Step_Criteria_till_255</fullName>
        <description>It captures first 255 characters of the approval step criteria.</description>
        <field>Criteria_1__c</field>
        <formula>IF(LEN(Criteria__c) &gt; 255, LEFT(Criteria__c,255),Criteria__c)</formula>
        <name>Approval Step Criteria till 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Split Approval Step Criteria</fullName>
        <actions>
            <name>Approval_Step_Criteria_after_255</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Approval_Step_Criteria_till_255</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Approval_Step__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>It will split the criteria in two fields if its length is more than 255 characters.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
