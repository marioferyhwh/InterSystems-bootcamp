Class cysnet.mario.data.Personas Extends %Persistent
{

Property nombre As %String;

Property apellido As %String;

Property edad As %Integer;

Property direccion As %String;

Property codPostal As %Integer;

Storage Default
{
<Data name="PersonasDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>apellido</Value>
</Value>
<Value name="4">
<Value>edad</Value>
</Value>
<Value name="5">
<Value>direccion</Value>
</Value>
<Value name="6">
<Value>codPostal</Value>
</Value>
</Data>
<DataLocation>^cysnet.mario.data.PersonasD</DataLocation>
<DefaultData>PersonasDefaultData</DefaultData>
<IdLocation>^cysnet.mario.data.PersonasD</IdLocation>
<IndexLocation>^cysnet.mario.data.PersonasI</IndexLocation>
<StreamLocation>^cysnet.mario.data.PersonasS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
