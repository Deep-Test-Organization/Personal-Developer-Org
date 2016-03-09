<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Rule_Criteria_after_255</fullName>
        <description>It captures part of rule criteria that is after first 255 characters of the workflow rule criteria.</description>
        <field>Rule_Criteria_2__c</field>
        <formula>IF(LEN(Rule_Criteria__c) &gt; 255, RIGHT(Rule_Criteria__c, LEN(Rule_Criteria__c) - 255),null)</formula>
        <name>Rule Criteria after 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule_Criteria_till_255</fullName>
        <description>It captures first 255 characters of the workflow rule criteria field.</description>
        <field>Rule_Criteria_1__c</field>
        <formula>IF(LEN(Rule_Criteria__c) &gt; 255, LEFT(Rule_Criteria__c,255),Rule_Criteria__c)</formula>
        <name>Rule Criteria till 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Split Rule Criteria</fullName>
        <actions>
            <name>Rule_Criteria_after_255</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Rule_Criteria_till_255</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Workflow_Rule__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>It will split the rule criteria in two fields if its length is more than 255 characters.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
