@setlocal EnableDelayedExpansion
@set currentDir=%cd%

php %currentDir%/build.phpt

@echo.
@echo Building finished.
@echo.

@pause