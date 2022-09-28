{
  "openapi": "3.0.1",
  "info": {
    "title": "PagoPA API Calculator Logic for Node",
    "description": "Calculator Logic microservice for pagoPA AFM",
    "termsOfService": "https://www.pagopa.gov.it/",
    "version": "0.0.4-3"
  },
  "servers": [
    {
      "url": "${host}",
      "description": "Generated server url"
    }
  ],
  "tags": [
    {
      "name": "Calculator",
      "description": "Everything about Calculator business logic"
    }
  ],
  "paths": {
    "/fees": {
      "post": {
        "tags": [
          "Calculator"
        ],
        "summary": "Get taxpayer fees of all or specified idPSP",
        "operationId": "getFees",
        "parameters": [
          {
            "name": "maxOccurrences",
            "in": "query",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 10
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/PaymentOption"
              }
            }
          },
          "required": true
        },
        "responses": {
          "200": {
            "description": "Ok",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "$ref": "#/components/schemas/Transfer"
                  }
                }
              }
            }
          },
          "400": {
            "description": "Bad Request",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401": {
            "description": "Unauthorized",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "429": {
            "description": "Too many requests",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "500": {
            "description": "Service unavailable",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security": [
          {
            "ApiKey": []
          }
        ]
      },
      "parameters": [
        {
          "name": "X-Request-Id",
          "in": "header",
          "description": "This header identifies the call, if not passed it is self-generated. This ID is returned in the response.",
          "schema": {
            "type": "string"
          }
        }
      ]
    },
    "/info": {
      "get": {
        "tags": [
          "Home"
        ],
        "summary": "health check",
        "description": "Return OK if application is started",
        "operationId": "healthCheck",
        "responses": {
          "200": {
            "description": "OK",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/AppInfo"
                }
              }
            }
          },
          "400": {
            "description": "Bad Request",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401": {
            "description": "Unauthorized",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "403": {
            "description": "Forbidden",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "429": {
            "description": "Too many requests",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "500": {
            "description": "Service unavailable",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security": [
          {
            "ApiKey": []
          }
        ]
      },
      "parameters": [
        {
          "name": "X-Request-Id",
          "in": "header",
          "description": "This header identifies the call, if not passed it is self-generated. This ID is returned in the response.",
          "schema": {
            "type": "string"
          }
        }
      ]
    },
    "/psps/{idPsp}/fees": {
      "post": {
        "tags": [
          "Calculator"
        ],
        "summary": "Get taxpayer fees of the specified idPSP",
        "operationId": "getFeesByPsp",
        "parameters": [
          {
            "name": "idPsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "maxOccurrences",
            "in": "query",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 10
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/PaymentOptionByPsp"
              }
            }
          },
          "required": true
        },
        "responses": {
          "200": {
            "description": "Ok",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "$ref": "#/components/schemas/Transfer"
                  }
                }
              }
            }
          },
          "400": {
            "description": "Bad Request",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401": {
            "description": "Unauthorized",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "429": {
            "description": "Too many requests",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "500": {
            "description": "Service unavailable",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            },
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security": [
          {
            "ApiKey": []
          }
        ]
      },
      "parameters": [
        {
          "name": "X-Request-Id",
          "in": "header",
          "description": "This header identifies the call, if not passed it is self-generated. This ID is returned in the response.",
          "schema": {
            "type": "string"
          }
        }
      ]
    }
  },
  "components": {
    "schemas": {
      "PaymentOptionByPsp": {
        "type": "object",
        "properties": {
          "paymentAmount": {
            "type": "integer",
            "format": "int64"
          },
          "primaryCreditorInstitution": {
            "type": "string"
          },
          "paymentMethod": {
            "type": "string",
            "enum": [
              "ANY",
              "PPAL",
              "BPAY",
              "PAYBP",
              "BBT",
              "AD",
              "CP",
              "PO",
              "JIF",
              "MYBK"
            ]
          },
          "touchpoint": {
            "type": "string",
            "enum": [
              "ANY",
              "IO",
              "WISP",
              "CHECKOUT",
              "PSP"
            ]
          },
          "transferList": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TransferListItem"
            }
          }
        }
      },
      "TransferListItem": {
        "type": "object",
        "properties": {
          "creditorInstitution": {
            "type": "string"
          },
          "transferCategory": {
            "type": "string"
          }
        }
      },
      "Transfer": {
        "type": "object",
        "properties": {
          "taxPayerFee": {
            "type": "integer",
            "format": "int64"
          },
          "primaryCiIncurredFee": {
            "type": "integer",
            "format": "int64"
          },
          "paymentMethod": {
            "type": "string",
            "enum": [
              "ANY",
              "PPAL",
              "BPAY",
              "PAYBP",
              "BBT",
              "AD",
              "CP",
              "PO",
              "JIF",
              "MYBK"
            ]
          },
          "touchpoint": {
            "type": "string",
            "enum": [
              "ANY",
              "IO",
              "WISP",
              "CHECKOUT",
              "PSP"
            ]
          },
          "idBundle": {
            "type": "string"
          },
          "bundleName": {
            "type": "string"
          },
          "bundleDescription": {
            "type": "string"
          },
          "idCiBundle": {
            "type": "string"
          },
          "idPsp": {
            "type": "string"
          }
        }
      },
      "ProblemJson": {
        "type": "object",
        "properties": {
          "title": {
            "type": "string",
            "description": "A short, summary of the problem type. Written in english and readable for engineers (usually not suited for non technical stakeholders and not localized); example: Service Unavailable"
          },
          "status": {
            "maximum": 600,
            "minimum": 100,
            "type": "integer",
            "description": "The HTTP status code generated by the origin server for this occurrence of the problem.",
            "format": "int32",
            "example": 200
          },
          "detail": {
            "type": "string",
            "description": "A human readable explanation specific to this occurrence of the problem.",
            "example": "There was an error processing the request"
          }
        }
      },
      "PaymentOption": {
        "type": "object",
        "properties": {
          "paymentAmount": {
            "type": "integer",
            "format": "int64"
          },
          "primaryCreditorInstitution": {
            "type": "string"
          },
          "paymentMethod": {
            "type": "string",
            "enum": [
              "ANY",
              "PPAL",
              "BPAY",
              "PAYBP",
              "BBT",
              "AD",
              "CP",
              "PO",
              "JIF",
              "MYBK"
            ]
          },
          "touchpoint": {
            "type": "string",
            "enum": [
              "ANY",
              "IO",
              "WISP",
              "CHECKOUT",
              "PSP"
            ]
          },
          "idPspList": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "transferList": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TransferListItem"
            }
          }
        }
      },
      "AppInfo": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string"
          },
          "version": {
            "type": "string"
          },
          "environment": {
            "type": "string"
          }
        }
      },
      "Bundle": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "idPsp": {
            "type": "string"
          },
          "name": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "paymentAmount": {
            "type": "integer",
            "format": "int64"
          },
          "minPaymentAmount": {
            "type": "integer",
            "format": "int64"
          },
          "maxPaymentAmount": {
            "type": "integer",
            "format": "int64"
          },
          "paymentMethod": {
            "type": "string",
            "enum": [
              "ANY",
              "PPAL",
              "BPAY",
              "PAYBP",
              "BBT",
              "AD",
              "CP",
              "PO",
              "JIF",
              "MYBK"
            ]
          },
          "touchpoint": {
            "type": "string",
            "enum": [
              "ANY",
              "IO",
              "WISP",
              "CHECKOUT",
              "PSP"
            ]
          },
          "type": {
            "type": "string",
            "enum": [
              "GLOBAL",
              "PUBLIC",
              "PRIVATE"
            ]
          },
          "transferCategoryList": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TransferCategory"
            }
          }
        }
      },
      "CiBundle": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "ciFiscalCode": {
            "type": "string"
          },
          "idBundle": {
            "type": "string"
          },
          "attributes": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CiBundleAttribute"
            }
          }
        }
      },
      "CiBundleAttribute": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string"
          },
          "maxPaymentAmount": {
            "type": "integer",
            "format": "int64"
          },
          "transferCategory": {
            "type": "string"
          },
          "transferCategoryRelation": {
            "type": "string",
            "enum": [
              "EQUAL",
              "NOT_EQUAL"
            ]
          }
        }
      },
      "Configuration": {
        "type": "object",
        "properties": {
          "bundles": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/Bundle"
            }
          },
          "ciBundles": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CiBundle"
            }
          }
        }
      },
      "TransferCategory": {
        "type": "object",
        "properties": {
          "id": {
            "type": "integer",
            "format": "int64"
          },
          "name": {
            "type": "string"
          }
        }
      }
    },
    "securitySchemes": {
      "ApiKey": {
        "type": "apiKey",
        "description": "The API key to access this function app.",
        "name": "Ocp-Apim-Subscription-Key",
        "in": "header"
      }
    }
  }
}