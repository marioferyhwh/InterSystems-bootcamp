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
<ExtentSize>4</ExtentSize>
<IdLocation>^cysnet.mario.data.PersonasD</IdLocation>
<IndexLocation>^cysnet.mario.data.PersonasI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="apellido">
<AverageFieldSize>11</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="codPostal">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="direccion">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="edad">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="nombre">
<AverageFieldSize>10</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^cysnet.mario.data.PersonasS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
