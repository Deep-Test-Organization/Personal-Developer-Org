<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Validation_Rule_ErrorCondition_after_255</fullName>
        <description>It captures part of error condition formula that is after first 255 characters of the validation rule error condition formula.</description>
        <field>Error_Condition_Formula_2__c</field>
        <formula>IF(LEN(Error_Condition_Formula__c) &gt; 255, RIGHT(Error_Condition_Formula__c, LEN(Error_Condition_Formula__c) - 255),null)</formula>
        <name>Validation Rule ErrorCondition after 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Validation_Rule_Error_Condition_till_255</fullName>
        <description>It captures first 255 characters of the validation rule error condition formula.</description>
        <field>Error_Condition_Formula_1__c</field>
        <formula>IF(LEN(Error_Condition_Formula__c) &gt; 255, LEFT(Error_Condition_Formula__c,255),Error_Condition_Formula__c)</formula>
        <name>Validation Rule Error Condition till 255</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Split Validation Rule Error Condition Formula</fullName>
        <actions>
            <name>Validation_Rule_ErrorCondition_after_255</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Validation_Rule_Error_Condition_till_255</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Validation_Rule__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>It will split the error condition formula in two fields if its length is more than 255 characters.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
