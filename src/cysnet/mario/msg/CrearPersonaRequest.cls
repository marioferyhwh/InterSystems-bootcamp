Class cysnet.mario.msg.CrearPersonaRequest Extends Ens.Request
{

Property nombre As %String;

Property apellido As %String;

Property direccion As %String;

Property codPostal As %Integer;

Property fechaNacimiento As %String;

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
<Value>fechaNacimiento</Value>
</Value>
</Data>
<DefaultData>CrearPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
