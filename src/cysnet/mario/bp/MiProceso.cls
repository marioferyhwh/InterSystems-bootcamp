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
<property name='DBCache' type='cysnet.mario.msg.CrearPersonaResponse' instantiate='0' />
</context>
<sequence xend='200' yend='850' >
<switch name='Según mensaje' xpos='200' ypos='250' xend='200' yend='750' >
<case condition='request.%ClassName() = "CrearPersonaRequest"' name='crearPersona' >
<call name='crear Persona' target='DBCache' async='0' xpos='335' ypos='400' >
<request type='cysnet.mario.msg.CrearPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.mario.msg.CrearPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</case>
<case condition='request.%ClassName() = "ObtenerPersonaRequest"' name='ObtenerPersona' >
<if name='&gt; 0' condition='request.idPersona &gt; 0' xpos='605' ypos='400' xend='605' yend='650' >
<true>
<call name='Obtener Persona' target='DBCache' async='0' xpos='875' ypos='550' >
<request type='cysnet.mario.msg.ObtenerPersonaRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='cysnet.mario.msg.ObtenerPersonaResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
<false>
<assign name="MESSAGE" property="response.mensaje" value="&quot;Este es el mensaje de error&quot;" action="set" xpos='605' ypos='550' />
</false>
</if>
</case>
<default name='default' />
</switch>
</sequence>
</process>
}

}
