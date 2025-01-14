{
  "openapi" : "3.0.1",
  "info" : {
    "title" : "PagoPA API Debt Position for Organizations",
    "description" : "Progetto Gestione Posizioni Debitorie",
    "termsOfService" : "https://www.pagopa.gov.it/",
    "version" : "0.6.14"
  },
  "servers" : [ {
    "url" : "${host}",
    "description" : "Generated server url"
  } ],
  "tags" : [ {
    "name" : "Debt Positions API"
  }, {
    "name" : "Debt Position Actions API"
  } ],
  "paths" : {
    "/organizations/{organizationfiscalcode}/debtpositions/{iupd}" : {
      "get" : {
        "tags" : [ "Debt Positions API" ],
        "summary" : "Return the details of a specific debt position.",
        "operationId" : "getOrganizationDebtPositionByIUPD",
        "parameters" : [ {
          "name" : "organizationfiscalcode",
          "in" : "path",
          "description" : "Organization fiscal code, the fiscal code of the Organization.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "iupd",
          "in" : "path",
          "description" : "IUPD (Unique identifier of the debt position). Format could be `<Organization fiscal code + UUID>` this would make it unique within the new PD management system. It's the responsibility of the EC to guarantee uniqueness. The pagoPa system shall verify that this is `true` and if not, notify the EC.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        } ],
        "responses" : {
          "404" : {
            "description" : "No debt position found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "200" : {
            "description" : "Obtained debt position details.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/PaymentPositionModelBaseResponse"
                }
              }
            }
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      },
      "put" : {
        "tags" : [ "Debt Positions API" ],
        "summary" : "The Organization updates a debt position ",
        "operationId" : "updatePosition",
        "parameters" : [ {
          "name" : "organizationfiscalcode",
          "in" : "path",
          "description" : "Organization fiscal code, the fiscal code of the Organization.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "iupd",
          "in" : "path",
          "description" : "IUPD (Unique identifier of the debt position). Format could be `<Organization fiscal code + UUID>` this would make it unique within the new PD management system. It's the responsibility of the EC to guarantee uniqueness. The pagoPa system shall verify that this is `true` and if not, notify the EC.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "toPublish",
          "in" : "query",
          "required" : false,
          "schema" : {
            "type" : "boolean",
            "default" : false
          }
        } ],
        "requestBody" : {
          "content" : {
            "application/json" : {
              "schema" : {
                "$ref" : "#/components/schemas/PaymentPositionModel"
              }
            }
          },
          "required" : true
        },
        "responses" : {
          "404" : {
            "description" : "No debt position found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "409" : {
            "description" : "Conflict: existing related payment found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "400" : {
            "description" : "Malformed request.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "200" : {
            "description" : "Request updated.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/PaymentPositionModel"
                }
              }
            }
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      },
      "delete" : {
        "tags" : [ "Debt Positions API" ],
        "summary" : "The Organization deletes a debt position",
        "operationId" : "deletePosition",
        "parameters" : [ {
          "name" : "organizationfiscalcode",
          "in" : "path",
          "description" : "Organization fiscal code, the fiscal code of the Organization.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "iupd",
          "in" : "path",
          "description" : "IUPD (Unique identifier of the debt position). Format could be `<Organization fiscal code + UUID>` this would make it unique within the new PD management system. It's the responsibility of the EC to guarantee uniqueness. The pagoPa system shall verify that this is `true` and if not, notify the EC.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        } ],
        "responses" : {
          "200" : {
            "description" : "Operation completed successfully.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "type" : "string"
                }
              }
            }
          },
          "404" : {
            "description" : "No debt position position found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "409" : {
            "description" : "Conflict: existing related payment found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      }
    },
    "/organizations/{organizationfiscalcode}/debtpositions" : {
      "get" : {
        "tags" : [ "Debt Positions API" ],
        "summary" : "Return the list of the organization debt positions. The due dates interval is mutually exclusive with the payment dates interval.",
        "operationId" : "getOrganizationDebtPositions",
        "parameters" : [ {
          "name" : "organizationfiscalcode",
          "in" : "path",
          "description" : "Organization fiscal code, the fiscal code of the Organization.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "limit",
          "in" : "query",
          "description" : "Number of elements on one page. Default = 50",
          "required" : false,
          "schema" : {
            "maximum" : 100,
            "type" : "integer",
            "format" : "int32",
            "default" : 50
          }
        }, {
          "name" : "page",
          "in" : "query",
          "description" : "Page number. Page value starts from 0",
          "required" : true,
          "schema" : {
            "minimum" : 0,
            "type" : "integer",
            "format" : "int32"
          }
        }, {
          "name" : "due_date_from",
          "in" : "query",
          "description" : "Filter from due_date (if provided use the format yyyy-MM-dd). If not provided will be set to 30 days before the due_date_to.",
          "required" : false,
          "schema" : {
            "type" : "string",
            "format" : "date"
          }
        }, {
          "name" : "due_date_to",
          "in" : "query",
          "description" : "Filter to due_date (if provided use the format yyyy-MM-dd). If not provided will be set to 30 days after the due_date_from.",
          "required" : false,
          "schema" : {
            "type" : "string",
            "format" : "date"
          }
        }, {
          "name" : "payment_date_from",
          "in" : "query",
          "description" : "Filter from payment_date (if provided use the format yyyy-MM-dd). If not provided will be set to 30 days before the payment_date_to.",
          "required" : false,
          "schema" : {
            "type" : "string",
            "format" : "date"
          }
        }, {
          "name" : "payment_date_to",
          "in" : "query",
          "description" : "Filter to payment_date (if provided use the format yyyy-MM-dd). If not provided will be set to 30 days after the payment_date_from",
          "required" : false,
          "schema" : {
            "type" : "string",
            "format" : "date"
          }
        }, {
          "name" : "status",
          "in" : "query",
          "description" : "Filter by debt position status",
          "required" : false,
          "schema" : {
            "type" : "string",
            "enum" : [ "DRAFT", "PUBLISHED", "VALID", "INVALID", "EXPIRED", "PARTIALLY_PAID", "PAID", "REPORTED" ]
          }
        }, {
          "name" : "orderby",
          "in" : "query",
          "description" : "Order by INSERTED_DATE, COMPANY_NAME, IUPD or STATUS",
          "required" : false,
          "schema" : {
            "type" : "string",
            "default" : "COMPANY_NAME",
            "enum" : [ "INSERTED_DATE", "IUPD", "STATUS", "COMPANY_NAME" ]
          }
        }, {
          "name" : "ordering",
          "in" : "query",
          "description" : "Direction of ordering",
          "required" : false,
          "schema" : {
            "type" : "string",
            "default" : "DESC",
            "enum" : [ "ASC", "DESC" ]
          }
        } ],
        "responses" : {
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "400" : {
            "description" : "Malformed request.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "200" : {
            "description" : "Obtained all organization payment positions.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/PaymentPositionsInfo"
                }
              }
            }
          },
          "429" : {
            "description" : "Too many requests."
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      },
      "post" : {
        "tags" : [ "Debt Positions API" ],
        "summary" : "The Organization creates a debt Position.",
        "operationId" : "createPosition",
        "parameters" : [ {
          "name" : "organizationfiscalcode",
          "in" : "path",
          "description" : "Organization fiscal code, the fiscal code of the Organization.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "toPublish",
          "in" : "query",
          "required" : false,
          "schema" : {
            "type" : "boolean",
            "default" : false
          }
        } ],
        "requestBody" : {
          "content" : {
            "application/json" : {
              "schema" : {
                "$ref" : "#/components/schemas/PaymentPositionModel"
              }
            }
          },
          "required" : true
        },
        "responses" : {
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "400" : {
            "description" : "Malformed request.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "201" : {
            "description" : "Request created.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/PaymentPositionModel"
                }
              }
            }
          },
          "409" : {
            "description" : "Conflict: duplicate debt position found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      }
    },
    "/organizations/{organizationfiscalcode}/debtpositions/{iupd}/publish" : {
      "post" : {
        "tags" : [ "Debt Position Actions API" ],
        "summary" : "The Organization publish a debt Position.",
        "operationId" : "publishPosition",
        "parameters" : [ {
          "name" : "organizationfiscalcode",
          "in" : "path",
          "description" : "Organization fiscal code, the fiscal code of the Organization.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "iupd",
          "in" : "path",
          "description" : "IUPD (Unique identifier of the debt position). Format could be `<Organization fiscal code + UUID>` this would make it unique within the new PD management system. It's the responsibility of the EC to guarantee uniqueness. The pagoPa system shall verify that this is `true` and if not, notify the EC.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        } ],
        "responses" : {
          "409" : {
            "description" : "Conflict: debt position is not in publishable state.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "404" : {
            "description" : "No debt position found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "200" : {
            "description" : "Request published.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/PaymentPositionModel"
                }
              }
            }
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      }
    },
    "/organizations/{organizationfiscalcode}/debtpositions/{iupd}/invalidate" : {
      "post" : {
        "tags" : [ "Debt Position Actions API" ],
        "summary" : "The Organization invalidate a debt Position.",
        "operationId" : "invalidatePosition",
        "parameters" : [ {
          "name" : "organizationfiscalcode",
          "in" : "path",
          "description" : "Organization fiscal code, the fiscal code of the Organization.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        }, {
          "name" : "iupd",
          "in" : "path",
          "description" : "IUPD (Unique identifier of the debt position). Format could be `<Organization fiscal code + UUID>` this would make it unique within the new PD management system. It's the responsibility of the EC to guarantee uniqueness. The pagoPa system shall verify that this is `true` and if not, notify the EC.",
          "required" : true,
          "schema" : {
            "type" : "string"
          }
        } ],
        "responses" : {
          "409" : {
            "description" : "Conflict: debt position is not in invalidable state.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "404" : {
            "description" : "No debt position found.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          },
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "200" : {
            "description" : "Request published.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/PaymentPositionModel"
                }
              }
            }
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      }
    },
    "/info" : {
      "get" : {
        "tags" : [ "Home" ],
        "summary" : "Return OK if application is started",
        "operationId" : "healthCheck",
        "responses" : {
          "200" : {
            "description" : "OK.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/AppInfo"
                }
              }
            }
          },
          "401" : {
            "description" : "Wrong or missing function key."
          },
          "403" : {
            "description" : "Forbidden."
          },
          "500" : {
            "description" : "Service unavailable.",
            "content" : {
              "application/json" : {
                "schema" : {
                  "$ref" : "#/components/schemas/ProblemJson"
                }
              }
            }
          }
        },
        "security" : [ {
          "ApiKey" : [ ]
        }, {
          "Authorization" : [ ]
        } ]
      }
    }
  },
  "components" : {
    "schemas" : {
      "PaymentOptionModel" : {
        "required" : [ "amount", "dueDate", "isPartialPayment", "iuv" ],
        "type" : "object",
        "properties" : {
          "nav" : {
            "type" : "string",
            "readOnly" : true
          },
          "iuv" : {
            "type" : "string"
          },
          "amount" : {
            "type" : "integer",
            "format" : "int64"
          },
          "description" : {
            "type" : "string"
          },
          "isPartialPayment" : {
            "type" : "boolean"
          },
          "dueDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "retentionDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "fee" : {
            "type" : "integer",
            "format" : "int64"
          },
          "notificationFee" : {
            "type" : "integer",
            "format" : "int64",
            "readOnly" : true
          },
          "transfer" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/TransferModel"
            }
          }
        }
      },
      "PaymentPositionModel" : {
        "required" : [ "companyName", "fiscalCode", "fullName", "iupd", "type" ],
        "type" : "object",
        "properties" : {
          "iupd" : {
            "type" : "string"
          },
          "type" : {
            "type" : "string",
            "enum" : [ "F", "G" ]
          },
          "fiscalCode" : {
            "type" : "string"
          },
          "fullName" : {
            "type" : "string"
          },
          "streetName" : {
            "type" : "string"
          },
          "civicNumber" : {
            "type" : "string"
          },
          "postalCode" : {
            "type" : "string"
          },
          "city" : {
            "type" : "string"
          },
          "province" : {
            "type" : "string"
          },
          "region" : {
            "type" : "string"
          },
          "country" : {
            "pattern" : "[A-Z]{2}",
            "type" : "string"
          },
          "email" : {
            "type" : "string"
          },
          "phone" : {
            "type" : "string"
          },
          "switchToExpired" : {
            "type" : "boolean",
            "description" : "feature flag to enable the debt position to expire after the due date",
            "example" : false,
            "default" : false
          },
          "companyName" : {
            "type" : "string"
          },
          "officeName" : {
            "type" : "string"
          },
          "validityDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "paymentDate" : {
            "type" : "string",
            "format" : "date-time",
            "readOnly" : true
          },
          "status" : {
            "type" : "string",
            "readOnly" : true,
            "enum" : [ "DRAFT", "PUBLISHED", "VALID", "INVALID", "EXPIRED", "PARTIALLY_PAID", "PAID", "REPORTED" ]
          },
          "paymentOption" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/PaymentOptionModel"
            }
          }
        }
      },
      "Stamp" : {
        "required" : [ "hashDocument", "provincialResidence", "stampType" ],
        "type" : "object",
        "properties" : {
          "hashDocument" : {
            "type" : "string",
            "description" : "Document hash"
          },
          "stampType" : {
            "maxLength" : 2,
            "minLength" : 2,
            "type" : "string",
            "description" : "The type of the stamp"
          },
          "provincialResidence" : {
            "pattern" : "[A-Z]{2}",
            "type" : "string",
            "description" : "The provincial of the residence",
            "example" : "RM"
          }
        }
      },
      "TransferModel" : {
        "required" : [ "amount", "category", "idTransfer", "remittanceInformation" ],
        "type" : "object",
        "properties" : {
          "idTransfer" : {
            "type" : "string",
            "enum" : [ "1", "2", "3", "4", "5" ]
          },
          "amount" : {
            "type" : "integer",
            "format" : "int64"
          },
          "organizationFiscalCode" : {
            "type" : "string",
            "description" : "Fiscal code related to the organization targeted by this transfer.",
            "example" : "00000000000"
          },
          "remittanceInformation" : {
            "type" : "string"
          },
          "category" : {
            "type" : "string"
          },
          "iban" : {
            "type" : "string",
            "description" : "mutual exclusive with postalIban and stamp",
            "example" : "IT0000000000000000000000000"
          },
          "postalIban" : {
            "type" : "string",
            "description" : "mutual exclusive with iban and stamp",
            "example" : "IT0000000000000000000000000"
          },
          "stamp" : {
            "$ref" : "#/components/schemas/Stamp"
          }
        }
      },
      "ProblemJson" : {
        "type" : "object",
        "properties" : {
          "title" : {
            "type" : "string",
            "description" : "A short, summary of the problem type. Written in english and readable for engineers (usually not suited for non technical stakeholders and not localized); example: Service Unavailable"
          },
          "status" : {
            "maximum" : 600,
            "minimum" : 100,
            "type" : "integer",
            "description" : "The HTTP status code generated by the origin server for this occurrence of the problem.",
            "format" : "int32",
            "example" : 200
          },
          "detail" : {
            "type" : "string",
            "description" : "A human readable explanation specific to this occurrence of the problem.",
            "example" : "There was an error processing the request"
          }
        }
      },
      "PageInfo" : {
        "required" : [ "items_found", "limit", "page", "total_pages" ],
        "type" : "object",
        "properties" : {
          "page" : {
            "type" : "integer",
            "description" : "Page number",
            "format" : "int32"
          },
          "limit" : {
            "type" : "integer",
            "description" : "Required number of items per page",
            "format" : "int32"
          },
          "items_found" : {
            "type" : "integer",
            "description" : "Number of items found. (The last page may have fewer elements than required)",
            "format" : "int32"
          },
          "total_pages" : {
            "type" : "integer",
            "description" : "Total number of pages",
            "format" : "int32"
          }
        }
      },
      "PaymentOptionModelResponse" : {
        "type" : "object",
        "properties" : {
          "nav" : {
            "type" : "string"
          },
          "iuv" : {
            "type" : "string"
          },
          "organizationFiscalCode" : {
            "type" : "string"
          },
          "amount" : {
            "type" : "integer",
            "format" : "int64"
          },
          "description" : {
            "type" : "string"
          },
          "isPartialPayment" : {
            "type" : "boolean"
          },
          "dueDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "retentionDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "paymentDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "reportingDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "insertedDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "paymentMethod" : {
            "type" : "string"
          },
          "fee" : {
            "type" : "integer",
            "format" : "int64"
          },
          "notificationFee" : {
            "type" : "integer",
            "format" : "int64"
          },
          "pspCompany" : {
            "type" : "string"
          },
          "idReceipt" : {
            "type" : "string"
          },
          "idFlowReporting" : {
            "type" : "string"
          },
          "status" : {
            "type" : "string",
            "enum" : [ "PO_UNPAID", "PO_PAID", "PO_PARTIALLY_REPORTED", "PO_REPORTED" ]
          },
          "lastUpdatedDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "transfer" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/TransferModelResponse"
            }
          }
        }
      },
      "PaymentPositionModelBaseResponse" : {
        "type" : "object",
        "properties" : {
          "iupd" : {
            "type" : "string"
          },
          "organizationFiscalCode" : {
            "type" : "string"
          },
          "type" : {
            "type" : "string",
            "enum" : [ "F", "G" ]
          },
          "companyName" : {
            "type" : "string"
          },
          "officeName" : {
            "type" : "string"
          },
          "insertedDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "publishDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "validityDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "paymentDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "status" : {
            "type" : "string",
            "enum" : [ "DRAFT", "PUBLISHED", "VALID", "INVALID", "EXPIRED", "PARTIALLY_PAID", "PAID", "REPORTED" ]
          },
          "lastUpdatedDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "paymentOption" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/PaymentOptionModelResponse"
            }
          }
        }
      },
      "PaymentPositionsInfo" : {
        "required" : [ "page_info", "payment_position_list" ],
        "type" : "object",
        "properties" : {
          "payment_position_list" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/PaymentPositionModelBaseResponse"
            }
          },
          "page_info" : {
            "$ref" : "#/components/schemas/PageInfo"
          }
        }
      },
      "TransferModelResponse" : {
        "type" : "object",
        "properties" : {
          "organizationFiscalCode" : {
            "type" : "string"
          },
          "idTransfer" : {
            "type" : "string"
          },
          "amount" : {
            "type" : "integer",
            "format" : "int64"
          },
          "remittanceInformation" : {
            "type" : "string"
          },
          "category" : {
            "type" : "string"
          },
          "iban" : {
            "type" : "string"
          },
          "postalIban" : {
            "type" : "string"
          },
          "stamp" : {
            "$ref" : "#/components/schemas/Stamp"
          },
          "insertedDate" : {
            "type" : "string",
            "format" : "date-time"
          },
          "status" : {
            "type" : "string",
            "enum" : [ "T_UNREPORTED", "T_REPORTED" ]
          },
          "lastUpdatedDate" : {
            "type" : "string",
            "format" : "date-time"
          }
        }
      },
      "AppInfo" : {
        "type" : "object",
        "properties" : {
          "name" : {
            "type" : "string"
          },
          "version" : {
            "type" : "string"
          },
          "environment" : {
            "type" : "string"
          }
        }
      }
    },
    "securitySchemes" : {
      "ApiKey" : {
        "type" : "apiKey",
        "description" : "The API key to access this function app.",
        "name" : "Ocp-Apim-Subscription-Key",
        "in" : "header"
      },
      "Authorization" : {
        "type" : "http",
        "description" : "JWT token get after Azure Login",
        "scheme" : "bearer",
        "bearerFormat" : "JWT"
      }
    }
  }
}
