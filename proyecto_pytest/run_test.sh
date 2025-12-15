#!/bin/bash
 
echo "activando el entorno virtual"
if [ ! -d "venv" ]; then
    echo "sino existe el entorno virtual, se crea"
    python3 -m venv venv
fi

echo "Activando el entorno virtual correctamente"
if [ -f "venv/bin/activate" ]; then
    source venv/bind/activate
elif [ -f "venv/Scripts/activate" ]; then #para windows
    source venv/Scripts/activate
else
    echo "NO se pudo activar el entorno virtual."
    exit 1
fi

echo "Instando dependencias"
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

echo "Ejecutando pruebas con Piptest y generar reportes"
pytest tests/ --junitxml=reports/test-result.xml --html=reports/test-results.html --self-contained-html

echo "pruebas finalizadas, resultados en reportes"