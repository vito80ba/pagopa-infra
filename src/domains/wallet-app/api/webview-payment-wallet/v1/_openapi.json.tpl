{
  "openapi": "3.0.3",
  "info": {
    "title": "pagoPA Wallet API for Webview",
    "version": "0.0.1",
    "description": "API to handle webview of wallets PagoPA, where a wallet is triple between user identifier, payment instrument and services (i.e pagoPA, bpd).",
    "termsOfService": "https://pagopa.it/terms/"
  },
  "tags": [
    {
      "name": "payment-wallet-webview",
      "description": "Api's for handle a webview wallet",
      "externalDocs": {
        "url": "https://pagopa.atlassian.net/wiki/spaces/WA/overview?homepageId=622658099",
        "description": "Documentation"
      }
    }
  ],
  "servers": [
    {
      "url": "https://${hostname}"
    }
  ],
  "paths": {
    "/wallets/{walletId}/sessions": {
      "post": {
        "tags": [
          "payment-wallet-webview"
        ],
        "summary": "Create a new session wallet",
        "description": "This endpoint returns an object containing data on how a frontend can build a html form to allow direct exchanging of payment information to the payment gateway without `wallet` having to store PCI data (or other sensitive data tied to the payment method).The returned data is tied to a session on the payment gateway identified by the field `orderId`.",
        "operationId": "createSessionWallet",
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "parameters": [
          {
            "name": "walletId",
            "in": "path",
            "description": "ID of wallet to return",
            "required": true,
            "schema": {
              "$ref": "#/components/schemas/WalletId"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Session Wallet created successfully",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/SessionWalletCreateResponse"
                }
              }
            }
          },
          "400": {
            "description": "Formally invalid input",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "404": {
            "description": "Wallet not found",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "500": {
            "description": "Internal server error serving request",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "502": {
            "description": "Gateway error",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "504": {
            "description": "Timeout serving request"
          }
        }
      }
    },
    "/wallets/{walletId}/sessions/{orderId}/validations": {
      "post": {
        "tags": [
          "payment-wallet-webview"
        ],
        "summary": "Create new validation requests given a inizialized wallet",
        "description": "This endpoint returns an object with a url to which to redirect in case of APM or a url on which to build an iframe for GDI check.",
        "operationId": "postWalletValidations",
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "parameters": [
          {
            "name": "walletId",
            "in": "path",
            "description": "ID of wallet",
            "required": true,
            "schema": {
              "$ref": "#/components/schemas/WalletId"
            }
          },
          {
            "name": "orderId",
            "in": "path",
            "description": "ID of order session",
            "required": true,
            "schema": {
              "$ref": "#/components/schemas/OrderId"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Verify requested",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/WalletVerifyRequestsResponse"
                }
              }
            }
          },
          "400": {
            "description": "Invalid input id",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "404": {
            "description": "Wallet not found",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "500": {
            "description": "Internal Server Error"
          },
          "504": {
            "description": "Timeout serving request"
          }
        }
      }
    },
    "/wallets/{walletId}/outcomes": {
      "get": {
        "tags": [
          "payment-wallet-webview"
        ],
        "summary": "Get wallet onboarding result",
        "description": "Get wallet onboarding result and walletId as query params to return ii to the app IO, for example \n/wallets/{walletId}/outcomes?outcome=0&walletId=123. The possible outcome are:\n- SUCCESS(0)\n- GENERIC_ERROR(1)\n- AUTH_ERROR(2)\n- TIMEOUT(4)\n- CANCELED_BY_USER(8)\n- INVALID_SESSION(14)",
        "operationId": "getWalletOutcomesById",
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "parameters": [
          {
            "name": "walletId",
            "in": "path",
            "description": "ID of wallet",
            "required": true,
            "schema": {
              "$ref": "#/components/schemas/WalletId"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Form fields retrieved successfully"
          },
          "400": {
            "description": "Invalid input id",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "404": {
            "description": "Wallet not found",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "500": {
            "description": "Internal Server Error"
          },
          "504": {
            "description": "Timeout serving request"
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "WalletId": {
        "description": "Wallet identifier",
        "type": "string",
        "format": "uuid"
      },
      "OrderId": {
        "description": "Order session payment gatewa identifier",
        "type": "string",
        "format": "uuid"
      },
      "WalletVerifyRequestsResponse": {
        "type": "object",
        "description": "Data to perform a wallet verify with payment gateway",
        "properties": {
          "orderId": {
            "$ref": "#/components/schemas/OrderId"
          },
          "details": {
            "description": "Redirection URL or iframe url according payment method type",
            "type": "object",
            "oneOf": [
              {
                "$ref": "#/components/schemas/WalletVerifyRequestCardDetails"
              },
              {
                "$ref": "#/components/schemas/WalletVerifyRequestAPMDetails"
              }
            ],
            "discriminator": {
              "propertyName": "type",
              "mapping": {
                "CARDS": "#/components/schemas/WalletVerifyRequestCardDetails",
                "APM": "#/components/schemas/WalletVerifyRequestAPMDetails"
              }
            }
          }
        },
        "required": [
          "details",
          "orderId"
        ]
      },
      "WalletVerifyRequestCardDetails": {
        "type": "object",
        "description": "Card verify request details",
        "properties": {
          "type": {
            "type": "string",
            "description": "Wallet  verify request details discriminator field.",
            "enum": [
              "CARDS"
            ]
          },
          "iframeUrl": {
            "type": "string",
            "description": "iframeUrl in order to run gdi check."
          }
        }
      },
      "WalletVerifyRequestAPMDetails": {
        "type": "object",
        "description": "Alternative Payment Method (APM) verify request details",
        "properties": {
          "type": {
            "type": "string",
            "description": "Wallet  verify request details discriminator field.",
            "enum": [
              "APM"
            ]
          },
          "redirectUrl": {
            "type": "string",
            "description": "redirect url in order to continue verify."
          }
        }
      },
      "SessionWalletCreateResponse": {
        "type": "object",
        "description": "Form data needed to create a credit card input form",
        "properties": {
          "orderId": {
            "type": "string"
          },
          "cardFormFields": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/Field"
            }
          }
        },
        "required": [
          "orderId",
          "cardFormFields"
        ]
      },
      "Field": {
        "type": "object",
        "properties": {
          "type": {
            "type": "string",
            "example": "text"
          },
          "class": {
            "type": "string",
            "example": "cardData"
          },
          "id": {
            "type": "string",
            "example": "cardholderName"
          },
          "src": {
            "type": "string",
            "format": "uri",
            "example": "https://<fe>/field.html?id=CARDHOLDER_NAME&sid=052211e8-54c8-4e0a-8402-e10bcb8ff264"
          }
        }
      },
      "ProblemJson": {
        "description": "Body definition for error responses containing failure details",
        "type": "object",
        "properties": {
          "type": {
            "type": "string",
            "format": "uri",
            "description": "An absolute URI that identifies the problem type. When dereferenced,\nit SHOULD provide human-readable documentation for the problem type\n(e.g., using HTML).",
            "default": "about:blank",
            "example": "https://example.com/problem/constraint-violation"
          },
          "title": {
            "type": "string",
            "description": "A short, summary of the problem type. Written in english and readable\nfor engineers (usually not suited for non technical stakeholders and\nnot localized); example: Service Unavailable"
          },
          "status": {
            "$ref": "#/components/schemas/HttpStatusCode"
          },
          "detail": {
            "type": "string",
            "description": "A human readable explanation specific to this occurrence of the\nproblem.",
            "example": "There was an error processing the request"
          },
          "instance": {
            "type": "string",
            "format": "uri",
            "description": "An absolute URI that identifies the specific occurrence of the problem.\nIt may or may not yield further information if dereferenced."
          }
        }
      },
      "HttpStatusCode": {
        "type": "integer",
        "format": "int32",
        "description": "The HTTP status code generated by the origin server for this occurrence\nof the problem.",
        "minimum": 100,
        "maximum": 600,
        "exclusiveMaximum": true,
        "example": 502
      }
    },
    "securitySchemes": {
      "bearerAuth": {
        "type": "http",
        "scheme": "bearer",
        "description": "wallet token"
      }
    }
  }
}
