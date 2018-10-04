#include "stdafx.h"
#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <map>
#include <algorithm>

using namespace std;

const int SIDES_AMOUNT = 3;
const int ARGS_AMOUNT = 4;

bool CheckArgsQuantity(int &argc);
void DetermineTriangleType(vector <string> &sides);
bool CheckFailedChars(vector <string> &sides, vector <double> &sideValues);
void GetTriangleType(vector <double> &sideValues);

int main(int argc, char* argv[])
{
	setlocale(LC_ALL, "rus");
	if (CheckArgsQuantity(argc))
	{
		vector <string> sides;
		for (size_t i = 1; i < 4; i++)
		{
			sides.push_back(argv[i]);
		}
		DetermineTriangleType(sides);
	}
	else
	{
		cout << "Количество введенных параметров не соотретствует треугольнику" << endl;
	}
}

bool CheckArgsQuantity(int &argc)
{
	if (argc == ARGS_AMOUNT)
	{
		return true;
	}
	else if (argc != ARGS_AMOUNT)
	{
		return false;
	}
}

void DetermineTriangleType(vector <string> &sides)
{
	vector <double> sideValues;
	if (CheckFailedChars(sides, sideValues) == true)
	{
		cout << "Неверно введены стороны треугольника" << endl;
	}
	else
	{
		GetTriangleType(sideValues);
	}
}

bool CheckFailedChars(vector <string> &sides, vector <double> &sideValues)
{
	for (auto &elem : sides)
	{
		replace(elem.begin(), elem.end(), ',', '.');
		int dots = count(elem.begin(), elem.end(), '.');
		
		if (dots <= 1)
		{
			if (dots != elem.size())
			{
				for (size_t i = 0; i < elem.size(); i++)
				{
					if ((elem[i] == '-' || elem[i] == '+') && i != 0)
					{
						return true;
					}

					else if ((elem[i] - '0' > 9 || elem[i] - '0' < 0) && elem[i] != '-' && elem[i] != '+' && elem[i] != '.')
					{
						return true;
					}
				}
				stringstream ss;
				double value;
				ss << elem;
				ss >> value;
				sideValues.push_back(value);
			}
			else
			{
				return true;
			}
		}
		else 
		{
			return true;
		}
	}
	return false;
}

void GetTriangleType(vector <double> &sideValues)
{
	double a = sideValues[0], b = sideValues[1], c = sideValues[2];

	if ((a < b + c) && (b < a + c) && (c < a + b))
	{
		if (a == b && b == c && c == a)
		{
			cout << "Равносторонний" << endl;
		}
		else if (a == b || a == c || b == c)
		{
			cout << "Равнобедренный" << endl;
		}
		else
		{
			cout << "Обычный" << endl;
		}
	}
	else
	{
		cout << "Не треугольник" << endl;
	}
}