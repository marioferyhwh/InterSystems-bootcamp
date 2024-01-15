Class cysnet.mario.wc.MiServicio.req.crearPersonaRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "cysnet.mario.wc.MiServicio.req.crearPersonaResponse";

Property nombre As %String;

Property apellido As %String;

Property direccion As %String;

Property fechaNacimiento As %String;

Property codPostal As %Integer;

Storage Default
{
<Data name="crearPersonaRequestDefaultData">
<Subscript>"crearPersonaRequest"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellido</Value>
</Value>
<Value name="3">
<Value>direccion</Value>
</Value>
<Value name="4">
<Value>fechaNacimiento</Value>
</Value>
<Value name="5">
<Value>codPostal</Value>
</Value>
</Data>
<DefaultData>crearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
