Class cysnet.mario.bo.MySQLOp Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.mario.msg.ObtenerPersonaRequest, Output pResponse As cysnet.mario.msg.ObtenerPersonaResponse) As %Status
{
  #dim sc As %Status = $$$OK
  /*
  Set pResponse = ##class(cysnet.mario.msg.ObtenerPersonaResponse).%New()
  Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
  Set sql = "SELECT * FROM Personas WHERE Id = ?"
  Do ..Adapter.ExecuteQuery(.rs, sql, pRequest.idPersona)
  If (rs.Next()) {
    Set pResponse.nombre = rs.Data("nombre")
    Set pResponse.apellido = rs.Data("apellidos")
    //Set pResponse.edad = rs.Data("edad")
    //Set pResponse.direccion  = rs.Data("direccion")
    //Set pResponse.codPostal = rs.Data("codPostal")
    Set pResponse.mensaje = ""
  }Else{
    Set pResponse.mensaje = "La persona con ID "_pRequest.idPersona_" no existe."
  }
  Do rs.Close()*/
  Quit sc
}

Method crearPersona(pRequest As cysnet.mario.msg.CrearPersonaRequest, Output pResponse As cysnet.mario.msg.CrearPersonaResponse) As %Status
{
  #dim sc As %Status = $$$OK
  Set pResponse = ##class(cysnet.mario.msg.CrearPersonaResponse).%New()
  Set rs = ##class(EnsLib.SQL.GatewayResultSet).%New()
  set sql = "INSERT INTO Personas (nombre, apellido) VALUES (?, ?)"
  Do ..Adapter.ExecuteUpdate(.rs, sql, pRequest.nombre, pRequest.apellido)
  Quit sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.mario.msg.ObtenerPersonaRequest">
        <Method>obtenerPersona</Method>
    </MapItem>
    <MapItem MessageType="cysnet.mario.msg.CrearPersonaRequest">
        <Method>crearPersona</Method>
    </MapItem>
</MapItems>
}

}
