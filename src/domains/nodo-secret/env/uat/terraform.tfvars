## Global
environment = "dev"
az_provider = {
  subscription_name = "DDS - Test Environment"
  subscription_id   = "c8eb3122-3ac0-4a23-a0b5-c2bae9f1cb3e"
  tenant_id         = "375b6ea7-a878-46bc-9a34-281c7b9e8d3d"
  object_id         = "2fe6d6a1-2b50-4af0-a3e5-7e084412c662"
  client_id         = "25703647-4614-436e-9281-4e2bb4f0ff28"     #init-tf-nodo-dev
  client_secret     = "Uki8Q~hpASwzHOgGL~Gkml1So~nlTiK.xgV.qaOo" #andrebbe messe a mano ogni volta, non sarebbe da caricare su github per sicurezza (figo sarebbe fare la pipeline che lancia terraform e usa una managed user)
}


## Storage account for certs
az_nodo_sa_rg         = "DDS-tf-infra-rg"
az_nodo_sa_name       = "nodocertsdev"
az_nodo_sa_share_name = "certificates"
upload_certificates = {
  "cacerts-dev" = "./env/dev/resources/dev/cacerts"
  "casogei-dev" = "./env/dev/resources/dev/CASogeiTest.pem"
  "cacerts-sit" = "./env/dev/resources/sit/cacerts"
  "casogei-sit" = "./env/dev/resources/sit/CASogeiTest.pem"
}

## KeyVault
az_nodo_kv_rg   = "KMN-VaultResources"
az_nodo_kv_name = "KMN-nodo-dev"

### Group for access to keyvault
az_nodo_kv_access_admin    = ["CloudAdmins"]
az_nodo_kv_access_readonly = ["TeamNodoPagopa"]

### SP other tf project (devops managed by svil) for access to keyvault
az_sp_for_other_tf_project_devops = "devops-tf-nodo-dev"

### SP for use keyvault with access read only
az_nodo_app_kv_ro_policy_name = "app-kv-ro-nodo-dev"

### Secrets
kv-secrets = {
  ######## AKS (Owner NEXI)
  azdo-service-endpoint-kubernetes-sa-token      = "ZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNkltWXpXWFExVFZaV1dIZFBiMGhWWm5sVmRXSm1iVlZpVFcxZmVIWlVPRkpmU1daUmRVZEVaSGQyZDFraWZRLmV5SnBjM01pT2lKcmRXSmxjbTVsZEdWekwzTmxjblpwWTJWaFkyTnZkVzUwSWl3aWEzVmlaWEp1WlhSbGN5NXBieTl6WlhKMmFXTmxZV05qYjNWdWRDOXVZVzFsYzNCaFkyVWlPaUpyZFdKbExYTjVjM1JsYlNJc0ltdDFZbVZ5Ym1WMFpYTXVhVzh2YzJWeWRtbGpaV0ZqWTI5MWJuUXZjMlZqY21WMExtNWhiV1VpT2lKaGVuVnlaUzFrWlhadmNITXRkRzlyWlc0dGNqWnFaMnNpTENKcmRXSmxjbTVsZEdWekxtbHZMM05sY25acFkyVmhZMk52ZFc1MEwzTmxjblpwWTJVdFlXTmpiM1Z1ZEM1dVlXMWxJam9pWVhwMWNtVXRaR1YyYjNCeklpd2lhM1ZpWlhKdVpYUmxjeTVwYnk5elpYSjJhV05sWVdOamIzVnVkQzl6WlhKMmFXTmxMV0ZqWTI5MWJuUXVkV2xrSWpvaU4yTXpOakZpWlRZdE5HWmtNQzAwWVRnM0xXSTNZemt0T1RVeU5qSTVOR0V4TnpreUlpd2ljM1ZpSWpvaWMzbHpkR1Z0T25ObGNuWnBZMlZoWTJOdmRXNTBPbXQxWW1VdGMzbHpkR1Z0T21GNmRYSmxMV1JsZG05d2N5SjkuYmdYMk9LdmFPelkwYUE1V2ZMV0pRNW5yX0g3ZFktYlVOVUlXVG1kcXJoTXhKOVlqdzg1S096Mi1ZUTRVZUM0ZUY5STBURFhLY25iUEdET3RJTmFTd1NRbHBHUU0xaTB2YndCNXBTQ0tYRFFsNU5jd1FUQ25FdVNmMnlTMGs2ZWM4TkNrUmRWRnRkYmRGelU2TWotLWIxTWpwWXhULVhWdWNYM25XMDJyQzFTOUNVbUxIeFV4UXlZNzNHM2ZiU3U4N0FMbmdhT0VBN1kzWGNCSkVLdTVkYURBeFA4OV95SFZRajYyYWRMd19EcU83QmdkM1ZaUW1uWm1ObVEyUkk4UE9iMTFGc2dtRGI1bGdsT2JLMUdqZVJCUkFNUUtlT2o4T3VCcXM1aURWNTZDUjVnSDJOQVhSb0VhNnhDRnRmMTgycHV0M2piZXk2R29Ec0ZWMGNGRjFrR3E1eGtxZ2Y4SFdNZzI5dTBkRVpvT2hIT1hJNUlHb1c0a1pFTVpGUTFKNXhnZ09xNzVUNUlBMDBVNnoyV3F1ZHlfVlJoRkZNeUVJRXFPVVg0c19uSkN2Y1VqRDIyaDRtUkR6ekRKcjlMUklhemVSY1UtTjZpWTluYTA3RmR4SEV5NE1kMndrMzJzQkI2ZEpEcWI2Zjh6Uko0NnJJZ0RhWks5c1ZHZ2pWX1MyWF9CMGtTMFp1YkVGN1BHbVNKRHAydnhpajg3Mkh0NHJENG8zbER1R09xWkJIbGFjRUlJcjZJRTk4cWtzcU5LUmhmY2p3ak9TX2RXQ0sxMHFLcFpVNExjcUpmZ0Z2OHpqdVNMZXdzMGVQOGl4R2RYTXNXZGgzYVBUZV9NbWg1U19BTGtzTk9NdjBDN1E4ek5UT3FxM1hldlJwZlhCOUtPOHdnbVoxNTJfN1k"
  azdo-service-endpoint-kubernetes-sa-ca-cert    = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUU2RENDQXRDZ0F3SUJBZ0lRUXRkU0tJd2xuZHFWb3FtV280NkF4akFOQmdrcWhraUc5dzBCQVFzRkFEQU4KTVFzd0NRWURWUVFERXdKallUQWdGdzB5TWpBME1Ea3hNREl5TURKYUdBOHlNRFV5TURRd09URXdNekl3TWxvdwpEVEVMTUFrR0ExVUVBeE1DWTJFd2dnSWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUNEd0F3Z2dJS0FvSUNBUUMrCjNRb0t2cVgzb2JTWCtEWVR2Z2RXWUZQUVhvV21KQ0s2YXp3a3lrNFNCcmt1aFNQRmgrdjY5cFNBRUJCWm5lZ2kKRy9HQ01QMnVVMllEM2tKN2hCRnNxRTg2eUo2K3ZPeEpkcmE5NnBxNWMrMlRtbmxEQnZHRGU4MmFOSlVWQXErQwowNDM0Mms5M3A4dTEvYTd5MVA5djh4b0pDSENxYkp6NFg0NDVQalZDSEIrVFJnYzQ5MHc4aWVGTHdHMDBCTFNjCi9peS8zTGNLWmxuWk42NlNxSk5wMW8zOW9BNjU2TlN1c3NYMTd3NWY2RVlGUnkrTXhDVVQ2MC8yYXZDUFpMcmMKUVRzTmt2YXBsc3lXOGRHT3VTQzk3dm15a25zZ01NWUVDME1jQlFldHN0dyswVWU1TFpucmlTUGxtS0d2bE84RAoyWmk2WldHL2p6Zm9OQkNJVEp4OTdEV3hyRHlUaWtOQUZKeEZET3hFQ2xHM1RaeGx2MHJUa3ZnUmVZdmg3cVdWCkNraTNPTlNlaFVjWGNWRzJCQjUwRDFkOE1HdW1WMXUyQ3VzWU14TWFrL3VoNWZPZ3NJTW9ZbEJsQmtrRE5qb1YKVFJ0cU1qbWIyaXdOeDJjMVVSSlI4aDdNbWFidDFCNWhEMVB2eHB4OHVVMWZIbk4weFROOUhsN0RMMVhwUzc1KwpqL292NUEzdHViMVhCbHVMbytPUnZ5ZElOY0NMRi9LZ1NXSEtaUG8xYkJydkJHWndCNEtLdFh1ZVZMV0t2ZDdYCm1rNlZVSFdCZUVRVTZZNGY3TUdvK0tqbmVMdlZLbjE1N0c3UGdDMERrMG5JMVNBZ2FQM0I4YmQwMkhSaFRCeDcKNk11cm90WUZFU3ZCdnBGRE5ZUDF4Wk5Qcm9pdXl2UlNzOTVtcDRsbDRRSURBUUFCbzBJd1FEQU9CZ05WSFE4QgpBZjhFQkFNQ0FxUXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QWRCZ05WSFE0RUZnUVVWY1dLbkY1U0ZzS1VUYVcxCmJxWVJWUWRkNDhVd0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dJQkFBM2VJTTc1UlQ5YXNMRUh1OURSejlUV1EvVi8KeG9Ba3JhRWZCYlFQaGxsaEVrYW1hT3RkdjZjMi9KNUVucTlNQXRQUnh1Yko2dWlBS25jUFhFSzk1anBGa1BFNApsZXhiR0RZQ0dtbU9DUVdzQ3Q0UnNLTXZxRjZjVVlPNWFxSGxIVUsvOFVvd2ZGU3czeXNCK0ZDb2p3SHRFNTBRCmxlZitRWGU5WjdocEwwOHJvSGtVMERseVZzZnhPK25CT3VPYnVMRUxBbnU0WW1YVktOeTZ3dWhrcjhLbndPVWgKdWhGSjVYdG43R2daOVIydXV2SkFjdUg2cWhmNG5SVm1EbWorQXV0STVXUkNLYURnTGQzR3VSUzNJaGN0Q2R2cQpjbzREYkVkN2NsRkV5c3dIVkhyU2JzZFZnM1lVdlNXa3BIa3BSU2RUYjg0TmpmTWl2VnhOUUpJekhNdnI0S1R3Ck1XdXFhVm9WWHRmNUgxWjVmM1JZVzZXcXFqbUtyR29naGxaNGxHZEFEM3BodEd1YVc2aE5DTTMvckR4MWVrcEYKN1l1aGI5amE3N0o5M0tFT1BCOHVaQ0RyekxLMG9TQnBHWTcyeHVZbHhRYkJhNG92QXA0WHRrVTVwdWFFWDg3Qgo4aW15TnU5Zk1nZmZiTTRmRzBZZmJnY01wYWY3Y1RJRVpVOEE4Z0pxR2JXc25STjRUYXZ3bXBDaVdRWmc1T09RCjRId2RzS3p0Y0dHenA0NlkrNlJBSTNUTTZIZGJCRStxRXJnT1pQcmxqTldNMm50cHQvamFOaFQ3L0RPeGdsY2IKRTY1eHBIOGYxb1dXMEEyTkd0ME9aelJENUVzeGhmNWgzNHVsMjAzeGV2cytYSHBnR3BSZ3c5dU1lL0xPTFo2Ygo3d1o4VEcvdkhJT2ZGa1QvCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
  azdo-service-endpoint-kubernetes-apiserver-url = "https://ddsakstest-dds-kubernetes-c8eb31-30f07491.2ebcd640-de81-4030-baf9-67994c3af49c.privatelink.westeurope.azmk8s.io:443"

  ######## Accesso a github per convenzione lo mettiamo su tutti i keyvault altrimenti è faticoso recuperarlo nel devops
  azdo-nodo-service-endpoint-github-pagopa-pat = "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"

  #### DEV Owner NEXI
  db-cfg-url-dev                    = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO4_CFG)))"
  db-cfg-url-simple-dev             = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-cfg-schema-dev                 = "NODO4_CFG_DEV"
  db-cfg-username-dev               = "NODO4_CFG_DEV"
  db-cfg-password-dev               = "NODO4_CFG_DEV"
  db-cfg-host-dev                   = "10.70.67.18"
  db-cfg-port-dev                   = "1522"
  db-cfg-service-name-dev           = "NDPSPCT_NODO4_CFG"
  db-online-url-dev                 = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_ONLINE)))"
  db-online-url-simple-dev          = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-online-schema-dev              = "NODO_ONLINE_DEV"
  db-online-username-dev            = "NODO_ONLINE_DEV"
  db-online-password-dev            = "NODO_ONLINE_DEV"
  db-online-host-dev                = "10.70.67.18"
  db-online-port-dev                = "1522"
  db-online-service-name-dev        = "NDPSPCT_NODO_ONLINE"
  db-offline-url-dev                = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_OFFLINE)))"
  db-offline-url-simple-dev         = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-offline-schema-dev             = "NODO_OFFLINE_DEV"
  db-offline-username-dev           = "NODO_OFFLINE_DEV"
  db-offline-password-dev           = "NODO_OFFLINE_DEV"
  db-offline-host-dev               = "10.70.67.18"
  db-offline-port-dev               = "1522"
  db-offline-service-name-dev       = "NDPSPCT_NODO_OFFLINE"
  db-re-url-dev                     = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPARET_RE)))"
  db-re-url-simple-dev              = "jdbc:oracle:thin:@10.70.67.18:1522:NDPARET"
  db-re-schema-dev                  = "RE_DEV"
  db-re-username-dev                = "RE_DEV"
  db-re-password-dev                = "RE_DEV"
  db-re-host-dev                    = "10.70.67.18"
  db-re-port-dev                    = "1522"
  db-re-service-name-dev            = "NDPARET_RE"
  db-wfesp-url-dev                  = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_WFESP)))"
  db-wfesp-url-simple-dev           = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-wfesp-schema-dev               = "WFESP_DEV"
  db-wfesp-username-dev             = "WFESP_DEV"
  db-wfesp-password-dev             = "WFESP_DEV"
  db-wfesp-host-dev                 = "10.70.67.18"
  db-wfesp-port-dev                 = "1522"
  db-wfesp-service-name-dev         = "NDPSPCT_WFESP"
  db-history-online-url-dev         = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_ONLINE)))"
  db-history-online-url-simple-dev  = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-history-online-schema-dev      = "NODO_HISTORY_ONLINE_DEV"
  db-history-online-username-dev    = "NODO_HISTORY_ONLINE_DEV"
  db-history-online-password-dev    = "NODO_HISTORY_ONLINE_DEV"
  db-history-offline-url-dev        = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_OFFLINE)))"
  db-history-offline-url-simple-dev = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-history-offline-schema-dev     = "NODO_HISTORY_OFFLINE_DEV"
  db-history-offline-username-dev   = "NODO_HISTORY_OFFLINE_DEV"
  db-history-offline-password-dev   = "NODO_HISTORY_OFFLINE_DEV"
  db-history-re-url-dev             = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPARET_RE)))"
  db-history-re-url-simple-dev      = "jdbc:oracle:thin:@10.70.67.18:1522:NDPARET"
  db-history-re-schema-dev          = "HISTORY_RE_DEV"
  db-history-re-username-dev        = "HISTORY_RE_DEV"
  db-history-re-password-dev        = "HISTORY_RE_DEV"
  db-history-wfesp-url-dev          = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_WFESP)))"
  db-history-wfesp-url-simple-dev   = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-history-wfesp-schema-dev       = "HISTORY_WFESP_DEV"
  db-history-wfesp-username-dev     = "HISTORY_WFESP_DEV"
  db-history-wfesp-password-dev     = "HISTORY_WFESP_DEV"
  db-admin-nodo-host-dev            = "10.70.67.18"
  db-admin-nodo-port-dev            = "1522"
  db-admin-nodo-sid-dev             = "NDPSPCT"
  db-admin-nodo-username-dev        = "devel"
  db-admin-nodo-password-dev        = "bNTpkTOXkhqq"
  db-admin-nodore-host-dev          = "10.70.67.18"
  db-admin-nodore-port-dev          = "1522"
  db-admin-nodore-sid-dev           = "NDPARET"
  db-admin-nodore-username-dev      = "devel"
  db-admin-nodore-password-dev      = "devel"

  mail-smtp-host-dev     = "10.70.66.101"
  mail-smtp-port-dev     = "1125"
  mail-smtp-username-dev = "nodo4.states.monitor@nexigroup.com"

  #### DEV Owner PAGOPA
  azure-insight-connection-string-dev           = "InstrumentationKey=d1142808-3ef5-484e-83fa-2d8b2fef0f87"
  azure-event-hub-re-connection-string-dev      = "Endpoint=sb://pagopa-d-evh-ns01.servicebus.windows.net/;SharedAccessKeyName=nodo-dei-pagamenti-SIA;SharedAccessKey=2yd25SPaGDpniGuB4jdBTsTLT7K8P5po6pm0lGfG3YI=;EntityPath=nodo-dei-pagamenti-re"
  azure-event-hub-biz-evt-connection-string-dev = "Endpoint=sb://pagopa-d-evh-ns01.servicebus.windows.net/;SharedAccessKeyName=pagopa-biz-evt-tx;SharedAccessKey=rU6qCxfy91XJb0U6gN+17wY8vgb8o2Ojb/vNZHs0tgo=;EntityPath=nodo-dei-pagamenti-biz-evt"
  notifica-rt-apikey-dev                        = "d37e512c70c74df3af5a6a8bbc69966b"
  gec-fees-subscription-key-string-dev          = "6e508a628317485ea1241e57cde7602d"

  #### SIT Owner NEXI
  db-cfg-url-sit                    = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO4_CFG)))"
  db-cfg-url-simple-sit             = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-cfg-url-simple-sit             = "jdbc:postgresql://pagopa-d-weu-nodo-flexible-postgresql.postgres.database.azure.com:6432/nodo?sslmode=require&prepareThreshold=0"
  db-cfg-schema-sit                 = "NODO4_CFG"
  db-cfg-username-sit               = "NODO4_CFG"
  db-cfg-password-sit               = "NODO4_CFG"
  db-cfg-host-sit                   = "10.70.67.18"
  db-cfg-port-sit                   = "1522"
  db-cfg-service-name-sit           = "NDPSPCT_NODO4_CFG"
  db-online-url-sit                 = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_ONLINE)))"
  db-online-url-simple-sit          = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-online-schema-sit              = "NODO_ONLINE"
  db-online-username-sit            = "NODO_ONLINE"
  db-online-password-sit            = "NODO_ONLINE"
  db-online-host-sit                = "10.70.67.18"
  db-online-port-sit                = "1522"
  db-online-service-name-sit        = "NDPSPCT_NODO_ONLINE"
  db-offline-url-sit                = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_OFFLINE)))"
  db-offline-url-simple-sit         = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-offline-schema-sit             = "NODO_OFFLINE"
  db-offline-username-sit           = "NODO_OFFLINE"
  db-offline-password-sit           = "NODO_OFFLINE"
  db-offline-host-sit               = "10.70.67.18"
  db-offline-port-sit               = "1522"
  db-offline-service-name-sit       = "NDPSPCT_NODO_OFFLINE"
  db-re-url-sit                     = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPARET_RE)))"
  db-re-url-simple-sit              = "jdbc:oracle:thin:@10.70.67.18:1522:NDPARET"
  db-re-schema-sit                  = "RE"
  db-re-username-sit                = "RE"
  db-re-password-sit                = "RE"
  db-re-host-sit                    = "10.70.67.18"
  db-re-port-sit                    = "1522"
  db-re-service-name-sit            = "NDPARET_RE"
  db-wfesp-url-sit                  = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_WFESP)))"
  db-wfesp-url-simple-sit           = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-wfesp-schema-sit               = "WFESP"
  db-wfesp-username-sit             = "WFESP"
  db-wfesp-password-sit             = "WFESP"
  db-wfesp-host-sit                 = "10.70.67.18"
  db-wfesp-port-sit                 = "1522"
  db-wfesp-service-name-sit         = "NDPSPCT_WFESP"
  db-history-online-url-sit         = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_ONLINE)))"
  db-history-online-url-simple-sit  = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-history-online-schema-sit      = "NODO_HISTORY_ONLINE"
  db-history-online-username-sit    = "NODO_HISTORY_ONLINE"
  db-history-online-password-sit    = "NODO_HISTORY_ONLINE"
  db-history-offline-url-sit        = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_NODO_OFFLINE)))"
  db-history-offline-url-simple-sit = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-history-offline-schema-sit     = "NODO_HISTORY_OFFLINE"
  db-history-offline-username-sit   = "NODO_HISTORY_OFFLINE"
  db-history-offline-password-sit   = "NODO_HISTORY_OFFLINE"
  db-history-re-url-sit             = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPARET_RE)))"
  db-history-re-url-simple-sit      = "jdbc:oracle:thin:@10.70.67.18:1522:NDPARET"
  db-history-re-schema-sit          = "HISTORY_RE"
  db-history-re-username-sit        = "HISTORY_RE"
  db-history-re-password-sit        = "HISTORY_RE"
  db-history-wfesp-url-sit          = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.70.67.18)(PORT=1522)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=NDPSPCT_WFESP)))"
  db-history-wfesp-url-simple-sit   = "jdbc:oracle:thin:@10.70.67.18:1522:NDPSPCT"
  db-history-wfesp-schema-sit       = "HISTORY_WFESP"
  db-history-wfesp-username-sit     = "HISTORY_WFESP"
  db-history-wfesp-password-sit     = "HISTORY_WFESP"
  db-admin-nodo-host-sit            = "10.70.67.18"
  db-admin-nodo-port-sit            = "1522"
  db-admin-nodo-sid-sit             = "NDPSPCT"
  db-admin-nodo-username-sit        = "devel"
  db-admin-nodo-password-sit        = "bNTpkTOXkhqq"
  db-admin-nodore-host-sit          = "10.70.67.18"
  db-admin-nodore-port-sit          = "1522"
  db-admin-nodore-sid-sit           = "NDPARET"
  db-admin-nodore-username-sit      = "devel"
  db-admin-nodore-password-sit      = "devel"

  mail-smtp-host-sit     = "10.70.66.101"
  mail-smtp-port-sit     = "1125"
  mail-smtp-username-sit = "nodo4.states.monitor@nexigroup.com"

  #### SIT Owner PAGOPA
  azure-insight-connection-string-sit           = "InstrumentationKey=d1142808-3ef5-484e-83fa-2d8b2fef0f87"
  azure-event-hub-re-connection-string-sit      = "Endpoint=sb://pagopa-d-evh-ns01.servicebus.windows.net/;SharedAccessKeyName=nodo-dei-pagamenti-SIA;SharedAccessKey=2yd25SPaGDpniGuB4jdBTsTLT7K8P5po6pm0lGfG3YI=;EntityPath=nodo-dei-pagamenti-re"
  azure-event-hub-biz-evt-connection-string-sit = "Endpoint=sb://pagopa-d-evh-ns01.servicebus.windows.net/;SharedAccessKeyName=pagopa-biz-evt-tx;SharedAccessKey=rU6qCxfy91XJb0U6gN+17wY8vgb8o2Ojb/vNZHs0tgo=;EntityPath=nodo-dei-pagamenti-biz-evt"
  notifica-rt-apikey-sit                        = "d37e512c70c74df3af5a6a8bbc69966b"
  gec-fees-subscription-key-string-sit          = "6e508a628317485ea1241e57cde7602d"
}


