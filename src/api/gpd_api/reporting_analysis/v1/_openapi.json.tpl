{
  "openapi": "3.0.0",
  "info": {
    "title": "Reporting Analysis - GPD",
    "version": "1.0.0"
  },
  "servers": [
    {
      "url": "http://localhost:7071"
    }
  ],
  "paths": {
    "/api/organizations/{organizationId}/reportings": {
      "get": {
        "tags": [
          "Organization Requests"
        ],
        "summary": "getFlowList",
        "parameters": [
          {
            "name": "organizationId",
            "in": "path",
            "schema": {
              "type": "string"
            },
            "required": true,
            "example": "90000000000"
          }
        ],
        "responses": {
          "200": {
            "description": "Successful response",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/FlowList"
                }
              }
            }
          },
          "400": {
            "description": "Error response",
            "content": {
              "application/json": {}
            }
          }
        }
      }
    },
    "/api/organizations/{organizationId}/reportings/{flowId}/date/{date}": {
      "get": {
        "tags": [
          "Organization Requests"
        ],
        "summary": "getFlow",
        "parameters": [
          {
            "name": "organizationId",
            "in": "path",
            "schema": {
              "type": "string"
            },
            "required": true,
            "example": "90000000000"
          },
          {
            "name": "flowId",
            "in": "path",
            "schema": {
              "type": "string"
            },
            "required": true,
            "example": "2022-01-12PPAYITR1XXX-S239349322"
          },
          {
            "name": "date",
            "in": "path",
            "schema": {
              "type": "string"
            },
            "required": true,
            "example": "2022-01-11T23:31:05"
          }
        ],
        "responses": {
          "200": {
            "description": "Successful response",
            "content": {
              "application/xml": {
                "schema": {
                  "format": "binary",
                  "type": "string",
                  "description": "Flow XML"
                }
              }
            }
          },
          "404": {
            "description": "Not Found",
            "content": {
              "application/json": {}
            }
          }
        }
      }
    }
  },
  "components": {
    "schemas": {
      "FlowList": {
        "type": "array",
        "items": {
          "$ref": "#/components/schemas/Flow"
        }
      },
      "Flow": {
        "type": "object",
        "properties": {
          "flowId": {
            "type": "string",
            "example": "2022-01-12PPAYITR1XXX-S079177254"
          },
          "flowDate": {
            "type": "string",
            "example": "2022-01-12T00:31:05"
          }
        }
      }
    }
  }
}
