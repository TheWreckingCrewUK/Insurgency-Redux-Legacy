@ECHO OFF

echo Making hard junction links to insurgency core within mission folders...

for /d %%i in (*) do (
	IF /I "%%i" == "Insurgency_Core" (
		echo Skipping Insurgency_Core...
	) else (
		IF /I "%%i" == "tools" (
			echo Skipping Tools...
		) else (
			echo Adding Insurgency_Core to %%i
			mklink /j ".\%%i\Insurgency_Core" ".\Insurgency_Core\"
		)
	)
)

PAUSE