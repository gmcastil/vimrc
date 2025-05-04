from typing import Callable, Optional, Union

# Type hints
def greet(name: str) -> Optional[str]:
    return f"Hello, {name}!"

# Union and list hint
def process(items: list[Union[int, str]]) -> None:
    for item in items:
        print(item)

# Callable hint
def with_callback(cb: Callable[[str], None]) -> None:
    cb("Test complete")

# Modern syntax (Python 3.10+)
def handle(val: int | str) -> str:
    match val:
        case int():
            return "Got an int"
        case str():
            return "Got a string"
        case _:
            return "Something else"

# Decorator test
@staticmethod
def static_method(x: int) -> bool:
    return x > 0

# f-string and expression
def debug(x: int):
    print(f"x squared = {x**2}")

