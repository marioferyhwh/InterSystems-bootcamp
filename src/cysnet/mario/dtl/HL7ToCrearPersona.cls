Class cysnet.mario.dtl.HL7ToCrearPersona Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, cysnet.mario.msg.CrearPersonaRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='cysnet.mario.msg.CrearPersonaRequest' sourceDocType='2.5:ADT_A01' create='new' language='objectscript' >
<assign value='source.{PID:PatientName(1).FamilyName}' property='target.apellido' action='set' />
<assign value='source.{PID:PatientName(1).GivenName}' property='target.nombre' action='set' />
<assign value='source.{PID:DateTimeofBirth}' property='target.fechaNacimiento' action='set' />
<assign value='source.{PID:PatientAddress(1).StreetAddress.StreetorMailingAddress}' property='target.direccion' action='set' />
<assign value='source.{PID:PatientAddress(1).ZiporPostalCode}' property='target.codPostal' action='set' />
</transform>
}

}
