{
  "openapi": "3.0.3",
  "info": {
    "title": "pagoPA Payment Wallet API",
    "version": "0.0.1",
    "description": "API to handle payment wallets PagoPA for App IO, where a wallet is triple between user identifier, payment instrument and services (i.e pagoPA, bpd).\n\nThe wallet onboarding outcome and walletId are returned as query params to the app IO, for example \n/wallets/{walletId}/outcomes?outcome=0&walletId=123. The possible outcome are:\n- SUCCESS(0)\n- GENERIC_ERROR(1)\n- AUTH_ERROR(2)\n- TIMEOUT(4)\n- CANCELED_BY_USER(8)\n- INVALID_SESSION(14)",
    "termsOfService": "https://pagopa.it/terms/"
  },
  "tags": [
    {
      "name": "paymentMethods",
      "description": "Api's to retrive payment methods",
      "externalDocs": {
        "url": "https://pagopa.atlassian.net/wiki/spaces/WA/overview?homepageId=622658099",
        "description": "Documentation"
      }
    },
    {
      "name": "wallets",
      "description": "Api's to handle a wallet",
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
    "/payment-methods": {
      "get": {
        "tags": [
          "paymentMethods"
        ],
        "operationId": "getAllPaymentMethods",
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "summary": "Retrieve all Payment Methods",
        "parameters": [
          {
            "name": "amount",
            "in": "query",
            "description": "Payment Amount expressed in eurocents",
            "required": false,
            "schema": {
              "type": "number"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Payment method successfully retrieved",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/PaymentMethodsResponse"
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
            "description": "Payment methods not found",
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
    "/wallets": {
      "post": {
        "tags": [
          "wallets"
        ],
        "summary": "Create a new wallet",
        "description": "Creates a new wallet",
        "operationId": "createWallet",
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "requestBody": {
          "description": "Create a new wallet",
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/WalletCreateRequest"
              }
            }
          },
          "required": true
        },
        "responses": {
          "201": {
            "description": "Wallet created successfully",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/WalletCreateResponse"
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
      },
      "get": {
        "tags": [
          "wallets"
        ],
        "summary": "Get wallet by user identifier",
        "description": "Returns a of wallets related to user",
        "operationId": "getWalletsByIdUser",
        "security": [
          {
            "bearerAuth": []
          }
        ],
        "responses": {
          "200": {
            "description": "Wallet retrieved successfully",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/Wallets"
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
            "description": "Wallet not found"
          },
          "504": {
            "description": "Timeout serving request"
          }
        }
      }
    },
    "/wallets/{walletId}": {
      "get": {
        "tags": [
          "wallets"
        ],
        "summary": "Get wallet by id",
        "description": "Returns a single wallet",
        "operationId": "getWalletById",
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
            "description": "Wallet retrieved successfully",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/WalletInfo"
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
            "description": "Wallet not found"
          },
          "504": {
            "description": "Timeout serving request"
          }
        }
      },
      "delete": {
        "tags": [
          "wallets"
        ],
        "summary": "Delete wallet by id",
        "description": "Returns a single wallet",
        "operationId": "deleteWalletById",
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
          "204": {
            "description": "Wallet deleted successfully"
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
            "description": "Wallet not found"
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
      "ServiceName": {
        "type": "string",
        "description": "Enumeration of services",
        "enum": [
          "PAGOPA"
        ]
      },
      "Service": {
        "type": "object",
        "properties": {
          "name": {
            "$ref": "#/components/schemas/ServiceName"
          },
          "status": {
            "$ref": "#/components/schemas/ServiceStatus"
          },
          "updateDate": {
            "description": "Service last update date",
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "ServiceStatus": {
        "type": "string",
        "description": "Enumeration of wallet statuses",
        "enum": [
          "ENABLED",
          "DISABLED",
          "INCOMING"
        ]
      },
      "WalletStatus": {
        "type": "string",
        "description": "Enumeration of wallet statuses",
        "enum": [
          "INITIALIZED",
          "CREATED",
          "DELETED",
          "ERROR"
        ]
      },
      "WalletCreateRequest": {
        "type": "object",
        "description": "Wallet creation request",
        "properties": {
          "services": {
            "type": "array",
            "description": "List of services for which wallet is enabled",
            "items": {
              "$ref": "#/components/schemas/ServiceName"
            }
          },
          "useDiagnosticTracing": {
            "type": "boolean"
          },
          "paymentMethodId": {
            "type": "string",
            "format": "uuid"
          }
        },
        "required": [
          "paymentMethodId",
          "services",
          "useDiagnosticTracing"
        ]
      },
      "WalletCreateResponse": {
        "type": "object",
        "description": "Wallet creation response",
        "properties": {
          "redirectUrl": {
            "type": "string",
            "format": "url",
            "description": "Redirection URL to a payment gateway page where the user can input a payment instrument information",
            "example": "http://localhost/inputPage"
          }
        },
        "required": [
          "walletId",
          "redirectUrl"
        ]
      },
      "WalletInfo": {
        "type": "object",
        "description": "Wallet information",
        "properties": {
          "walletId": {
            "$ref": "#/components/schemas/WalletId"
          },
          "paymentMethodId": {
            "description": "Payment method identifier",
            "type": "string"
          },
          "status": {
            "$ref": "#/components/schemas/WalletStatus"
          },
          "creationDate": {
            "description": "Wallet creation date",
            "type": "string",
            "format": "date-time"
          },
          "updateDate": {
            "description": "Wallet update date",
            "type": "string",
            "format": "date-time"
          },
          "services": {
            "description": "list of services for which this wallet is created for",
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/Service"
            }
          },
          "details": {
            "$ref": "#/components/schemas/WalletInfoDetails"
          }
        },
        "required": [
          "walletId",
          "paymentMethodId",
          "status",
          "creationDate",
          "updateDate",
          "services"
        ]
      },
      "WalletInfoDetails": {
        "description": "details for the specific payment instrument. This field is disciminated by the type field",
        "oneOf": [
          {
            "type": "object",
            "description": "Card payment instrument details",
            "properties": {
              "type": {
                "type": "string",
                "description": "Wallet details discriminator field.",
                "enum": [
                  "CARDS"
                ]
              },
              "maskedPan": {
                "description": "Card masked pan (first 6 digit and last 4 digit clear, other digit obfuscated)",
                "type": "string",
                "example": "123456******9876"
              },
              "expiryDate": {
                "type": "string",
                "description": "Credit card expiry date. The date format is `YYYYMM`",
                "pattern": "^\\d{6}$",
                "example": "203012"
              },
              "holder": {
                "description": "Holder of the card payment instrument",
                "type": "string"
              },
              "brand": {
                "description": "Payment instrument brand",
                "type": "string",
                "enum": [
                  "MASTERCARD",
                  "VISA"
                ]
              }
            },
            "required": [
              "type",
              "maskedPan",
              "expiryDate",
              "holder",
              "brand"
            ]
          },
          {
            "type": "object",
            "description": "Paypal instrument details",
            "properties": {
              "type": {
                "type": "string",
                "description": "Wallet details discriminator field.",
                "enum": [
                  "PAYPAL"
                ]
              },
              "abi": {
                "description": "bank idetifier",
                "type": "string",
                "minLength": 1,
                "maxLength": 5,
                "example": "12345"
              },
              "maskedEmail": {
                "description": "email masked pan",
                "type": "string",
                "example": "test***@***test.it"
              }
            },
            "required": [
              "type",
              "abi",
              "maskedEmail"
            ]
          }
        ]
      },
      "Wallets": {
        "type": "object",
        "description": "Wallets information",
        "properties": {
          "wallets": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/WalletInfo"
            }
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
      },
      "PaymentMethodsResponse": {
        "type": "object",
        "description": "Payment methods response",
        "properties": {
          "paymentMethods": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/PaymentMethodResponse"
            }
          }
        }
      },
      "PaymentMethodResponse": {
        "type": "object",
        "description": "Payment method Response",
        "properties": {
          "id": {
            "type": "string",
            "description": "Payment method ID"
          },
          "name": {
            "type": "string",
            "description": "Payment method name"
          },
          "description": {
            "type": "string",
            "description": "Payment method description"
          },
          "asset": {
            "type": "string",
            "description": "Payment method asset name"
          },
          "status": {
            "$ref": "#/components/schemas/PaymentMethodStatus"
          },
          "paymentTypeCode": {
            "type": "string",
            "description": "Payment method type code"
          },
          "ranges": {
            "description": "Payment amount range in eurocents",
            "type": "array",
            "minItems": 1,
            "items": {
              "$ref": "#/components/schemas/Range"
            }
          }
        },
        "required": [
          "id",
          "name",
          "description",
          "status",
          "paymentTypeCode",
          "ranges"
        ]
      },
      "PaymentMethodStatus": {
        "type": "string",
        "description": "Payment method status",
        "enum": [
          "ENABLED",
          "DISABLED",
          "INCOMING"
        ]
      },
      "Range": {
        "type": "object",
        "description": "Payment amount range in cents",
        "properties": {
          "min": {
            "type": "integer",
            "format": "int64",
            "minimum": 0,
            "description": "Range min amount"
          },
          "max": {
            "type": "integer",
            "format": "int64",
            "minimum": 0
          }
        }
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