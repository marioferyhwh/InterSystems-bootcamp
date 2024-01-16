/// 
Class cysnet.mario.bp.MiProceso Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='objReq' type='Ens.Request' instantiate='0' />
<property name='nombreClase' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='resultadoRegla' type='%Boolean' initialexpression='0' instantiate='0' />
</context>
<sequence xend='200' yend='1400' >
<assign name="Asignar objReq" property="context.objReq" value="request" action="set" xpos='200' ypos='250' />
<assign name="Asignar nombreClase" property="context.nombreClase" value="request.%ClassName()" action="set" xpos='200' ypos='350' />
<rule name='Check datos válidos' rule='cysnet.mario.rules.CheckDAtosVAlidos'  resultLocation='context.resultadoRegla' ruleContext='context' xpos='200' ypos='450' >
</rule>
<if name='todo bien' condition='context.resultadoRegla = 1' xpos='200' ypos='550' xend='200' yend='1300' >
<true>
<switch name='Según mensaje' xpos='335' ypos='700' xend='335' yend='1200' >
<case condition='request.%ClassName() = "CrearPersonaRequest"' name='crearPersona' >
<call name='crear Persona' target='DBCache' async='0' xpos='470' ypos='850' >
<request type='cysnet.mario.msg.CrearPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.mario.msg.CrearPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "ObtenerPersonaRequest"' name='ObtenerPersona' >
<if name='&gt; 0' condition='request.idPersona &gt; 0' xpos='740' ypos='850' xend='740' yend='1100' >
<true>
<call name='Obtener Persona' target='DBCache' async='0' xpos='1010' ypos='1000' >
<request type='cysnet.mario.msg.ObtenerPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.mario.msg.ObtenerPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
<false>
<assign name="MESSAGE" property="response.mensaje" value="&quot;Este es el mensaje de error&quot;" action="set" xpos='740' ypos='1000' />
</false>
</if>
</case>
<default name='default' />
</switch>
</true>
</if>
</sequence>
</process>
}

}
