Class cysnet.mario.msg.ObtenerPersonaResponse Extends Ens.Response
{

Property nombre As %String;

Property apellido As %String;

Property edad As %Integer;

Property direccion As %String;

Property codPostal As %Integer;

Property mensaje As %String(MAXLEN = 255);

Property exito As %Boolean;

Property error As %String(MAXLEN = 255);

Storage Default
{
<Data name="ObtenerPersonaResponseDefaultData">
<Subscript>"ObtenerPersonaResponse"</Subscript>
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
<Value name="7">
<Value>exito</Value>
</Value>
<Value name="8">
<Value>error</Value>
</Value>
</Data>
<DefaultData>ObtenerPersonaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
