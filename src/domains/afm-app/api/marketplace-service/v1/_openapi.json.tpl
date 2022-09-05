{
  "openapi": "3.0.1",
  "info": {
    "title": "PagoPA AFM Marketplace",
    "description": "Marketplace backend for pagoPA AFM",
    "termsOfService": "https://www.pagopa.gov.it/",
    "version": "0.0.1"
  },
  "servers": [
    {
      "url": "${host}/afm/api/v1",
      "description": "Generated server url"
    }
  ],
  "tags": [
    {
      "name": "CI",
      "description": "Everything about CI"
    },
    {
      "name": "PSP",
      "description": "Everything about PSP"
    }
  ],
  "paths": {
    "/bundles": {
      "get": {
        "tags": [
          "CI"
        ],
        "summary": "Get bundles by type",
        "operationId": "getGlobalBundles",
        "parameters": [
          {
            "name": "limit",
            "in": "query",
            "description": "Number of items for page. Default = 50",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 50
            }
          },
          {
            "name": "page",
            "in": "query",
            "description": "Page number. Page number value starts from 0. Default = 1",
            "required": false,
            "schema": {
              "minimum": 0,
              "type": "integer",
              "format": "int32",
              "default": 1
            }
          },
          {
            "name": "types",
            "in": "query",
            "description": "Bundle type. Default = GLOBAL",
            "required": false,
            "schema": {
              "type": "array",
              "items": {
                "type": "string",
                "enum": [
                  "GLOBAL",
                  "PUBLIC",
                  "PRIVATE"
                ]
              },
              "default": [
                "GLOBAL"
              ]
            }
          }
        ],
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
                  "$ref": "#/components/schemas/Bundles"
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/bundles": {
      "get": {
        "tags": [
          "CI"
        ],
        "summary": "Get paginated list of bundles of a CI",
        "operationId": "getBundlesByFiscalCode",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "limit",
            "in": "query",
            "description": "Number of items for page. Default = 50",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 50
            }
          },
          {
            "name": "page",
            "in": "query",
            "description": "Page number. Page number value starts from 0. Default = 1",
            "required": false,
            "schema": {
              "minimum": 0,
              "type": "integer",
              "format": "int32",
              "default": 1
            }
          }
        ],
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
                  "$ref": "#/components/schemas/Bundles"
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/bundles/{idbundle}": {
      "get": {
        "tags": [
          "CI"
        ],
        "summary": "Get a bundle of a CI",
        "operationId": "getBundleByFiscalCode",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
                  "$ref": "#/components/schemas/BundleDetails"
                }
              }
            }
          },
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/bundles/{idbundle}/attributes": {
      "get": {
        "tags": [
          "CI"
        ],
        "summary": "Get attributes of a bundle of a CI",
        "operationId": "getBundleAttributesByFiscalCode",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
                  "$ref": "#/components/schemas/BundleDetailsAttributes"
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
          "404": {
            "description": "Not Found",
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
        }
      },
      "post": {
        "tags": [
          "CI"
        ],
        "summary": "Create a new bundle attribute",
        "operationId": "createBundleAttributesByCi",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
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
                "$ref": "#/components/schemas/CiBundleAttributeModel"
              }
            }
          },
          "required": true
        },
        "responses": {
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
          "201": {
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
                  "$ref": "#/components/schemas/BundleAttributeResponse"
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/bundles/{idbundle}/attributes/{idattribute}": {
      "put": {
        "tags": [
          "CI"
        ],
        "summary": "Update an attribute of a bundle",
        "operationId": "updateBundleAttributesByCi",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idattribute",
            "in": "path",
            "description": "Attribute identifier",
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
                "$ref": "#/components/schemas/CiBundleAttributeModel"
              }
            }
          },
          "required": true
        },
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
      },
      "delete": {
        "tags": [
          "CI"
        ],
        "summary": "Delete an attribute of a bundle",
        "operationId": "removeBundleAttributesByCi",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idattribute",
            "in": "path",
            "description": "Attribute identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/bundles/{idcibundle}": {
      "delete": {
        "tags": [
          "CI"
        ],
        "summary": "Remove a bundle of a CI",
        "operationId": "removeBundleByFiscalCode",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idcibundle",
            "in": "path",
            "description": "CIBundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/offers": {
      "get": {
        "tags": [
          "CI"
        ],
        "summary": "Get paginated list of PSP offers to the CI regarding private bundles",
        "operationId": "getOffersByCI",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "size",
            "in": "query",
            "description": "Number of elements for one page. Default = 50",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 50
            }
          },
          {
            "name": "cursor",
            "in": "query",
            "description": "Starting cursor",
            "required": false,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idPsp",
            "in": "query",
            "description": "Filter by psp",
            "required": false,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
                  "$ref": "#/components/schemas/BundleCiOffers"
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/offers/{idbundleoffer}/accept": {
      "post": {
        "tags": [
          "CI"
        ],
        "summary": "The CI accepts an offer of a PSP",
        "operationId": "acceptOffer",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundleoffer",
            "in": "path",
            "description": "Bundle offer identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
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
                  "$ref": "#/components/schemas/CiBundleId"
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/offers/{idbundleoffer}/reject": {
      "post": {
        "tags": [
          "CI"
        ],
        "summary": "The CI rejects the offer of the PSP",
        "operationId": "rejectOffer",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundleoffer",
            "in": "path",
            "description": "Bundle offer identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/cis/{cifiscalcode}/requests": {
      "get": {
        "tags": [
          "CI"
        ],
        "summary": "Get paginated list of CI request to the PSP regarding public bundles",
        "operationId": "getRequestsByCI",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "size",
            "in": "query",
            "description": "Number of elements for one page. Default = 50",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 50
            }
          },
          {
            "name": "cursor",
            "in": "query",
            "description": "Starting cursor",
            "required": false,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idPsp",
            "in": "query",
            "description": "Filter by psp",
            "required": false,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
                  "$ref": "#/components/schemas/CiRequests"
                }
              }
            }
          },
          "404": {
            "description": "Not Found",
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
        }
      },
      "post": {
        "tags": [
          "CI"
        ],
        "summary": "Create CI request to the PSP regarding public bundles",
        "operationId": "createRequest",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
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
                "$ref": "#/components/schemas/CiBundleSubscriptionRequest"
              }
            }
          },
          "required": true
        },
        "responses": {
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
          "404": {
            "description": "Not Found",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "201": {
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
                  "$ref": "#/components/schemas/BundleRequestId"
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
        }
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
    "/cis/{cifiscalcode}/requests/{idbundlerequest}": {
      "delete": {
        "tags": [
          "CI"
        ],
        "summary": "Delete CI request regarding a public bundles",
        "operationId": "removeRequest",
        "parameters": [
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundlerequest",
            "in": "path",
            "description": "CI identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
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
        "summary": "Return OK if application is started",
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
        }
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
    "/psps/{idpsp}/bundles": {
      "get": {
        "tags": [
          "PSP"
        ],
        "summary": "Get paginated list of bundles of a PSP",
        "operationId": "getBundles",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "limit",
            "in": "query",
            "description": "Number of items for page. Default = 50",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 50
            }
          },
          {
            "name": "page",
            "in": "query",
            "description": "Page number. Page number value starts from 0. Default = 1",
            "required": false,
            "schema": {
              "minimum": 0,
              "type": "integer",
              "format": "int32",
              "default": 1
            }
          }
        ],
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
                  "$ref": "#/components/schemas/Bundles"
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
          "404": {
            "description": "Not Found",
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
        }
      },
      "post": {
        "tags": [
          "PSP"
        ],
        "summary": "Create a new bundle",
        "operationId": "createBundle",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/BundleRequest"
              }
            }
          },
          "required": true
        },
        "responses": {
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
          "404": {
            "description": "Not Found",
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
          "201": {
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
                  "$ref": "#/components/schemas/BundleResponse"
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
        }
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
    "/psps/{idpsp}/bundles/{idbundle}": {
      "get": {
        "tags": [
          "PSP"
        ],
        "summary": "Get a bundle",
        "operationId": "getBundle",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
                  "$ref": "#/components/schemas/BundleDetails"
                }
              }
            }
          },
          "404": {
            "description": "Not Found",
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
        }
      },
      "put": {
        "tags": [
          "PSP"
        ],
        "summary": "Update a bundle",
        "operationId": "updateBundle",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
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
                "$ref": "#/components/schemas/BundleRequest"
              }
            }
          },
          "required": true
        },
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
      },
      "delete": {
        "tags": [
          "PSP"
        ],
        "summary": "Delete the bundle with the given id",
        "operationId": "removeBundle",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/psps/{idpsp}/bundles/{idbundle}/creditorInstitutions": {
      "get": {
        "tags": [
          "PSP"
        ],
        "summary": "Get paginated list of CI subscribed to a bundle",
        "operationId": "getBundleCreditorInstitutions",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
          "404": {
            "description": "Not Found",
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
                  "$ref": "#/components/schemas/CiFiscalCodeList"
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
        }
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
    "/psps/{idpsp}/bundles/{idbundle}/creditorInstitutions/{cifiscalcode}": {
      "get": {
        "tags": [
          "PSP"
        ],
        "summary": "Get details of a relationship between a bundle and a creditor institution",
        "operationId": "getBundleCreditorInstitutionDetails",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "cifiscalcode",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
                  "$ref": "#/components/schemas/CiBundleDetails"
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/psps/{idpsp}/bundles/{idbundle}/offers": {
      "post": {
        "tags": [
          "PSP"
        ],
        "summary": "PSP offers a private bundle to a creditor institution",
        "operationId": "sendBundleOffer",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
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
                "$ref": "#/components/schemas/CiFiscalCodeList"
              }
            }
          },
          "required": true
        },
        "responses": {
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
          "404": {
            "description": "Not Found",
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
                  "$ref": "#/components/schemas/CiFiscalCodeList"
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
        }
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
    "/psps/{idpsp}/bundles/{idbundle}/offers/{idbundleoffer}": {
      "delete": {
        "tags": [
          "PSP"
        ],
        "summary": "PSP deletes a private bundle offered",
        "operationId": "removeBundleOffer",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idbundle",
            "in": "path",
            "description": "Bundle identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "idbundleoffer",
            "in": "path",
            "description": "Bundle offer identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
          "404": {
            "description": "Not Found",
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
                  "$ref": "#/components/schemas/CiFiscalCodeList"
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
        }
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
    "/psps/{idpsp}/offers": {
      "get": {
        "tags": [
          "PSP"
        ],
        "summary": "Get paginated list of PSP offers regarding private bundles",
        "operationId": "getOffers",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "limit",
            "in": "query",
            "description": "Number of items for page. Default = 50",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 50
            }
          },
          {
            "name": "page",
            "in": "query",
            "description": "Page number. Page number value starts from 0. Default = 1",
            "required": false,
            "schema": {
              "minimum": 0,
              "type": "integer",
              "format": "int32",
              "default": 1
            }
          }
        ],
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
                  "$ref": "#/components/schemas/BundleOffers"
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/psps/{idpsp}/requests": {
      "get": {
        "tags": [
          "PSP"
        ],
        "summary": "Get paginated list of CI request to the PSP regarding public bundles",
        "operationId": "getRequestsByPsp",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "limit",
            "in": "query",
            "description": "Number of items for page. Default = 50",
            "required": false,
            "schema": {
              "type": "integer",
              "format": "int32",
              "default": 50
            }
          },
          {
            "name": "page",
            "in": "query",
            "description": "Page number. Page number value starts from 0. Default = 1",
            "required": false,
            "schema": {
              "minimum": 0,
              "type": "integer",
              "format": "int32",
              "default": 1
            }
          },
          {
            "name": "cursor",
            "in": "query",
            "description": "Cursor",
            "required": false,
            "schema": {
              "minimum": 0,
              "type": "string"
            }
          },
          {
            "name": "ciFiscalCode",
            "in": "query",
            "description": "Filter by creditor institution",
            "required": false,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
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
          "404": {
            "description": "Not Found",
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
                  "$ref": "#/components/schemas/PspRequests"
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
        }
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
    "/psps/{idpsp}/requests/{idBundleRequest}/accept": {
      "post": {
        "tags": [
          "PSP"
        ],
        "summary": "the PSP accepts a request of a CI",
        "operationId": "acceptRequest",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idBundleRequest",
            "in": "path",
            "description": "Bundle Request identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "201": {
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
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
    "/psps/{idpsp}/requests/{idBundleRequest}/reject": {
      "post": {
        "tags": [
          "PSP"
        ],
        "summary": "the PSP rejects a request of a CI",
        "operationId": "rejectRequest",
        "parameters": [
          {
            "name": "idpsp",
            "in": "path",
            "description": "PSP identifier",
            "required": true,
            "schema": {
              "maxLength": 35,
              "minLength": 0,
              "type": "string"
            }
          },
          {
            "name": "idBundleRequest",
            "in": "path",
            "description": "Bundle Request identifier",
            "required": true,
            "schema": {
              "type": "string"
            }
          }
        ],
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
              "application/json": {}
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
          "404": {
            "description": "Not Found",
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
        }
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
      "BundleRequest": {
        "type": "object",
        "properties": {
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
            "type": "string"
          },
          "touchpoint": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "transferCategoryList": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "validityDateFrom": {
            "type": "string",
            "format": "date-time"
          },
          "validityDateTo": {
            "type": "string",
            "format": "date-time"
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
      "CiBundleAttributeModel": {
        "type": "object",
        "properties": {
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
      "BundleResponse": {
        "type": "object",
        "properties": {
          "idBundle": {
            "type": "string"
          }
        }
      },
      "CiFiscalCodeList": {
        "type": "object",
        "properties": {
          "ciFiscalCodeList": {
            "type": "array",
            "items": {
              "type": "string"
            }
          }
        }
      },
      "CiBundleSubscriptionRequest": {
        "required": [
          "idBundle"
        ],
        "type": "object",
        "properties": {
          "idBundle": {
            "type": "string"
          },
          "attributes": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CiBundleAttributeModel"
            }
          }
        }
      },
      "BundleRequestId": {
        "type": "object",
        "properties": {
          "idBundleRequest": {
            "type": "string"
          }
        }
      },
      "CiBundleId": {
        "type": "object",
        "properties": {
          "idCiBundle": {
            "type": "string"
          }
        }
      },
      "BundleAttributeResponse": {
        "type": "object",
        "properties": {
          "idBundleAttribute": {
            "type": "string"
          }
        }
      },
      "PageInfo": {
        "required": [
          "itemsFound",
          "limit",
          "page",
          "totalPages"
        ],
        "type": "object",
        "properties": {
          "page": {
            "type": "integer",
            "description": "Page number",
            "format": "int32"
          },
          "limit": {
            "type": "integer",
            "description": "Required number of items per page",
            "format": "int32"
          },
          "itemsFound": {
            "type": "integer",
            "description": "Number of items found. (The last page may have fewer elements than required)",
            "format": "int32"
          },
          "totalPages": {
            "type": "integer",
            "description": "Total number of pages",
            "format": "int32"
          }
        }
      },
      "PspBundleRequest": {
        "required": [
          "ciFiscalCode",
          "idBundle",
          "idBundleRequest"
        ],
        "type": "object",
        "properties": {
          "idBundle": {
            "type": "string"
          },
          "ciFiscalCode": {
            "type": "string"
          },
          "acceptedDate": {
            "type": "string",
            "format": "date-time"
          },
          "rejectionDate": {
            "type": "string",
            "format": "date-time"
          },
          "ciBundleAttributes": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/PspCiBundleAttribute"
            }
          },
          "idBundleRequest": {
            "type": "string"
          }
        }
      },
      "PspCiBundleAttribute": {
        "type": "object",
        "properties": {
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
      "PspRequests": {
        "required": [
          "pageInfo",
          "requests"
        ],
        "type": "object",
        "properties": {
          "requests": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/PspBundleRequest"
            }
          },
          "pageInfo": {
            "$ref": "#/components/schemas/PageInfo"
          }
        }
      },
      "BundleOffers": {
        "required": [
          "offers",
          "pageInfo"
        ],
        "type": "object",
        "properties": {
          "offers": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/PspBundleOffer"
            }
          },
          "pageInfo": {
            "$ref": "#/components/schemas/PageInfo"
          }
        }
      },
      "PspBundleOffer": {
        "type": "object",
        "properties": {
          "idBundle": {
            "type": "string"
          },
          "ciFiscalCode": {
            "type": "string"
          },
          "acceptedDate": {
            "type": "string",
            "format": "date-time"
          },
          "rejectionDate": {
            "type": "string",
            "format": "date-time"
          },
          "insertedDate": {
            "type": "string",
            "format": "date-time"
          },
          "idBundleOffer": {
            "type": "string"
          }
        }
      },
      "BundleDetails": {
        "type": "object",
        "properties": {
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
            "type": "string"
          },
          "touchpoint": {
            "type": "string"
          },
          "type": {
            "type": "string"
          },
          "transferCategoryList": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "validityDateFrom": {
            "type": "string",
            "format": "date-time"
          },
          "validityDateTo": {
            "type": "string",
            "format": "date-time"
          },
          "insertedDate": {
            "type": "string",
            "format": "date-time"
          },
          "lastUpdatedDate": {
            "type": "string",
            "format": "date-time"
          },
          "idBundle": {
            "type": "string"
          }
        }
      },
      "Bundles": {
        "required": [
          "bundles",
          "pageInfo"
        ],
        "type": "object",
        "properties": {
          "pageInfo": {
            "$ref": "#/components/schemas/PageInfo"
          },
          "bundles": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/BundleDetails"
            }
          }
        }
      },
      "CiBundleAttribute": {
        "type": "object",
        "properties": {
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
          },
          "validityDateTo": {
            "type": "string",
            "format": "date-time"
          },
          "insertedDate": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "CiBundleDetails": {
        "type": "object",
        "properties": {
          "validityDateTo": {
            "type": "string",
            "format": "date-time"
          },
          "attributes": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CiBundleAttribute"
            }
          }
        }
      },
      "AppInfo": {
        "required": [
          "environment",
          "name",
          "version"
        ],
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
          },
          "dbConnection": {
            "type": "string"
          }
        }
      },
      "CiBundleRequest": {
        "type": "object",
        "properties": {
          "idBundle": {
            "type": "string"
          },
          "idPsp": {
            "type": "string"
          },
          "acceptedDate": {
            "type": "string",
            "format": "date-time"
          },
          "rejectionDate": {
            "type": "string",
            "format": "date-time"
          },
          "insertedDate": {
            "type": "string",
            "format": "date-time"
          },
          "ciBundleAttributeModels": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CiBundleAttributeModel"
            }
          },
          "idBundleRequest": {
            "type": "string"
          }
        }
      },
      "CiRequests": {
        "required": [
          "pageInfo",
          "requests"
        ],
        "type": "object",
        "properties": {
          "requests": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CiBundleRequest"
            }
          },
          "pageInfo": {
            "$ref": "#/components/schemas/PageInfo"
          }
        }
      },
      "BundleCiOffers": {
        "required": [
          "offers",
          "pageInfo"
        ],
        "type": "object",
        "properties": {
          "offers": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CiBundleOffer"
            }
          },
          "pageInfo": {
            "$ref": "#/components/schemas/PageInfo"
          }
        }
      },
      "CiBundleOffer": {
        "type": "object",
        "properties": {
          "idBundle": {
            "type": "string"
          },
          "idPsp": {
            "type": "string"
          },
          "acceptedDate": {
            "type": "string",
            "format": "date-time"
          },
          "rejectionDate": {
            "type": "string",
            "format": "date-time"
          },
          "insertedDate": {
            "type": "string",
            "format": "date-time"
          },
          "idBundleOffer": {
            "type": "string"
          }
        }
      },
      "BundleAttribute": {
        "required": [
          "idBundleAttribute",
          "insertedDate"
        ],
        "type": "object",
        "properties": {
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
          },
          "validityDateTo": {
            "type": "string",
            "format": "date-time"
          },
          "insertedDate": {
            "type": "string",
            "format": "date-time"
          },
          "idBundleAttribute": {
            "type": "string"
          }
        }
      },
      "BundleDetailsAttributes": {
        "required": [
          "attributes",
          "insertedDate"
        ],
        "type": "object",
        "properties": {
          "validityDateTo": {
            "type": "string",
            "format": "date-time"
          },
          "insertedDate": {
            "type": "string",
            "format": "date-time"
          },
          "attributes": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/BundleAttribute"
            }
          }
        }
      }
    },
    "securitySchemes": {
      "Authorization": {
        "type": "http",
        "description": "JWT token get after Azure Login",
        "scheme": "bearer",
        "bearerFormat": "JWT"
      }
    }
  }
}