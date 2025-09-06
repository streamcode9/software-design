using System;

class Program
{
    static void Main(string[] args)
    {
        if (args.Length < 1)
        {
            Console.WriteLine("Please provide an argument.");
            return;
        }

        Console.WriteLine($"Argument: {args[0]}");
    }
}
