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
	
	Do ..SendRequestSync("miProcesoCodigo", req, .rsp)
	
	Quit rsp
}

Method crearPersona(nombre As %String, apellido As %String, direccion As %String, fechaNacimiento As %String, codPostal As %Integer) As cysnet.mario.msg.CrearPersonaResponse [ WebMethod ]
{
	#dim req As cysnet.mario.msg.CrearPersonaRequest
	#dim rsp As cysnet.mario.msg.CrearPersonaResponse
	
	set req = ##class(cysnet.mario.msg.CrearPersonaRequest).%New()
	set req.nombre = nombre
	set req.apellido = apellido
	set req.direccion = direccion
	set req.fechaNacimiento = fechaNacimiento
	set req.codPostal = codPostal
	
	do ..SendRequestSync("miProcesoCodigo", req, .rsp)
	
	quit rsp
}

}
