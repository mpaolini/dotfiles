refresh_virtualenvs() {
    if [ ! -d "$1" ]; then
	echo "refresh_virtualenvs <base-dir>" >&2
    else
	find "$1" -maxdepth 2 -mindepth 2 -type f -name setup.py -execdir bash -c "pwd ; ( [ -d virtual ] || python -m venv virtual ) ; virtual/bin/pip install -U pip setuptools jedi epc flake8" \;
    fi
}
