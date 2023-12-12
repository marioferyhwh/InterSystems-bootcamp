Class cysnet.mario.msg.CrearPersonaRequest Extends Ens.Request
{

Property nombre As %String;

Property apellido As %String;

Storage Default
{
<Data name="CrearPersonaRequestDefaultData">
<Subscript>"CrearPersonaRequest"</Subscript>
<Value name="1">
<Value>nombre</Value>
</Value>
<Value name="2">
<Value>apellido</Value>
</Value>
</Data>
<DefaultData>CrearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
