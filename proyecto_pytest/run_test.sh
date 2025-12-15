#!/bin/bash
echo "activando el entorno virtual"
source vend/bind/activate

echo "activando dependencias"
pip install -r requirements.txt

echo "Ejecutando pruebas con Piptest y generar reportes"
pytest tests/ --junitxml=reports/test-result.xml --html=reports/test-results.html --self-contained-html


echo "pruebas finalizadas, resultados en reportes"