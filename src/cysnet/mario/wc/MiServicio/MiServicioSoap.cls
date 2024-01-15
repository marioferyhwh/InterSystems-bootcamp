Class cysnet.mario.wc.MiServicio.MiServicioSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://localhost:52773/csp/mario/cysnet.mario.ws.MiServicio.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://tempuri.org";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "MiServicio";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method crearPersona(nombre As %String, apellido As %String, direccion As %String, fechaNacimiento As %String, codPostal As %Integer) As cysnet.mario.wc.MiServicio.s0.CrearPersonaResponse1 [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("crearPersona").Invoke($this,"http://tempuri.org/cysnet.mario.ws.MiServicio.crearPersona",.nombre,.apellido,.direccion,.fechaNacimiento,.codPostal)
}

Method obtenerPersona(idPer As %Integer) As cysnet.mario.wc.MiServicio.s0.ObtenerPersonaResponse1 [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("obtenerPersona").Invoke($this,"http://tempuri.org/cysnet.mario.ws.MiServicio.obtenerPersona",.idPer)
}

Method saludo() As %String [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("saludo").Invoke($this,"http://tempuri.org/cysnet.mario.ws.MiServicio.saludo")
}

}
