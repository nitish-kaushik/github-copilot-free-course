using System;

namespace ShapeAreaCalculator;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Welcome to Shape Area Calculator!");

        bool continueCalculating = true;

        while (continueCalculating)
        {
            DisplayMenu();

            Console.Write("Enter your choice (1-4): ");
            string? choice = Console.ReadLine();

            switch (choice)
            {
                case "1":
                    CalculateCircleArea();
                    break;
                case "2":
                    CalculateRectangleArea();
                    Console.WriteLine("Rectangle area calculation - To be implemented");
                    break;
                case "3":
                    // TODO: Calculate triangle area
                    CalculateTriangleArea();
                    break;
                case "4":
                    // TODO: Calculate square area
                    CalculateSquareArea();
                    break;
                    break;
                default:
                    Console.WriteLine("Invalid choice. Please select 1-4.");
                    break;
            }

            Console.WriteLine();
            Console.Write("Do you want to calculate another area? (y/n): ");
            string? continueChoice = Console.ReadLine();
            continueCalculating = continueChoice?.ToLower() == "y" || continueChoice?.ToLower() == "yes";
        }

        Console.WriteLine("Thank you for using Shape Area Calculator!");
    }

    static void DisplayMenu()
    {
        Console.WriteLine("Choose a shape:");
        Console.WriteLine("1. Circle");
        Console.WriteLine("2. Rectangle");
        Console.WriteLine("3. Triangle");
        Console.WriteLine("4. Square");
        Console.WriteLine();
    }

    static void CalculateCircleArea()
    {
        Console.Write("Enter the radius of the circle: ");
        string? radiusInput = Console.ReadLine();

        if (double.TryParse(radiusInput, out double radius) && radius > 0)
        {
            double circleArea = Math.PI * radius * radius;
            Console.WriteLine($"The area of the circle is: {circleArea:F2} square units");
        }
        else
        {
            Console.WriteLine("Invalid input. Please enter a positive number for the radius.");
        }
    }

    // CalculateRectanglArea here
    // CalculateTriangleArea here
    // CalculateSquareArea here
    static void CalculateRectangleArea()
    {
        Console.Write("Enter the length of the rectangle: ");
        string? lengthInput = Console.ReadLine();
        Console.Write("Enter the width of the rectangle: ");
        string? widthInput = Console.ReadLine();

        if (double.TryParse(lengthInput, out double length) && length > 0 &&
            double.TryParse(widthInput, out double width) && width > 0)
        {
            double rectangleArea = length * width;
            Console.WriteLine($"The area of the rectangle is: {rectangleArea:F2} square units");
        }
        else
        {
            Console.WriteLine("Invalid input. Please enter positive numbers for length and width.");
        }
    }

    

}
