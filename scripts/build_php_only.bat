@setlocal EnableDelayedExpansion
@set currentDir=%cd%

php %currentDir%/build

@echo.
@echo Building finished.
@echo.

@pause