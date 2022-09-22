<policies>
    <inbound>
      <cors>
        <allowed-origins>
          <origin>*</origin>
        </allowed-origins>
        <allowed-methods>
          <method>GET</method>
          <method>POST</method>
          <method>OPTIONS</method>
          <method>HEAD</method>
        </allowed-methods>
      </cors>
      <set-variable name="fromDnsHost" value="@(context.Request.OriginalUrl.Host)" />
      <choose>
        <when condition="@(context.Variables.GetValueOrDefault<string>("fromDnsHost").Contains("prf.platform.pagopa.it"))">
          <set-variable name="backend-base-url" value="@($"{{pm-host-prf}}/wallet")" />
        </when>
        <otherwise>
          <set-variable name="backend-base-url" value="@($"{{pm-host}}/wallet")" />
        </otherwise>
      </choose>
      <set-backend-service base-url="@((string)context.Variables["backend-base-url"])" />
      <base />
    </inbound>
    <outbound>
      <base />
      <set-variable name="http-pm-host" value="@(Regex.Replace("{{pm-host}}", "https", "http"))" />
        <choose>
            <when condition="@(((string)context.Response.Headers.GetValueOrDefault("location","")).Contains((string)context.Variables.GetValueOrDefault("http-pm-host","")))">
                <set-variable name="locationIn" value=" @(Regex.Replace((string)context.Response.Headers.GetValueOrDefault("location",""), (string)context.Variables.GetValueOrDefault("http-pm-host",""), "${host}"))" />
                <set-header name="location" exists-action="override">
                    <value>@(context.Variables.GetValueOrDefault<string>("locationIn"))</value>
                </set-header>
            </when>
        </choose>
    </outbound>
    <backend>
      <base />
    </backend>
    <on-error>
      <base />
    </on-error>
  </policies>
