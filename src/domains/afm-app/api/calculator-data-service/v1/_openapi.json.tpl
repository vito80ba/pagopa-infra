{
    "openapi": "3.0.1",
    "info": {
        "title": "PagoPA API Calculator Data",
        "description": "Calculator Data microservice for pagoPA AFM",
        "termsOfService": "https://www.pagopa.gov.it/",
        "version": "0.0.1"
    },
    "servers": [
        {
            "url": "${host}",
            "description": "Generated server url"
        }
    ],
    "tags": [
        {
            "name": "Configuration",
            "description": "Everything about Calculator Configuration"
        }
    ],
    "paths": {
        "/configuration": {
            "get": {
                "tags": [
                    "Configuration"
                ],
                "summary": "Get calculator configuration",
                "operationId": "getConfiguration",
                "responses": {
                    "200": {
                        "description": "Created",
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
                                    "$ref": "#/components/schemas/Configuration"
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
                }
            },
            "post": {
                "tags": [
                    "Configuration"
                ],
                "summary": "Save calculator configuration",
                "operationId": "configure",
                "requestBody": {
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/Configuration"
                            }
                        }
                    },
                    "required": true
                },
                "responses": {
                    "201": {
                        "description": "Created",
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
                                    "$ref": "#/components/schemas/Configuration"
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
                    },
                    {
                        "Authorization": []
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
                            "CHECKOUT"
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
            }
        },
        "securitySchemes": {
            "ApiKey": {
                "type": "apiKey",
                "description": "The API key to access this function app.",
                "name": "Ocp-Apim-Subscription-Key",
                "in": "header"
            },
            "Authorization": {
                "type": "http",
                "description": "JWT token get after Azure Login",
                "scheme": "bearer",
                "bearerFormat": "JWT"
            }
        }
    }
}