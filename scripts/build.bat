@setlocal EnableDelayedExpansion
@set currentDir=%cd%

@cd ..
git clone https://github.com/jshttp/mime-db.git

@timeout 1
@cd ./mime-db

call npm install --dev
@timeout 1

call npm install gnode
@timeout 1

call npm run fetch
@timeout 1

call npm run build
@timeout 1

@cd ../scripts
php %currentDir%/build.phpt

@echo.
@echo Building finished.
@echo.

@pause