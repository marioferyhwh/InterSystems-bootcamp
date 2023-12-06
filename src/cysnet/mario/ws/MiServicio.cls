Class cysnet.mario.ws.MiServicio Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// Nombre de servicio web.
Parameter SERVICENAME = "MiServicio";

/// Namespace SOAP para servicio web
Parameter NAMESPACE = "http://tempuri.org";

/// Se utilizarán namespaces de clases referenciadas en WSDL.
Parameter USECLASSNAMESPACES = 1;

Method saludo() As %String [ WebMethod ]
{
	Quit "Hola mario!"
}

Method obtenerPersona(idPer As %Integer) As cysnet.mario.msg.ObtenerPersonaResponse [ WebMethod ]
{
	#dim req As cysnet.mario.msg.ObtenerPersonaRequest
	#dim rsp As cysnet.mario.msg.ObtenerPersonaResponse
	
	Set req = ##class(cysnet.mario.msg.ObtenerPersonaRequest).%New()
	Set req.idPersona = idPer
	
	Do ..SendRequestSync("miProceso", req, .rsp)
	
	Quit rsp
}

}
