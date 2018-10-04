rem @echo off
set program="%1"
if program=="" goto err
set /a x=1

:1
set /a x+=1
echo Test 1: > testResult.txt
echo %program% >> testResult.txt
%program% >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe
if ERRORLEVEL 1 goto testFailed

:2
set /a x+=1
echo Test 2: >> testResult.txt
echo %program% 17 8 -8 >> testResult.txt
%program% 17 8 -8 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 8 -8
if ERRORLEVEL 1 goto testFailed

:3
set /a x+=1
echo Test 3: >> testResult.txt
echo %program% 17 16.5 15.7.89 >> testResult.txt
%program% 17 16.5 15.7.89 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 16.5 15.7.89
if ERRORLEVEL 1 goto testFailed

:4
set /a x+=1
echo Test 4: >> testResult.txt
echo %program% 17 16-5 15.7.89 >> testResult.txt
%program% 17 16-5 15.7.89 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 16-5 15.7.89
if ERRORLEVEL 1 goto testFailed

:5
set /a x+=1
echo Test 5: >> testResult.txt
echo %program% 17 16.5 ... >> testResult.txt
%program% 17 16.5 ... >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 16.5 ...
if ERRORLEVEL 1 goto testFailed

:6
set /a x+=1
echo Test 6: >> testResult.txt
echo %program% 17 16.5 , >> testResult.txt
%program% 17 16.5 , >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 16.5 ,
if ERRORLEVEL 1 goto testFailed

:7
set /a x+=1                    
echo Test 7: >> testResult.txt
echo %program% 17 10.5 8.85 1000 >> testResult.txt
%program% 17 10.5 8.85 1000 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 10.5 8.85 1000
if ERRORLEVEL 1 goto testFailed

:8
set /a x+=1
echo Test 8: >> testResult.txt
echo %program% 17 2.5 8.77 >> testResult.txt
%program% 17 2.5 8.77 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 2.5 8.77
if ERRORLEVEL 1 goto testFailed

:9
set /a x+=1
echo Test 9: >> testResult.txt
echo %program% 13 13 13 >> testResult.txt
%program% 13 13 13 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 13 13 13
if ERRORLEVEL 1 goto testFailed

:10
set /a x+=1
echo Test 10: >> testResult.txt
echo %program% 17 16 15 >> testResult.txt
%program% 17 16 15 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 16 15
if ERRORLEVEL 1 goto testFailed

:11
set /a x+=1
echo Test 11: >> testResult.txt
echo %program% 15 16 15 >> testResult.txt
%program% 15 16 15 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 15 16 15
if ERRORLEVEL 1 goto testFailed

:12
set /a x+=1
echo Test 12: >> testResult.txt
echo %program% 15 0 0 >> testResult.txt
%program% 15 0 0 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 15 0 0
if ERRORLEVEL 1 goto testFailed

:13
set /a x+=1
echo Test 13: >> testResult.txt
echo %program% 17 3*2 8 >> testResult.txt
%program% 17 3*2 8 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 3*2 8
if ERRORLEVEL 1 goto testFailed

:14
set /a x+=1
echo Test 14: >> testResult.txt
echo %program% 17 a 8 >> testResult.txt
%program% 17 a 8 >> testResult.txt
if ERRORLEVEL 1 goto testFailed
triangle.exe 17 a 8
if ERRORLEVEL 1 goto testFailed

exit /B

:testFailed
echo Testing failed >>testResult.txt
if not %x%==15 goto %x% else exit /B

:err
echo Usage: test.bat <Path to program> 