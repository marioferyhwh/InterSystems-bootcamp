Class cysnet.mario.bo.DBCache Extends Ens.BusinessOperation
{

/// Método que obtiene los datos de una persona a partir de su ID
Method obtenerPersona(pRequest As cysnet.mario.msg.ObtenerPersonaRequest, Output pResponse As cysnet.mario.msg.ObtenerPersonaResponse) As %Status
{
  
  #dim sc As %Status = $$$OK

  Set pResponse = ##class(cysnet.mario.msg.ObtenerPersonaResponse).%New()
  Set stm = ##class(%SQL.Statement).%New()
  Do stm.%Prepare("SELECT * FROM cysnet_mario_data.Personas WHERE ID = ?")
  Set rs = stm.%Execute(pRequest.idPersona)

    If (rs.%Next(.sc)) {
      Quit:$$$ISERR(sc)
      Set pResponse.nombre = rs.nombre
      Set pResponse.apellido = rs.apellido
      Set pResponse.edad = rs.edad
      Set pResponse.direccion  = rs.direccion
      Set pResponse.codPostal = rs.codPostal
      Set pResponse.mensaje = ""
    }Else{
      Set pResponse.mensaje = "La persona con ID "_pRequest.idPersona_" no existe."
  }
    
  Quit sc
}

Method crearPersona(pRequest As cysnet.mario.msg.CrearPersonaRequest, Output pResponse As cysnet.mario.msg.CrearPersonaResponse) As %Status
{
    #dim sc As %Status = $$$OK

    Set stm = ##class(%SQL.Statement).%New()
    Do stm.%Prepare("SELECT * FROM cysnet_mario_data.Personas WHERE nombre = ? and apellido = ?")
    Set rs =  stm.%Execute(pRequest.nombre, pRequest.apellido)
    
    If (rs.%Next(.sc)) {
      Quit sc
    }
    If (pRequest.fechaNacimiento){

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
    }Else{
      Set edad = "0"
    }
    
    Set stm = ##class(%SQL.Statement).%New()
    //&sql(INSERT INTO cysnet_mario_data.Persona (nombre, apellido, direccion, codPostal, edad) VALUES (:pRequest.nombre, :pRequest.apellidos, :pRequest.direccion, :pRequest.codPostal, :edad))
    
    Do stm.%Prepare("INSERT INTO cysnet_mario_data.Personas (nombre, apellido, direccion, codPostal, edad) VALUES (?, ?, ?, ?, ?)")
    
    Set rs = stm.%Execute(pRequest.nombre, pRequest.apellido, pRequest.direccion, pRequest.codPostal ,edad)

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
