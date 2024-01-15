Class cysnet.mario.wc.MiServicio.bo.MiServicioSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Method crearPersona(pRequest As cysnet.mario.wc.MiServicio.req.crearPersonaRequest, Output pResponse As cysnet.mario.wc.MiServicio.req.crearPersonaResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.mario.wc.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("crearPersona",.crearPersonaResult,pRequest.nombre,pRequest.apellido,pRequest.direccion,pRequest.fechaNacimiento,pRequest.codPostal)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.crearPersonaResult=$get(crearPersonaResult)
 Quit $$$OK
}

Method obtenerPersona(pRequest As cysnet.mario.wc.MiServicio.req.obtenerPersonaRequest, Output pResponse As cysnet.mario.wc.MiServicio.req.obtenerPersonaResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.mario.wc.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("obtenerPersona",.obtenerPersonaResult,pRequest.idPer)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.obtenerPersonaResult=$get(obtenerPersonaResult)
 Quit $$$OK
}

Method saludo(pRequest As cysnet.mario.wc.MiServicio.req.saludoRequest, Output pResponse As cysnet.mario.wc.MiServicio.req.saludoResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "cysnet.mario.wc.MiServicio.MiServicioSoap"
 Set tSC = ..Adapter.InvokeMethod("saludo",.saludoResult)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.saludoResult=$get(saludoResult)
 Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="cysnet.mario.wc.MiServicio.req.crearPersonaRequest">
		<Method>crearPersona</Method>
	</MapItem>
	<MapItem MessageType="cysnet.mario.wc.MiServicio.req.obtenerPersonaRequest">
		<Method>obtenerPersona</Method>
	</MapItem>
	<MapItem MessageType="cysnet.mario.wc.MiServicio.req.saludoRequest">
		<Method>saludo</Method>
	</MapItem>
</MapItems>
}

}
