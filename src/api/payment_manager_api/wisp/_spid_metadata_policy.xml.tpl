<policies>
    <inbound>
      <base />
        <return-response>
          <set-header name="Content-Type" exists-action="override">
              <value>application/xml</value>
          </set-header>
          <set-body template="liquid">
            <md:EntityDescriptor xmlns:md = "urn:oasis:names:tc:SAML:2.0:metadata"
              xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
              xmlns:xsi="http://www.w3.org/2001/XMLSchemainstance"
              xmlns:fpa="https://spid.gov.it/invoicing-extensions"
              entityID="http://spid.identityprovider.it"
              ID="_2ini49248n98dn984n...">
              <ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
                  [...]
              </ds:Signature>
              <md:IDPSSODescriptor
                  protocolSupportEnumeration="urn:oasis:names:tc:SAML:2.0:protocol"
                  WantAuthnRequestsSigned="true">
                  <md:KeyDescriptor use="signing">...</md:KeyDescriptor>
                  <md:SingleLogoutService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
                      Location="https://spid.identityprovider.it/Post-Post-saml2slo"
                      ResponseLocation="https://spid.identityprovider.it/Post-Post-saml2slo"/>
                  <md:SingleLogoutService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
                      Location="https://spid.identityprovider.it/redirect-Post-saml2slo"
                      ResponseLocation="https://spid.identityprovider.it/redirect-Post-saml2slo"/>
                  <md:NameIDFormat>urn:oasis:names:tc:SAML:2.0:nameid-format:transient</md:NameIDFormat>
                  <md:SingleSignOnService
                      Location="https://spid.identityprovider.it/redirect-Post-saml2sso"
                      Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"/>
                  <md:SingleSignOnService
                      Location="https://spid.identityprovider.it/Post-Post-saml2sso"
                      Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"/>
                  <saml:Attribute xsi:type="xsi:string" Name="familyName"/>
                  <saml:Attribute xsi:type="xsi:string" Name="name"/>
                  <saml:Attribute xsi:type="xsi:string" Name="spidCode"/>
                  <saml:Attribute xsi:type="xsi:string" Name="fiscalNumber"/>
                  <saml:Attribute xsi:type="xsi:string" Name="gender"/>
                  <saml:Attribute xsi:type="xsi:string" Name="dateOfBirth"/>
                  <saml:Attribute xsi:type="xsi:string" Name="placeOfBirth"/>
                  <saml:Attribute xsi:type="xsi:string" Name="companyName"/>
                  <saml:Attribute xsi:type="xsi:string" Name="registeredOffice"/>
                  <saml:Attribute xsi:type="xsi:string" Name="ivaCode"/>
                  <saml:Attribute xsi:type="xsi:string" Name="idCard"/>
                  <saml:Attribute xsi:type="xsi:string" Name="mobilePhone"/>
                  <saml:Attribute xsi:type="xsi:string" Name="email"/>
                  <saml:Attribute xsi:type="xsi:string" Name="address"/>
                  <saml:Attribute xsi:type="xsi:string" Name="digitalAddress"/>
              </md:IDPSSODescriptor>
              <md:Organization>
                  <md:OrganizationName xml:lang="it">SPID Identity Provider</md:OrganizationName>
                  <md:OrganizationDisplayName xml:lang="it">SPID Identity Provider</md:OrganizationDisplayName>
                  <md:OrganizationURL xml:lang="it">https://spid.identityprovider.it</md:OrganizationURL>
              </md:Organization>
              <md:ContactPerson contactType="billing">
                  <md:Extensions>
                      <fpa:CessionarioCommittente>
                      <fpa:DatiAnagrafici>
                      <fpa:IdFiscaleIVA>
                          <fpa:IdPaese>IT</fpa:IdPaese>
                          <fpa:IdCodice>983745349857</fpa:IdCodice>
                      </fpa:IdFiscaleIVA>
                      <fpa:Anagrafica>
                          <fpa:Denominazione>Destinatario Fatturazione</fpa:Denominazione>
                      </fpa:Anagrafica>
                      </fpa:DatiAnagrafici>
                      <fpa:Sede>
                          <fpa:Indirizzo>via tante cose</fpa:Indirizzo>
                          <fpa:NumeroCivico>12</fpa:NumeroCivico>
                          <fpa:CAP>87100</fpa:CAP>
                          <fpa:Comune>Cosenza</fpa:Comune>
                          <fpa:Provincia>CS</fpa:Provincia>
                          <fpa:Nazione>IT</fpa:Nazione>
                      </fpa:Sede>
                      </fpa:CessionarioCommittente>
                  </md:Extensions>
                  <md:Company>example s.p.a.</md:Company>
                  <md:EmailAddress>info@example.org</md:EmailAddress>
                  <md:TelephoneNumber>+39 84756344785</md:TelephoneNumber>
              </md:ContactPerson>
            </md:EntityDescriptor>
					</set-body>
        </return-response>
    </inbound>
    <outbound>
      <base />
    </outbound>
    <backend>
      <base />
    </backend>
    <on-error>
      <base />
    </on-error>
  </policies>
