Class cysnet.mario.msg.CrearPersonaResponse Extends Ens.Response
{

Property exito As %Boolean;

Property error As %String(MAXLEN = 255);

Storage Default
{
<Data name="CrearPersonaResponseDefaultData">
<Subscript>"CrearPersonaResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>error</Value>
</Value>
</Data>
<DefaultData>CrearPersonaResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
