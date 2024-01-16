Class cysnet.mario.bp.MiProcesoCodigo Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
  If (pRequest.%ClassName() = "CrearPersonaRequest") {
    Set pResponse = ##class(cysnet.mario.msg.CrearPersonaResponse).%New()
    do ..SendRequestSync("DBCache", pRequest, .pResponse)
  } ElseIf (pRequest.%ClassName() = "ObtenerPersonaRequest") {
    Set pResponse = ##class(cysnet.mario.msg.ObtenerPersonaResponse).%New()
    If (pRequest.idPersona > 0) {
      Do ..SendRequestSync("DBCache", pRequest, .pResponse)
    }Else{
      Set pResponse.mensaje = " id menor a 0"
    }
  }
  Quit $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
