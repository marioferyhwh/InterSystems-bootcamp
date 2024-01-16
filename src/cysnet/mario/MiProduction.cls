Class cysnet.mario.MiProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="cysnet.mario.MiProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="MISERVICIO" Category="" ClassName="cysnet.mario.ws.MiServicio" PoolSize="1" Enabled="true" Foreground="false" Comment="servicio soap de entrada" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="DBCache" Category="" ClassName="cysnet.mario.bo.DBCache" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="miProceso" Category="" ClassName="cysnet.mario.bp.MiProceso" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InFileHL7" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/shared/HL7/in/</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/shared/HL7/out/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7RoutingProcess</Setting>
    <Setting Target="Adapter" Name="WorkPath">/shared/HL7/proc/</Setting>
    <Setting Target="Host" Name="DefCharEncoding">utf-8</Setting>
  </Item>
  <Item Name="HL7RoutingProcess" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">cysnet.mario.rules.HL7RoutingRule</Setting>
    <Setting Target="Host" Name="ResponseFrom">MiServicioWs</Setting>
  </Item>
  <Item Name="MiServicioWs" Category="" ClassName="cysnet.mario.wc.MiServicio.bo.MiServicioSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">http://localhost:1980/csp/mario/cysnet.mario.ws.MiServicio.cls</Setting>
  </Item>
  <Item Name="miProcesoCodigo" Category="" ClassName="cysnet.mario.bp.MiProcesoCodigo" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="IncludeDetails">1</Setting>
    <Setting Target="Adapter" Name="Credentials">CuentaGmail</Setting>
    <Setting Target="Adapter" Name="From">mrobayo@cidenet.com.co</Setting>
    <Setting Target="Adapter" Name="Recipient">mrobayo@cidenet.com.co</Setting>
    <Setting Target="Adapter" Name="SMTPPort">587</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ISC.FeatureTracker.SSL.Config</Setting>
  </Item>
  <Item Name="EnviarEmail" Category="" ClassName="cysnet.mario.bo.EnviarEmail" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">CuentaGmail</Setting>
    <Setting Target="Adapter" Name="From">mrobayo@cidenet.com.co</Setting>
    <Setting Target="Adapter" Name="Recipient">mrobayo@cidenet.com.co</Setting>
    <Setting Target="Adapter" Name="SMTPPort">587</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">ISC.FeatureTracker.SSL.Config</Setting>
  </Item>
</Production>
}

}
