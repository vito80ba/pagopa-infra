{
  "openapi": "3.0.1",
  "info": {
    "title": "Mocker - Core",
    "description": "A generic endpoint that permits to retrieve dynamical mock response for pagoPA platform",
    "version": "1.0"
  },
  "servers": [
    {
      "url": "${host}",
      "description": "Generated server url"
    }
  ],
  "paths": {
    "/info": {
      "get": {
        "operationId": "healthCheck",
        "responses": {
          "200": {
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/AppInfo"
                }
              }
            },
            "description": "OK",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          },
          "400": {
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            },
            "description": "Bad Request",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
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
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/ProblemJson"
                }
              }
            },
            "description": "Service unavailable",
            "headers": {
              "X-Request-Id": {
                "description": "This header identifies the call",
                "schema": {
                  "type": "string"
                }
              }
            }
          }
        },
        "security": [
          {
            "ApiKey": []
          },
          {
            "Authorization": []
          }
        ],
        "summary": "Return OK if application is started",
        "tags": [
          "Home"
        ]
      },
      "parameters": [
        {
          "description": "This header identifies the call, if not passed it is self-generated. This ID is returned in the response.",
          "in": "header",
          "name": "X-Request-Id",
          "schema": {
            "type": "string"
          }
        }
      ]
    },
    "/*": {
      "get": {
        "summary": "Retrieve mock response with GET method",
        "operationId": "get",
        "responses": {
          "200": {
            "description": ""
          }
        }
      },
      "post": {
        "summary": "Retrieve mock response with POST method",
        "operationId": "post",
        "responses": {
          "200": {
            "description": ""
          }
        }
      },
      "put": {
        "summary": "Retrieve mock response with PUT method",
        "operationId": "put",
        "responses": {
          "200": {
            "description": ""
          }
        }
      },
      "delete": {
        "summary": "Retrieve mock response with DELETE method",
        "operationId": "del",
        "responses": {
          "200": {
            "description": ""
          }
        }
      },
      "head": {
        "summary": "Retrieve mock response with HEAD method",
        "operationId": "head",
        "responses": {
          "200": {
            "description": ""
          }
        }
      },
      "options": {
        "summary": "Retrieve mock response with OPTIONS method",
        "operationId": "opt",
        "responses": {
          "200": {
            "description": ""
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "AppInfo": {
        "type": "object",
        "properties": {
          "environment": {
            "type": "string"
          },
          "name": {
            "type": "string"
          },
          "version": {
            "type": "string"
          },
          "dbConnection": {
            "type": "string"
          },
          "redisConnection": {
            "type": "string"
          }
        }
      },
      "ProblemJson": {
        "type": "object",
        "properties": {
          "detail": {
            "type": "string",
            "description": "A human readable explanation specific to this occurrence of the problem.",
            "example": "There was an error processing the request"
          },
          "status": {
            "maximum": 600,
            "minimum": 100,
            "type": "integer",
            "description": "The HTTP status code generated by the origin server for this occurrence of the problem.",
            "format": "int32",
            "example": 200
          },
          "title": {
            "type": "string",
            "description": "A short, summary of the problem type. Written in english and readable for engineers (usually not suited for non technical stakeholders and not localized); example: Service Unavailable"
          }
        }
      }
    },
    "securitySchemes": {
      "ApiKey": {
        "description": "The API key to access this function app.",
        "in": "header",
        "name": "Ocp-Apim-Subscription-Key",
        "type": "apiKey"
      },
      "Authorization": {
        "bearerFormat": "JWT",
        "description": "JWT token get after Azure Login",
        "scheme": "bearer",
        "type": "http"
      }
    }
  }
}
