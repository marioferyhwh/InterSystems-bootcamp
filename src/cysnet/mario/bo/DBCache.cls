Class cysnet.mario.bo.DBCache Extends Ens.BusinessOperation
{

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.mario.msg.ObtenerPersonaRequest, Output pResponse As cysnet.mario.msg.ObtenerPersonaResponse) As %Status
{
  
  #dim sc As %Status = $$$OK
  #dim rs As %ResultSet

  Set pResponse = ##class(cysnet.mario.msg.ObtenerPersonaResponse).%New()

  Set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")
  Set sc = rs.Prepare("SELECT * FROM cysnet_mario_data.Personas WHERE ID = "_pRequest.idPersona)
  Do rs.Execute()
  If ($$$ISOK(sc)) {
    Set sc = rs.Execute()
  }
  If ($$$ISOK(sc)) {
  If (rs.Next(.sc)) {
      Quit:$$$ISERR(sc)
      Set pResponse.nombre = rs.Data("nombre")
      Set pResponse.apellido = rs.Data("apellido")
      Set pResponse.edad = rs.Data("edad")
      Set pResponse.direccion  = rs.Data("direccion")
      Set pResponse.codPostal = rs.Data("codPostal")
      Set pResponse.mensaje = ""
  }Else{
      Set pResponse.mensaje = "La persona con ID "_pRequest.idPersona_" no existe."
  }
  }
  
  If ($$$ISOK(sc)) {
  Set sc = rs.Close()
  }

  Quit sc
}

Method crearPersona(pRequest As cysnet.mario.msg.CrearPersonaRequest, Output pResponse As cysnet.mario.msg.CrearPersonaResponse) As %Status
{
  #dim sc As %Status = $$$OK
  #dim rs As %ResultSet

  Set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")
  Set sc =  rs.Prepare("SELECT * FROM cysnet_mario_data.Personas WHERE nombre = ? and apellido = ?")
  If ($$$ISOK(sc)) {
    Set sc =  rs.Execute(pRequest.nombre, pRequest.apellido)
  }
  
  If (rs.Next(.sc)) {

    If ($$$ISOK(sc)) {
    Set sc =  rs.Close()
    }
    Quit sc
  }
  If ($$$ISOK(sc)) {
  Set sc =  rs.Close()
  }

  
  Set anio = $EXTRACT(pRequest.fechaNacimiento, 1, 4)
  Set mes = $EXTRACT(pRequest.fechaNacimiento, 5, 6)
  Set dia = $EXTRACT(pRequest.fechaNacimiento, 7, 8)
  Set hora = $EXTRACT(pRequest.fechaNacimiento, 9, 10)
  Set minuto = $EXTRACT(pRequest.fechaNacimiento, 11, 12)
  Set segundo = $EXTRACT(pRequest.fechaNacimiento, 13, 14)
  
  Set fechaConFormato = mes_"/"_dia_"/"_anio_" "_hora_":"_minuto_":"_segundo
  
  Set fechaNacimiento=$PIECE(($ZDATEH(fechaConFormato)),",",1)
  Set fechaActual=$PIECE(($HOROLOG),",",1)
  Set edadEnAnios=((fechaActual - fechaNacimiento)/365.25)

  Set edad=$PIECE(edadEnAnios,".",1)
  
  
  Set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")
  Set sc =   rs.Prepare("INSERT INTO cysnet_mario_data.Personas (nombre, apellido, direccion, codPostal, edad) VALUES (?, ?, ?, ?, ?)")
  
  If ($$$ISOK(sc)) {
  Set sc =   rs.Execute(pRequest.nombre, pRequest.apellido, pRequest.direccion, pRequest.codPostal,edad)
  }
  If ($$$ISOK(sc)) {
  Set sc =  rs.Close()
  }


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
