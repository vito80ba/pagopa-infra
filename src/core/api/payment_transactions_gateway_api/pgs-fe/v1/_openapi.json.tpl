{
  "openapi": "3.0.1",
  "info": {
    "title": "OpenAPI definition for external payment-transactions-gateway secured by jwt token auth",
    "version": "v0"
  },
  "servers": [
    {
      "url": "${host}/payment-gateway"
    }
  ],
  "paths": {
    "/request-payments/postepay/{requestId}": {
      "get": {
        "summary": "postepay webview polling call",
        "tags": [
          "Postepay-pgs-fe"
        ],
        "operationId": "GetPostepayPaymentRequest",
        "parameters": [
          {
            "in": "path",
            "name": "requestId",
            "schema": {
              "type": "string",
              "format": "uuid"
            },
            "required": true,
            "description": "PGS-generated GUID of the request to get",
            "example": "77e1c83b-7bb0-437b-bc50-a7a58e5660ac"
          }
        ],
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/PostePayPollingResponseEntity"
                }
              }
            }
          },
          "400": {
            "description": "Bad request - missing mandatory parameters",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PostePayPollingResponseEntity"
                }
              }
            }
          },
          "401": {
            "description": "transactionId already processed",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PostePayPollingResponseEntity"
                }
              }
            }
          },
          "500": {
            "description": "Internal server error",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PostePayPollingResponseEntity"
                }
              }
            }
          },
          "504": {
            "description": "Timeout",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PostePayPollingResponseEntity"
                }
              }
            }
          }
        }
      }
    },
    "/request-payments/xpay/{requestId}": {
      "get": {
        "summary": "retrieve XPay payment request",
        "tags": [
          "XPay-pgs-fe"
        ],
        "operationId": "GetXpayPaymentRequest",
        "parameters": [
          {
            "in": "path",
            "required": true,
            "name": "requestId",
            "description": "Id of the request",
            "example": "41bc2409-5926-4aa9-afcc-797c7054e467",
            "schema": {
              "type": "string"
            }
          }
        ],
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/XPayPollingResponseEntity"
                }
              }
            }
          },
          "404": {
            "description": "Not Found",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/XPayPollingResponseEntity404"
                }
              }
            }
          }
        }
      }
    },
    "/request-payments/vpos/{requestId}": {
      "get": {
        "summary": "retrieve vpos payment request",
        "tags": [
          "Vpos-pgs-fe"
        ],
        "operationId": "GetVposPaymentRequest",
        "parameters": [
          {
            "in": "path",
            "required": true,
            "name": "requestId",
            "description": "Id of the request",
            "example": "41bc2409-5926-4aa9-afcc-797c7054e467",
            "schema": {
              "type": "string"
            }
          }
        ],
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PaymentRequestVposResponse"
                }
              }
            }
          },
          "404": {
            "description": "Not Found",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PaymentRequestVposErrorResponse"
                }
              }
            }
          },
          "500": {
            "description": "Internal server Error",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PaymentRequestVposErrorResponse"
                }
              }
            }
          }
        }
      }
    },
    "/request-payments/vpos/{requestId}/resume/method": {
      "post": {
        "summary": "resume vpos payment request",
        "tags": [
          "Vpos-pgs-fe"
        ],
        "operationId": "ResumeVposPaymentRequest",
        "parameters": [
          {
            "in": "path",
            "required": true,
            "name": "requestId",
            "description": "Id of the request",
            "example": "41bc2409-5926-4aa9-afcc-797c7054e467",
            "schema": {
              "type": "string"
            }
          }
        ],
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/VposResumeRequest"
              }
            }
          },
          "required": true
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/VposResumeResponse"
                }
              }
            }
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "PostePayPollingResponseEntity": {
        "type": "object",
        "required": [
          "channel",
          "authOutcome",
          "urlRedirect",
          "logoResourcePath",
          "error"
        ],
        "properties": {
          "channel": {
            "type": "string",
            "description": "request payment channel (APP or WEB)",
            "example": "APP"
          },
          "logoResourcePath": {
            "type": "string",
            "description": "logo",
            "example": "logoExamplePath"
          },
          "urlRedirect": {
            "type": "string",
            "description": "redirect URL generated by PGS logic",
            "example": "https://.../e2f518a9-9de4-4a27-afb0-5303e6eefcbf"
          },
          "authOutcome": {
            "type": "string",
            "description": "authorization outcome",
            "example": "OK"
          },
          "clientResponseUrl": {
            "type": "string",
            "description": "redirect URL for authorization OK, empty for KO case",
            "example": "https://..."
          },
          "error": {
            "type": "string",
            "description": "error description for 400/500 http error codes",
            "example": ""
          }
        }
      },
      "XPayPollingResponseEntity": {
        "type": "object",
        "required": [
          "status"
        ],
        "properties": {
          "html": {
            "type": "string",
            "description": "HTML received in response from XPay",
            "example": "<html>\n<head>\n<title>\nGestione Pagamento Fraud detection</title>\n<script type=\"text/javascript\" language=\"javascript\">\nfunction moveWindow() {\n    document.tdsFraudForm.submit();\n}\n</script>\n</head>\n<body>\n<form name=\"tdsFraudForm\" action=\"https://coll-ecommerce.nexi.it/ecomm/ecomm/TdsMerchantServlet\" method=\"POST\">\n<input type=\"hidden\" name=\"action\"     value=\"fraud\">\n<input type=\"hidden\" name=\"merchantId\" value=\"31320986\">\n<input type=\"hidden\" name=\"description\" value=\"7090069933_1606392234626\">\n<input type=\"hidden\" name=\"gdiUrl\"      value=\"\">\n<input type=\"hidden\" name=\"gdiNotify\"   value=\"\">\n</form>\n<script type=\"text/javascript\">\n  moveWindow();\n</script>\n</body>\n</html>\n"
          },
          "status": {
            "description": "status",
            "type": "string",
            "enum": [
              "CREATED",
              "AUTHORIZED",
              "DENIED"
            ]
          },
          "authOutcome": {
            "type": "string",
            "description": "authorization outcome received from XPay",
            "example": "OK"
          },
          "authCode": {
            "type": "string",
            "description": "authorization code received from XPay",
            "example": 123
          },
          "redirectUrl": {
            "type": "string",
            "description": "redirection URL after a response from XPay has been received",
            "example": "http://localhost:8080/payment-gateway/request-payments/xpay/2d75ebf8-c789-46a9-9a22-edf1976a8917"
          }
        }
      },
      "XPayPollingResponseEntity404": {
        "type": "object",
        "required": [
          "error"
        ],
        "properties": {
          "error": {
            "type": "object",
            "required": [
              "code",
              "message"
            ],
            "properties": {
              "code": {
                "type": "number",
                "format": "integer",
                "description": "error code",
                "example": 404
              },
              "message": {
                "type": "string",
                "description": "error message",
                "example": "RequestId not found"
              }
            }
          }
        }
      },
      "PaymentRequestVposResponse": {
        "type": "object",
        "properties": {
          "status": {
            "type": "string",
            "enum": [
              "CREATED",
              "AUTHORIZED",
              "DENIED"
            ]
          },
          "responseType": {
            "type": "string",
            "enum": [
              "METHOD",
              "CHALLENGE"
            ]
          },
          "requestId": {
            "type": "string"
          },
          "vposUrl": {
            "type": "string"
          },
          "clientReturnUrl": {
            "type": "string"
          },
          "threeDsMethodData": {
            "type": "string",
            "format": "base64"
          },
          "creq": {
            "type": "string",
            "format": "base64"
          }
        },
        "required": [
          "status",
          "requestId"
        ]
      },
      "PaymentRequestVposErrorResponse": {
        "type": "object",
        "properties": {
          "reason": {
            "type": "string",
            "example": "Error for RequestId"
          }
        }
      },
      "VposResumeRequest": {
        "type": "object",
        "required": [
          "methodCompleted"
        ],
        "properties": {
          "methodCompleted": {
            "type": "string",
            "example": "Y"
          }
        }
      },
      "VposResumeResponse": {
        "type": "object",
        "required": [
          "requestId"
        ],
        "properties": {
          "requestId": {
            "type": "string",
            "format": "uuid",
            "example": "1f3af548-f9d3-423f-b7b0-4e68948d41d2"
          }
        }
      }
    },
    "securitySchemes": {
      "bearerAuth": {
        "type": "http",
        "scheme": "bearer",
        "bearerFormat": "JWT"
      }
    }
  }
}