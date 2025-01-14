{
  "openapi": "3.0.3",
  "info": {
    "title" : "FDR INTERNAL - Flussi di rendicontazione ${service}",
    "description" : "Manage FDR INTERNAL ( aka \"Flussi di Rendicontazione\" ) exchanged between PSP and EC ${service}",
    "termsOfService": "https://www.pagopa.gov.it/",
    "version": "1.0.0-SNAPSHOT"
  },
  "servers": [
    {
      "url": "http://localhost:8080/"
    }
  ],
  "security": [
    {
      "api_key": []
    }
  ],
  "tags": [
    {
      "name": "Info",
      "description": "Info operations"
    },
    {
      "name": "Internal Organizations",
      "description": "Organizations operations"
    },
    {
      "name": "Internal PSP",
      "description": "PSP operations"
    },
    {
      "name": "Organizations",
      "description": "Organizations operations"
    },
    {
      "name": "PSP",
      "description": "PSP operations"
    },
    {
      "name": "Support",
      "description": "Support operations"
    }
  ],
  "paths": {
    "/internal/psps/{pspId}/fdrs/{fdr}/payments/add": {
      "put": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Add payments to fdr",
        "description": "Add payments to fdr",
        "operationId": "internalAddPayment",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/AddPaymentRequest"
              }
            }
          }
        },
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GenericResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/psps/{pspId}": {
      "get": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Get all fdr inserted",
        "description": "Get all fdr inserted",
        "operationId": "internalGetAllCreated",
        "parameters": [
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "createdGt",
            "in": "query",
            "schema": {
              "$ref": "#/components/schemas/Instant"
            }
          },
          {
            "name": "page",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1,
              "minimum": 1,
              "type": "integer"
            }
          },
          {
            "name": "size",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1000,
              "minimum": 1,
              "type": "integer"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GetAllCreatedResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/psps/{pspId}/iur/{iur}": {
      "get": {
        "tags": [
          "Support"
        ],
        "summary": "Get all payments by psp id and iur",
        "description": "Get all payments by psp id and iur",
        "operationId": "getByIur",
        "parameters": [
          {
            "name": "iur",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "createdFrom",
            "in": "query",
            "schema": {
              "$ref": "#/components/schemas/Instant"
            }
          },
          {
            "name": "createdTo",
            "in": "query",
            "schema": {
              "$ref": "#/components/schemas/Instant"
            }
          },
          {
            "name": "page",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1,
              "minimum": 1,
              "type": "integer"
            }
          },
          {
            "name": "size",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1000,
              "minimum": 1,
              "type": "integer"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/FdrByIurResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/organizations/{organizationId}/fdrs": {
      "get": {
        "tags": [
          "Internal Organizations"
        ],
        "summary": "Get all fdr published",
        "description": "Get all fdr published",
        "operationId": "internalGetAllPublished",
        "parameters": [
          {
            "name": "organizationId",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "page",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1,
              "minimum": 1,
              "type": "integer"
            }
          },
          {
            "name": "pspId",
            "in": "query",
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "publishedGt",
            "in": "query",
            "schema": {
              "$ref": "#/components/schemas/Instant"
            }
          },
          {
            "name": "size",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1000,
              "minimum": 1,
              "type": "integer"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GetAllResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/psps/{pspId}/fdrs/{fdr}/publish": {
      "post": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Publish fdr",
        "description": "Publish fdr",
        "operationId": "internalPublish",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GenericResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/psps/{pspId}/iuv/{iuv}": {
      "get": {
        "tags": [
          "Support"
        ],
        "summary": "Get all payments by psp id and iuv",
        "description": "Get all payments by psp id and iuv",
        "operationId": "getByIuv",
        "parameters": [
          {
            "name": "iuv",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "createdFrom",
            "in": "query",
            "schema": {
              "$ref": "#/components/schemas/Instant"
            }
          },
          {
            "name": "createdTo",
            "in": "query",
            "schema": {
              "$ref": "#/components/schemas/Instant"
            }
          },
          {
            "name": "page",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1,
              "minimum": 1,
              "type": "integer"
            }
          },
          {
            "name": "size",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1000,
              "minimum": 1,
              "type": "integer"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/FdrByIuvResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/organizations/{organizationId}/fdrs/{fdr}/revisions/{revision}/psps/{pspId}": {
      "get": {
        "tags": [
          "Internal Organizations"
        ],
        "summary": "Get fdr",
        "description": "Get fdr by id but not payments",
        "operationId": "internalGet",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "organizationId",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "revision",
            "in": "path",
            "required": true,
            "schema": {
              "format": "int64",
              "type": "integer"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GetResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/psps/{pspId}/fdrs/{fdr}/payments/del": {
      "put": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Delete payments to fdr",
        "description": "Delete payments to fdr",
        "operationId": "internalDeletePayment",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/DeletePaymentRequest"
              }
            }
          }
        },
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GenericResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/organizations/{organizationId}/fdrs/{fdr}/revisions/{revision}/psps/{pspId}/payments": {
      "get": {
        "tags": [
          "Internal Organizations"
        ],
        "summary": "Get payments of fdr",
        "description": "Get payments of fdr",
        "operationId": "internalGetPayment",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "organizationId",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "^(.{1,35})$",
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "revision",
            "in": "path",
            "required": true,
            "schema": {
              "format": "int64",
              "type": "integer"
            }
          },
          {
            "name": "page",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1,
              "minimum": 1,
              "type": "integer"
            }
          },
          {
            "name": "size",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1000,
              "minimum": 1,
              "type": "integer"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GetPaymentResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/psps/{pspId}/fdrs/{fdr}": {
      "get": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Get created fdr",
        "description": "Get created fdr",
        "operationId": "internalGetCreated",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GetCreatedResponse"
                }
              }
            }
          }
        }
      },
      "post": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Create fdr",
        "description": "Create fdr",
        "operationId": "internalCreate",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "pattern": "[a-zA-Z0-9\\-_]{1,35}",
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/CreateRequest"
              }
            }
          }
        },
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "201": {
            "description": "Created",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GenericResponse"
                }
              }
            }
          }
        }
      },
      "delete": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Delete fdr",
        "description": "Delete fdr",
        "operationId": "internalDelete",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GenericResponse"
                }
              }
            }
          }
        }
      }
    },
    "/internal/psps/{pspId}/fdrs/{fdr}/payments": {
      "get": {
        "tags": [
          "Internal PSP"
        ],
        "summary": "Get internal created payments of fdr",
        "description": "Get internal created payments of fdr",
        "operationId": "internalGetCreatedPayment",
        "parameters": [
          {
            "name": "fdr",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "pspId",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "page",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1,
              "minimum": 1,
              "type": "integer"
            }
          },
          {
            "name": "size",
            "in": "query",
            "schema": {
              "format": "int64",
              "default": 1000,
              "minimum": 1,
              "type": "integer"
            }
          }
        ],
        "responses": {
          "500": {
            "$ref": "#/components/responses/InternalServerError"
          },
          "400": {
            "$ref": "#/components/responses/AppException400"
          },
          "404": {
            "$ref": "#/components/responses/AppException404"
          },
          "200": {
            "description": "Success",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/GetPaymentResponse"
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
      "AddPaymentRequest": {
        "required": [
          "payments"
        ],
        "type": "object",
        "properties": {
          "payments": {
            "maxItems": 1000,
            "minItems": 1,
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/Payment"
            }
          }
        }
      },
      "CreateRequest": {
        "required": [
          "fdr",
          "fdrDate",
          "sender",
          "receiver",
          "regulation",
          "regulationDate",
          "totPayments",
          "sumPayments"
        ],
        "type": "object",
        "properties": {
          "fdr": {
            "description": "[XML NodoInviaFlussoRendicontazione]=[identificativoFlusso]",
            "pattern": "[a-zA-Z0-9\\-_]{1,35}",
            "type": "string",
            "example": "2016-08-16pspTest-1178"
          },
          "fdrDate": {
            "description": "[XML NodoInviaFlussoRendicontazione]=[dataOraFlusso]",
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-05T09:21:37.810000Z"
          },
          "sender": {
            "$ref": "#/components/schemas/Sender"
          },
          "receiver": {
            "$ref": "#/components/schemas/Receiver"
          },
          "regulation": {
            "description": "[XML FlussoRiversamento]=[identificativoUnivocoRegolamento]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "SEPA - Bonifico xzy"
          },
          "regulationDate": {
            "description": "[XML FlussoRiversamento]=[dataRegolamento]",
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "bicCodePouringBank": {
            "description": "[XML FlussoRiversamento]=[codiceBicBancaDiRiversamento]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "UNCRITMMXXX"
          },
          "totPayments": {
            "format": "int64",
            "description": "[XML FlussoRiversamento]=[numeroTotalePagamenti]",
            "minimum": 1,
            "type": "integer",
            "example": 1
          },
          "sumPayments": {
            "format": "double",
            "description": "[XML FlussoRiversamento]=[importoTotalePagamenti]",
            "minimum": 0,
            "exclusiveMinimum": true,
            "pattern": "^\\d{1,2147483647}([.]\\d{1,2})?$",
            "type": "number",
            "example": 0.01
          }
        }
      },
      "DeletePaymentRequest": {
        "required": [
          "indexList"
        ],
        "type": "object",
        "properties": {
          "indexList": {
            "maxItems": 1000,
            "minItems": 1,
            "type": "array",
            "items": {
              "format": "int64",
              "type": "integer"
            }
          }
        }
      },
      "ErrorCode": {
        "type": "object",
        "properties": {
          "code": {
            "type": "string",
            "example": "FDR-0500"
          },
          "description": {
            "type": "string",
            "example": "An unexpected error has occurred. Please contact support."
          },
          "statusCode": {
            "format": "int32",
            "type": "integer",
            "example": 500
          }
        }
      },
      "ErrorMessage": {
        "type": "object",
        "properties": {
          "path": {
            "type": "string",
            "example": "demo.test"
          },
          "message": {
            "type": "string",
            "example": "An unexpected error has occurred. Please contact support."
          }
        }
      },
      "ErrorResponse": {
        "type": "object",
        "properties": {
          "errorId": {
            "type": "string",
            "example": "50905466-1881-457b-b42f-fb7b2bfb1610"
          },
          "httpStatusCode": {
            "format": "int32",
            "type": "integer",
            "example": 500
          },
          "httpStatusDescription": {
            "type": "string",
            "example": "Internal Server Error"
          },
          "appErrorCode": {
            "type": "string",
            "example": "FDR-500"
          },
          "errors": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/ErrorMessage"
            }
          }
        }
      },
      "Fdr": {
        "type": "object",
        "properties": {
          "fdr": {
            "type": "string",
            "example": "AAABBB"
          },
          "pspId": {
            "type": "string",
            "example": "1"
          },
          "revision": {
            "format": "int64",
            "type": "integer",
            "example": 1
          },
          "published": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          }
        }
      },
      "FdrByIur": {
        "type": "object",
        "properties": {
          "pspId": {
            "type": "string"
          },
          "organizationId": {
            "type": "string"
          },
          "fdr": {
            "type": "string"
          },
          "revision": {
            "format": "int64",
            "type": "integer"
          },
          "created": {
            "$ref": "#/components/schemas/Instant"
          }
        }
      },
      "FdrByIurResponse": {
        "type": "object",
        "properties": {
          "metadata": {
            "$ref": "#/components/schemas/Metadata"
          },
          "count": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/FdrByIur"
            }
          }
        }
      },
      "FdrByIuv": {
        "type": "object",
        "properties": {
          "pspId": {
            "type": "string"
          },
          "organizationId": {
            "type": "string"
          },
          "fdr": {
            "type": "string"
          },
          "revision": {
            "format": "int64",
            "type": "integer"
          },
          "created": {
            "$ref": "#/components/schemas/Instant"
          }
        }
      },
      "FdrByIuvResponse": {
        "type": "object",
        "properties": {
          "metadata": {
            "$ref": "#/components/schemas/Metadata"
          },
          "count": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/FdrByIuv"
            }
          }
        }
      },
      "FdrInserted": {
        "type": "object",
        "properties": {
          "fdr": {
            "type": "string",
            "example": "AAABBB"
          },
          "pspId": {
            "type": "string",
            "example": "1"
          },
          "revision": {
            "format": "int64",
            "type": "integer",
            "example": 1
          },
          "created": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          }
        }
      },
      "GenericResponse": {
        "type": "object",
        "properties": {
          "message": {
            "type": "string",
            "example": "Success"
          }
        }
      },
      "GetAllCreatedResponse": {
        "type": "object",
        "properties": {
          "metadata": {
            "$ref": "#/components/schemas/Metadata"
          },
          "count": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/FdrInserted"
            }
          }
        }
      },
      "GetAllResponse": {
        "type": "object",
        "properties": {
          "metadata": {
            "$ref": "#/components/schemas/Metadata"
          },
          "count": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/Fdr"
            }
          }
        }
      },
      "GetCreatedResponse": {
        "type": "object",
        "properties": {
          "status": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/ReportingFlowStatusEnum"
              }
            ],
            "example": "CREATED"
          },
          "revision": {
            "format": "int64",
            "type": "integer",
            "example": 4
          },
          "created": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "updated": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "fdr": {
            "type": "string",
            "example": "2016-08-16pspTest-1178"
          },
          "fdrDate": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-05T09:21:37.810000Z"
          },
          "regulation": {
            "type": "string",
            "example": "SEPA - Bonifico xzy"
          },
          "regulationDate": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "bicCodePouringBank": {
            "type": "string",
            "example": "UNCRITMMXXX"
          },
          "sender": {
            "$ref": "#/components/schemas/Sender"
          },
          "receiver": {
            "$ref": "#/components/schemas/Receiver"
          },
          "computedTotPayments": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "computedSumPayments": {
            "format": "double",
            "type": "number",
            "example": 100.9
          },
          "totPayments": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "sumPayments": {
            "format": "double",
            "type": "number",
            "example": 100.9
          }
        }
      },
      "GetPaymentResponse": {
        "type": "object",
        "properties": {
          "metadata": {
            "$ref": "#/components/schemas/Metadata"
          },
          "count": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/Payment"
            }
          }
        }
      },
      "GetResponse": {
        "type": "object",
        "properties": {
          "status": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/ReportingFlowStatusEnum"
              }
            ],
            "example": "CREATED"
          },
          "revision": {
            "format": "int64",
            "type": "integer",
            "example": 4
          },
          "created": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "updated": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "fdr": {
            "type": "string",
            "example": "2016-08-16pspTest-1178"
          },
          "fdrDate": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-05T09:21:37.810000Z"
          },
          "regulation": {
            "type": "string",
            "example": "SEPA - Bonifico xzy"
          },
          "regulationDate": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "bicCodePouringBank": {
            "type": "string",
            "example": "UNCRITMMXXX"
          },
          "sender": {
            "$ref": "#/components/schemas/Sender"
          },
          "receiver": {
            "$ref": "#/components/schemas/Receiver"
          },
          "published": {
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-04-03T12:00:30.900000Z"
          },
          "computedTotPayments": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "computedSumPayments": {
            "format": "double",
            "type": "number",
            "example": 100.9
          },
          "totPayments": {
            "format": "int64",
            "type": "integer",
            "example": 100
          },
          "sumPayments": {
            "format": "double",
            "type": "number",
            "example": 100.9
          }
        }
      },
      "InfoResponse": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "example": "pagopa-fdr"
          },
          "version": {
            "type": "string",
            "example": "1.2.3"
          },
          "environment": {
            "type": "string",
            "example": "dev"
          },
          "description": {
            "type": "string",
            "example": "FDR - Flussi di rendicontazione"
          },
          "errorCodes": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/ErrorCode"
            }
          }
        }
      },
      "Instant": {
        "format": "date-time",
        "type": "string",
        "example": "2022-03-10T16:15:50Z"
      },
      "Metadata": {
        "type": "object",
        "properties": {
          "pageSize": {
            "format": "int32",
            "type": "integer",
            "example": 25
          },
          "pageNumber": {
            "format": "int32",
            "type": "integer",
            "example": 1
          },
          "totPage": {
            "format": "int32",
            "type": "integer",
            "example": 3
          }
        }
      },
      "Payment": {
        "required": [
          "iuv",
          "iur",
          "index",
          "pay",
          "payStatus",
          "payDate"
        ],
        "type": "object",
        "properties": {
          "iuv": {
            "description": "[XML FlussoRiversamento]=[datiSingoliPagamenti.identificativoUnivocoVersamento]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "abcdefg"
          },
          "iur": {
            "description": "[XML FlussoRiversamento]=[datiSingoliPagamenti.identificativoUnivocoRiscossione]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "abcdefg"
          },
          "index": {
            "format": "int64",
            "description": "[XML FlussoRiversamento]=[datiSingoliPagamenti.indiceDatiSingoloPagamento]",
            "minimum": 1,
            "type": "integer",
            "example": 1
          },
          "pay": {
            "format": "double",
            "description": "[XML FlussoRiversamento]=[datiSingoliPagamenti.singoloImportoPagato]",
            "minimum": 0,
            "exclusiveMinimum": true,
            "pattern": "^\\d{1,2147483647}([.]\\d{1,2})?$",
            "type": "number",
            "example": 0.01
          },
          "payStatus": {
            "description": "[XML FlussoRiversamento]=[datiSingoliPagamenti.codiceEsitoSingoloPagamento] \n0 -> EXECUTED\n3 -> REVOKED\n9 -> NO_RPT",
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/PaymentStatusEnum"
              }
            ],
            "example": "EXECUTED"
          },
          "payDate": {
            "description": "[XML FlussoRiversamento]=[datiSingoliPagamenti.dataEsitoSingoloPagamento]",
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/Instant"
              }
            ],
            "example": "2023-02-03T12:00:30.900000Z"
          }
        }
      },
      "PaymentStatusEnum": {
        "enum": [
          "EXECUTED",
          "REVOKED",
          "NO_RPT"
        ],
        "type": "string"
      },
      "Receiver": {
        "required": [
          "id",
          "organizationId",
          "organizationName"
        ],
        "type": "object",
        "properties": {
          "id": {
            "description": "[XML FlussoRiversamento]=[istitutoRicevente.identificativoUnivocoRicevente.codiceIdentificativoUnivoco]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "APPBIT2B"
          },
          "organizationId": {
            "description": "[XML NodoInviaFlussoRendicontazione]=[identificativoDominio]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "20000000001"
          },
          "organizationName": {
            "description": "[XML FlussoRiversamento]=[istitutoRicevente.denominazioneRicevente]",
            "pattern": "^(.{1,140})$",
            "type": "string",
            "example": "Comune di xyz"
          }
        }
      },
      "ReportingFlowStatusEnum": {
        "enum": [
          "CREATED",
          "INSERTED",
          "PUBLISHED"
        ],
        "type": "string"
      },
      "Sender": {
        "required": [
          "type",
          "id",
          "pspId",
          "pspName",
          "pspBrokerId",
          "channelId"
        ],
        "type": "object",
        "properties": {
          "type": {
            "description": "[XML FlussoRiversamento]=[istitutoMittente.identificativoUnivocoMittente.tipoIdentificativoUnivoco] \nG -> LEGAL_PERSON\nA -> ABI_CODE\nB -> BIC_CODE",
            "type": "string",
            "allOf": [
              {
                "$ref": "#/components/schemas/SenderTypeEnum"
              }
            ],
            "example": "LEGAL_PERSON"
          },
          "id": {
            "description": "[XML FlussoRiversamento]=[istitutoMittente.identificativoUnivocoMittente.codiceIdentificativoUnivoco]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "SELBIT2B"
          },
          "pspId": {
            "description": "[XML NodoInviaFlussoRendicontazione]=[identificativoPSP]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "60000000001"
          },
          "pspName": {
            "description": "[XML FlussoRiversamento]=[istitutoMittente.denominazioneMittente]",
            "pattern": "^(.{3,70})$",
            "type": "string",
            "example": "Bank"
          },
          "pspBrokerId": {
            "description": "[XML NodoInviaFlussoRendicontazione]=[identificativoIntermediarioPSP]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "70000000001"
          },
          "channelId": {
            "description": "[XML NodoInviaFlussoRendicontazione]=[identificativoCanale]",
            "pattern": "^(.{1,35})$",
            "type": "string",
            "example": "80000000001"
          },
          "password": {
            "description": "[XML NodoInviaFlussoRendicontazione]=[password]",
            "pattern": "^(\\w{8,15})$",
            "type": "string",
            "example": "1234567890",
            "deprecated": true
          }
        }
      },
      "SenderTypeEnum": {
        "enum": [
          "LEGAL_PERSON",
          "ABI_CODE",
          "BIC_CODE"
        ],
        "type": "string"
      }
    },
    "responses": {
      "AppException400": {
        "description": "Default app exception for status 400",
        "content": {
          "application/json": {
            "schema": {
              "$ref": "#/components/schemas/ErrorResponse"
            },
            "examples": {
              "Error": {
                "value": {
                  "httpStatusCode": 400,
                  "httpStatusDescription": "Bad Request",
                  "appErrorCode": "FDR-0702",
                  "errors": [
                    {
                      "message": "Reporting Fdr [<fdr>] is invalid"
                    }
                  ]
                }
              },
              "Errors with path": {
                "value": {
                  "httpStatusCode": 400,
                  "httpStatusDescription": "Bad Request",
                  "appErrorCode": "FDR-0702",
                  "errors": [
                    {
                      "path": "<detail.path.if-exist>",
                      "message": "<detail.message>"
                    }
                  ]
                }
              }
            }
          }
        }
      },
      "AppException404": {
        "description": "Default app exception for status 404",
        "content": {
          "application/json": {
            "schema": {
              "$ref": "#/components/schemas/ErrorResponse"
            },
            "example": {
              "httpStatusCode": 404,
              "httpStatusDescription": "Not Found",
              "appErrorCode": "FDR-0701",
              "errors": [
                {
                  "message": "Reporting Fdr [<fdr>] not found"
                }
              ]
            }
          }
        }
      },
      "InternalServerError": {
        "description": "Internal Server Error",
        "content": {
          "application/json": {
            "schema": {
              "$ref": "#/components/schemas/ErrorResponse"
            },
            "example": {
              "errorId": "50905466-1881-457b-b42f-fb7b2bfb1610",
              "httpStatusCode": 500,
              "httpStatusDescription": "Internal Server Error",
              "appErrorCode": "FDR-0500",
              "errors": [
                {
                  "message": "An unexpected error has occurred. Please contact support."
                }
              ]
            }
          }
        }
      }
    },
    "securitySchemes": {
      "api_key": {
        "type": "apiKey",
        "name": "Ocp-Apim-Subscription-Key",
        "in": "header"
      },
      "SecurityScheme": {
        "type": "http",
        "description": "Authentication",
        "scheme": "basic"
      }
    }
  }
}
