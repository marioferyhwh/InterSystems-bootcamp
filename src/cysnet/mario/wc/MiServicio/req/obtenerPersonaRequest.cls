Class cysnet.mario.wc.MiServicio.req.obtenerPersonaRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "cysnet.mario.wc.MiServicio.req.obtenerPersonaResponse";

Property idPer As %Integer;

Storage Default
{
<Data name="obtenerPersonaRequestDefaultData">
<Subscript>"obtenerPersonaRequest"</Subscript>
<Value name="1">
<Value>idPer</Value>
</Value>
</Data>
<DefaultData>obtenerPersonaRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
