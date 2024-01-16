Class cysnet.mario.msg.EnviarEmailResponse Extends Ens.Response
{

Property exito As %Boolean;

Property error As %String(MAXLEN = "");

Storage Default
{
<Data name="EnviarEmailResponseDefaultData">
<Subscript>"EnviarEmailResponse"</Subscript>
<Value name="1">
<Value>exito</Value>
</Value>
<Value name="2">
<Value>error</Value>
</Value>
</Data>
<DefaultData>EnviarEmailResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
