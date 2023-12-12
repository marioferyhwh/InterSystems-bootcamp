Class cysnet.mario.bo.DBCache Extends Ens.BusinessOperation
{

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.mario.msg.ObtenerPersonaRequest, Output pResponse As cysnet.mario.msg.ObtenerPersonaResponse) As %Status
{
        Set pResponse = ##class(cysnet.mario.msg.ObtenerPersonaResponse).%New()

        Set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")

        Do rs.Prepare("SELECT * FROM cysnet_mario_data.Personas WHERE ID = "_pRequest.idPersona)
        Do rs.Execute()
        If (rs.Next()) {
            Set pResponse.nombre = rs.Data("nombre")
            Set pResponse.apellido = rs.Data("apellido")
            Set pResponse.edad = rs.Data("edad")
            Set pResponse.direccion  = rs.Data("direccion")
            Set pResponse.codPostal = rs.Data("codPostal")
            Set pResponse.mensaje = ""
        }Else{
            Set pResponse.mensaje = "La persona con ID "_pRequest.idPersona_" no existe."
        }
        Do rs.Close()

        Quit $$$OK
}

Method crearPersona(pRequest As cysnet.mario.msg.CrearPersonaRequest, Output pResponse As cysnet.mario.msg.CrearPersonaResponse) As %Status
{
        Set pResponse = ##class(cysnet.mario.msg.CrearPersonaResponse).%New()
        
        Set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")
        Do rs.Prepare("SELECT * FROM cysnet_mario_data.Personas WHERE nombre = ? and apellido = ?")
        Do rs.Execute(pRequest.nombre, pRequest.apellido)
        If (rs.Next()) {
          Do rs.Close()
          Quit $$$OK
        }
        Do rs.Close()
        

        Set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")
        Do rs.Prepare("INSERT INTO cysnet_mario_data.Personas (nombre, apellido) VALUES (?, ?)")
        Do rs.Execute(pRequest.nombre, pRequest.apellido)
        Do rs.Close()

        Quit $$$OK
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
