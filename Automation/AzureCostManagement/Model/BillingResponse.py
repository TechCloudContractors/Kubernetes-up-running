from enum import Enum
from typing import List, Union
from uuid import UUID


class TypeEnum(Enum):
    ARRAY = "Array"
    NUMBER = "Number"
    STRING = "String"


class Column:
    name: str
    type: TypeEnum

    def __init__(self, name: str, type: TypeEnum) -> None:
        self.name = name
        self.type = type


class Properties:
    next_link: None
    columns: List[Column]
    rows: List[List[Union[List[str], float, str]]]

    def __init__(self, next_link: None, columns: List[Column], rows: List[List[Union[List[str], float, str]]]) -> None:
        self.next_link = next_link
        self.columns = columns
        self.rows = rows


class BillingResponse:
    id: str
    name: UUID
    type: str
    location: None
    sku: None
    eTag: None
    properties: Properties

    def __init__(self, id: str, name: UUID, type: str, location: None, sku: None, eTag: None, properties: Properties) -> None:
        self.id = id
        self.name = name
        self.type = type
        self.location = location
        self.sku = sku
        self.eTag = eTag
        self.properties = properties
