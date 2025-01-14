<!--
    IMPORTANT:
    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.
    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.
    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.
    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.
    - To remove a policy, delete the corresponding policy statement from the policy document.
    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.
    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.
    - Policies are applied in the order of their appearance, from the top down.
    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.
-->
<policies>
  <inbound>
    <base/>
    <choose>
      <when condition="@(context.Request.Body != null)">
          <set-variable name="renewrequest" value="@(context.Request.Body.As<string>(preserveContent: true))" />
      </when>
    </choose>
    <!-- read decoupler configuration json -->
    <choose>
        <when condition="@(${is-nodo-auth-pwd-replace})">
            <set-variable name="password" value="{{nodoAuthPassword}}" />
            <set-variable name="soapAction" value="@((string)context.Request.Headers.GetValueOrDefault("SOAPAction"))" />
            <set-body>
              @{
              // get request body content
              XElement doc = context.Request.Body.As<XElement>(preserveContent: true);
              XElement body = doc.Descendants(doc.Name.Namespace + "Body").FirstOrDefault();
              // get primitive
              XElement primitive = (XElement) body.FirstNode;
              var soapAction = (string)context.Variables["soapAction"];
              var primitives = new string[]{"nodoInviaRPT", "nodoInviaCarrelloRPT"};
              if (primitives.Contains(soapAction)) {
              // get prev field
              XElement password = primitive.Descendants("password").FirstOrDefault();
              String passwordValue = ((string)context.Variables["password"]);
              if (password != null) {
              password.Value = passwordValue;
              } else {
              password = XElement.Parse("<password>" + passwordValue + "</password>");
              primitive.AddFirst(password);
              }
              }
              else {
              // get prev field
              XElement prevField = primitive.Descendants("idChannel").FirstOrDefault();
              if (prevField == null) {
              prevField = primitive.Descendants("identificativoCanale").FirstOrDefault();
              }
              if (prevField == null) {
              prevField = primitive.Descendants("identificativoStazioneIntermediarioPA").FirstOrDefault();
              }
              // if password exists then set default password
              // otherwise add a password field with default value
              XElement password = primitive.Descendants("password").FirstOrDefault();
              String passwordValue = ((string) context.Variables["password"]);
              if (password != null) {
              password.Value = passwordValue;
              } else {
              password = XElement.Parse("<password>" + passwordValue + "</password>");
              prevField.AddAfterSelf(password);
              }
              }

              return doc.ToString();
              }
            </set-body>
            <set-header name="X-Forwarded-For" exists-action="override">
              <value>{{xForwardedFor}}</value>
            </set-header>
        </when>
        <otherwise>
            <!-- blacklist for appgateway-snet  -->
            <ip-filter action="forbid">
              <address-range from="${address-range-from}" to="${address-range-to}"/>
            </ip-filter>
        </otherwise>
    </choose>    


    <!-- read decoupler configuration json -->
    <include-fragment fragment-id="decoupler-configuration" />
    <!-- the following is the default baseUrl -->
    <set-variable name="baseUrl" value="${base-url}" />
    <!-- used for convention in the cache key -->
    <set-variable name="domain" value="nodo" />
    <!-- used for debugging -->
    <trace source="json-configuration" severity="information">@{
      var configuration = JArray.Parse(((string) context.Variables["configuration"]));
      return configuration.FirstOrDefault()["node_id"].Value<string>();
      }</trace>
    <set-variable name="primitives" value="{{node-decoupler-primitives}}" />
    <set-variable name="soapAction" value="@(((string)context.Request.Headers.GetValueOrDefault("SOAPAction","")).Replace("\"",""))" />
    <set-variable name="primitiveType" value="@{
            string[] primitives = ((string) context.Variables["primitives"]).Split(',');

            string verifyPaymentNotice = "verifyPaymentNotice";
            string[] activatePayment = new string[] {"activatePaymentNotice", "activateIOPayment"};
            string sendPaymentOutcome = "sendPaymentOutcome";

            bool analyzeRequest = false;

            var soapAction = (string)context.Variables["soapAction"];
            if (primitives.Contains(soapAction)) {
                return "ROUTING";
            }
            else if (activatePayment.Contains(soapAction) || soapAction.Equals(verifyPaymentNotice) || soapAction.Equals(sendPaymentOutcome)) {
                return "NM3";
            }
            return "NOTSET";
        }" />
    <!-- apply algorithm logic -->
    <include-fragment fragment-id="decoupler-algorithm" />
    <trace source="base-url" severity="information">@((string)context.Variables["baseUrl"])</trace>

    <!-- set backend service url -->
    <set-backend-service base-url="@((string)context.Variables["baseUrl"])" />

  </inbound>
  <backend>
    <base/>
  </backend>
  <outbound>
    <base/>
    <include-fragment fragment-id="decoupler-activate-outbound" />
  </outbound>
  <on-error>
    <base/>
    <include-fragment fragment-id="onerror-soap-req" />
  </on-error>
</policies>
