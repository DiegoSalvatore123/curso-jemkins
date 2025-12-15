import pytest

def multiplicar(a,b):
    """function multiplicacion"""
    return a*b

def test_Multiplicacion():
    assert multiplicar(1,2)==2
    assert multiplicar(-1,1)==-1
    assert multiplicar(0,100)==-0

