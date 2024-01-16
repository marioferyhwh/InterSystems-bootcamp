/// compueba que los datos recividos son validos
Class cysnet.mario.rules.CheckDAtosVAlidos Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="cysnet.mario.bp.MiProceso.Context" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Comrpobar ObtenerPersona" disabled="false">
<when condition="nombreClase=&quot;ObtenerPersonaRequest&quot;" comment="">
<rule name="comprobar idPersona" disabled="false">
<when condition="(objReq.idPersona!=&quot;&quot;)&amp;&amp;(objReq.idPersona&gt;0)" comment="">
<return>1</return>
</when>
</rule>
</when>
</rule>

<rule name="Comprobar CrearPersona" disabled="false">
<when condition="nombreClase=&quot;CrearPersonaRequest&quot;" comment="">
<rule name="Comprobar nombre y apellido" disabled="false">
<when condition="(objReq.nombre!=&quot;&quot;)&amp;&amp;(objReq.apellido!=&quot;&quot;)" comment="">
<return>1</return>
</when>
</rule>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
