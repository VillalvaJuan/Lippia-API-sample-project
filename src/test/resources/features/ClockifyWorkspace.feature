Feature: Workspace
  COMO usuario de Clockify
  QUIERO ver las configuraciones de mi Worckspace
  PARA llevar un buen control de mis horas de trabajo y el de mis empleados

  Scenario Outline: Consulta Workspace resultado exitoso
    Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then Obtengo los datos de mi Workspace
    @Workspace
    Examples:
      | operation | entity    | jsonName     | status |
      | GET       | WORKSPACE | workspace/rq | 200    |

  Scenario Outline: Consulta Workspace resultado erroneo
    Given X-Api-Key invalido
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    @Workspace
    Examples:
      | operation | entity | jsonName     | status |
      | GET       | ERROR  | workspace/rq | 401    |


  Scenario Outline: Consulta projects
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se valida que el id no sea null
    @Workspace
    Examples:
      | operation | entity  | jsonName   | status |
      | GET       | PROJECT | project/rq | 200    |

  @prueba
  Scenario Outline: Consulta projects
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se obtuvo el response esperado en <entity> con el <response>
    @Workspace
    Examples:
      | operation | entity | jsonName       | response       | status |
      | GET       | ERROR  | project/rq_401 | project/rs_401 | 401    |