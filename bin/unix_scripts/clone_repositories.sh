#!/bin/bash
SCRIPT=$(readlink -f "$0")


SCRIPTPATH=$(dirname "$SCRIPT") # /daphne/bin/unix_scripts
BINDIR=${SCRIPTPATH::-13}       # /daphne/bin
ROOTDIR=${SCRIPTPATH::-17}      # /daphne
CODEDIR="${ROOTDIR}/daphne"     # /daphne/daphne

# Repo Paths
VASSARSERVER="${CODEDIR}/VASSAR_server"
VASSARLIB="${CODEDIR}/VASSAR_lib"
SYSARCHPROBLEMS="${CODEDIR}/SystemArchitectureProblems"
OREKIT="${CODEDIR}/orekit"
VASSARRESOURCES="${CODEDIR}/VASSAR_resources"
DAPHNEBRAIN="${CODEDIR}/daphne_brain"
COMMANDCLASSIFIER="${CODEDIR}/command_classifier"
HISTORICALDB="${CODEDIR}/historical_db"
DATAMINING="${CODEDIR}/data-mining"
MOPAOS="${CODEDIR}/mopAOS"
DAPHNEINTERFACE="${CODEDIR}/daphne-interface"
JAVALIBS="${CODEDIR}/java_libs"


# ---------------------------------------------------- Git Check
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    echo "Git is not installed... exiting"
    exit
else
    echo "Git found..."
fi


# ----------------------------------------------------- Main Repo Check
if [ -d "$CODEDIR" ]; then
    echo "Daphne directory exists"
    cd "$CODEDIR" || exit
else
    echo "Creating daphne directory"
    mkdir "$CODEDIR"
    cd "$CODEDIR" || exit
fi

# ----------------------------------------------------- Clone Repos
if [ -d "$VASSARSERVER" ]; then
    echo "VASSAR_server exists"
else
    echo "VASSAR_server not found... cloning"
    git clone https://github.com/seakers/VASSAR_server.git

    # --- Checkout temporary fix branch ------------------------------------------------
    cd VASSAR_server || exit
    git checkout working_patch
    cd "$CODEDIR" || exit
fi

# $VASSARLIB
if [ -d "$VASSARLIB" ]; then
    echo "VASSAR_lib exists"
else
    echo "VASSAR_lib not found... cloning"
    git clone https://github.com/seakers/VASSAR_lib.git

    # --- Checkout temporary fix branch ------------------------------------------------
    cd VASSAR_lib || exit
    git checkout working_patch
    cd "$CODEDIR" || exit
fi

# $SYSARCHPROBLEMS master
if [ -d "$SYSARCHPROBLEMS" ]; then
    echo "SystemArchitectureProblems exists"
else
    echo "SystemArchitectureProblems not found... cloning"
    git clone https://github.com/seakers/SystemArchitectureProblems.git
fi

# $OREKIT master
if [ -d "$OREKIT" ]; then
    echo "orekit exists"
else
    echo "orekit not found... cloning"
    git clone https://github.com/seakers/orekit.git
fi

# $VASSARRESOURCES master
if [ -d "$VASSARRESOURCES" ]; then
    echo "VASSAR_resources exists"
else
    echo "VASSAR_resources not found... cloning"
    git clone https://github.com/seakers/VASSAR_resources.git
fi

# $DAPHNEBRAIN master
if [ -d "$DAPHNEBRAIN" ]; then
    echo "daphne_brain exists"
else
    echo "daphne_brain not found... cloning"
    git clone https://github.com/seakers/daphne_brain.git
fi

# $COMMANDCLASSIFIER master
if [ -d "$COMMANDCLASSIFIER" ]; then
    echo "command_classifier exists"
else
    echo "command_classifier not found... cloning"
    git clone https://github.com/seakers/command_classifier.git
fi

# $HISTORICALDB master
if [ -d "$HISTORICALDB" ]; then
    echo "historical_db exists"
else
    echo "historical_db not found... cloning"
    git clone https://github.com/seakers/historical_db.git
fi

# $DATAMINING master
if [ -d "$DATAMINING" ]; then
    echo "data-mining exists"
else
    echo "data-mining not found... cloning"
    git clone https://github.com/seakers/data-mining.git
fi

# mopAOS develop
if [ -d "$MOPAOS" ]; then
    echo "VASSAR_server exists"
else
    echo "VASSAR_server not found... cloning"
    git clone https://github.com/seakers/mopAOS.git

    # --- Checkout temporary fix branch ------------------------------------------------
    cd mopAOS || exit
    git checkout develop
    cd "$CODEDIR" || exit
fi

# $DAPHNEINTERFACE master
if [ -d "$DAPHNEINTERFACE" ]; then
    echo "daphne-interface exists"
else
    echo "daphne-interface not found... cloning"
    git clone https://github.com/seakers/daphne-interface.git
fi

# $JAVALIBS master
if [ -d "$JAVALIBS" ]; then
    echo "java_libs exists"
else
    echo "java_libs not found... creating"
    mkdir "$JAVALIBS"
fi
