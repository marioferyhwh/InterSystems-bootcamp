/// 
Class cysnet.mario.rules.HL7RoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="cysnet.mario.MiProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="InFileHL7" disabled="false">
<constraint name="source" value="InFileHL7"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="cysnet.mario.dtl.HL7ToCrearPersona" target="DBCache"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
