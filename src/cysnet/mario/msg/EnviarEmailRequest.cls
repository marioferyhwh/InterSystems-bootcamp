Class cysnet.mario.msg.EnviarEmailRequest Extends Ens.Request
{

Property asunto As %String(MAXLEN = "");

Property mensaje As %String(MAXLEN = "");

Property destinatario As %String(MAXLEN = "");

Storage Default
{
<Data name="EnviarEmailRequestDefaultData">
<Subscript>"EnviarEmailRequest"</Subscript>
<Value name="1">
<Value>asunto</Value>
</Value>
<Value name="2">
<Value>mensaje</Value>
</Value>
<Value name="3">
<Value>destinatario</Value>
</Value>
</Data>
<DefaultData>EnviarEmailRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
