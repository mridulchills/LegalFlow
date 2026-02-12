#!/bin/bash

echo ""
echo "System:"
lsb_release -d 2>/dev/null | cut -f2 || echo "OS: Unknown"

echo ""
echo "Python:"
python3 --version

echo ""
echo "Pip:"
pip3 --version

echo ""
echo "Node:"
node -v 2>/dev/null || echo "Node not installed"

echo ""
echo "NPM:"
npm -v 2>/dev/null || echo "NPM not installed"

echo ""
echo "Git:"
git --version 2>/dev/null || echo "Git not installed"

echo ""
echo "PostgreSQL:"
psql --version 2>/dev/null || echo "PostgreSQL not installed"

echo ""
echo "VS Code:"
code --version 2>/dev/null | head -n 1 || echo "VS Code not installed"

echo ""
echo "Virtual Environment:"
if [ -d "Backend/venv" ]; then
    source Backend/venv/bin/activate
    pip show fastapi 2>/dev/null | grep Version || echo "FastAPI not installed in venv"
    pip show sentence-transformers 2>/dev/null | grep Version || echo "sentence-transformers not installed in venv"
    pip show faiss-cpu 2>/dev/null | grep Version || echo "FAISS not installed in venv"
    pip show networkx 2>/dev/null | grep Version || echo "NetworkX not installed in venv"
    pip show asyncpg 2>/dev/null | grep Version || echo "asyncpg not installed in venv"
    deactivate
else
    echo "No virtual environment detected."
fi

echo ""

