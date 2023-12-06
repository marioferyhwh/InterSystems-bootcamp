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
        }
        Do rs.Close()

        Quit $$$OK
}

XData MessageMap
{
<MapItems>
      <MapItem MessageType="cysnet.mario.msg.ObtenerPersonaRequest">
          <Method>obtenerPersona</Method>
      </MapItem>
  </MapItems>
}

}
