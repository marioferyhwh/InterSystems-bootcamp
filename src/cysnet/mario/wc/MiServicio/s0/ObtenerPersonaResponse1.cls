/// Creado desde: http://localhost:52773/csp/mario/cysnet.mario.ws.MiServicio.cls?WSDL
Class cysnet.mario.wc.MiServicio.s0.ObtenerPersonaResponse1 Extends cysnet.mario.wc.MiServicio.s0.EnsResponse [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "ObtenerPersonaResponse";

Parameter XMLTYPE = "ObtenerPersonaResponse";

Property nombre As %String(MAXLEN = "", XMLNAME = "nombre");

Property apellido As %String(MAXLEN = "", XMLNAME = "apellido");

Property edad As %Integer(XMLNAME = "edad");

Property direccion As %String(MAXLEN = "", XMLNAME = "direccion");

Property codPostal As %Integer(XMLNAME = "codPostal");

Property mensaje As %String(MAXLEN = 255, XMLNAME = "mensaje");

Storage Default
{
<Data name="ObtenerPersonaResponse1State">
<Subscript>"ObtenerPersonaResponse1"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellido</Value>
</Value>
<Value name="3">
<Value>edad</Value>
</Value>
<Value name="4">
<Value>direccion</Value>
</Value>
<Value name="5">
<Value>codPostal</Value>
</Value>
<Value name="6">
<Value>mensaje</Value>
</Value>
</Data>
<State>ObtenerPersonaResponse1State</State>
<Type>%Storage.Serial</Type>
}

}
