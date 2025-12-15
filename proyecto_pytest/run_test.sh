#!/bin/bash
 
echo "activando el entorno virtual"
if [ ! -d "venv" ]; then
    echo "sino existe el entorno virtual, se crea"
    python3 -m venv venv
fi

#Creacion directorio para reportes

#mkdir -p reports 
mkdir ../reports


#if [ -f "venv/bin/activate" ]; then
#    source venv/bind/activate
#elif [ -f "venv/Scripts/activate" ]; then #para windows
    cd venv/Scripts
    source activate
#else
 #   echo "NO se pudo activar el entorno virtual."
 #   exit 1
#fi

echo "Instando dependencias"
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

echo "Ejecutando pruebas con Pytest y generar reportes"
venv/bin/python -m pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-reports.html --self-contained-html

echo "pruebas finalizadas, resultados en reportes"