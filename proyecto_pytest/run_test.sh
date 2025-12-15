#!/bin/bash
 
echo "activando el entorno virtual"
if [! -d "venv"]; then
    echo "sino existe el entorno virtual, se crea"
    python3 -m venv venv
fi

source vend/bind/activate

echo "activando dependencias"
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas con Piptest y generar reportes"
pytest tests/ --junitxml=reports/test-result.xml --html=reports/test-results.html --self-contained-html


echo "pruebas finalizadas, resultados en reportes"