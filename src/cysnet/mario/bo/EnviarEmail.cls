Class cysnet.mario.bo.EnviarEmail Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.EMail.OutboundAdapter";

Property Adapter As EnsLib.EMail.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method enviarEmail(pRequest As cysnet.mario.msg.EnviarEmailRequest, pResponse As cysnet.mario.msg.EnviarEmailResponse) As %Status
{
    #dim sc As %Status = $$$OK
    #dim msg As %Net.MailMessage
    #dim destinatarioOriginal As %String

    set pResponse = ##class(cysnet.mario.msg.EnviarEmailResponse).%New()
    set pResponse.exito = 1

    try {
        set msg = ##class(%Net.MailMessage).%New()
        set msg.Subject = pRequest.asunto
        set sc = msg.TextData.WriteLine(pRequest.mensaje)

        if ($$$ISOK(sc)) {
            set destinatarioOriginal = ..Adapter.Recipient
            if ((pRequest.destinatario '= "")&&($length(pRequest.destinatario) > 1)) {
                set ..Adapter.Recipient = pRequest.destinatario
            }
            set sc = ..Adapter.SendMail(msg)
            set ..Adapter.Recipient = destinatarioOriginal
        }
    } catch (err) {
        If (err.%ClassName(1)="common.err.exception") && ($$$ISERR(err.status)) {
            Set sc = err.status
        } Else {
            Set sc = $SYSTEM.Status.Error(err.Code,err.Name,err.Location,err.InnerException)
        }
    }

    if ($$$ISERR(sc)) {
        Set pResponse.exito = 0
        Set pResponse.error = $SYSTEM.Status.GetErrorText(sc)
    }

    quit sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="cysnet.mario.msg.EnviarEmailRequest">
        <Method>enviarEmail</Method>
    </MapItem>
</MapItems>
}

}
