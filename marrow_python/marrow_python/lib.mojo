"""Python module entry point for marrow."""

from std.os import abort
from std.python import PythonObject
from std.python.bindings import PythonModuleBuilder
from marrow_python.dtypes import add_to_module as add_dtypes
from marrow_python.arrays import add_to_module as add_arrays
from marrow_python.scalars import add_to_module as add_scalars
from marrow_python.compute import add_to_module as add_compute
from marrow_python.schema import add_to_module as add_schema
from marrow_python.tabular import add_to_module as add_tabular


@export
def PyInit_marrow() -> PythonObject:
    try:
        var m = PythonModuleBuilder("marrow")
        add_dtypes(m)
        add_scalars(m)
        add_arrays(m)
        add_compute(m)
        add_schema(m)
        add_tabular(m)
        return m.finalize()
    except e:
        abort(String("error creating Python Mojo module:", e))
