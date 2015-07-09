using System;
using System.Collections.Generic;

public class Sum
{
    public static long Summation(long max)
    {
        long sum = 0;
        for (long i = 1; i <= max; i++)
        {
            sum += i;
        }
        return sum;
    }

    // Find the sum of all the primes below two million.
    public static long PrimesBelow(long max)
    {
        long sum = 0;

        for (long i = 0; i < max; i++)
        {
            if(Check.IsPrime(i))
            {
                sum += i;
            }
        }

        return sum;
    }

    public static int Multiples(int a, int b, int max) // 'a' and 'b' are the multiples
    {
        int sum = 0;

        for (int i = 0; i < max; i++)
        {
            if (i % a == 0 || i % b == 0)
            {
                sum += i;
            }
        }
        return sum;
    }

    public static int Fibonacci(int max)
    {
        int sum = 0;
        int val1 = 1;
        int val2 = 1;
        int nextVal = val1 + val2;

        while (nextVal < max)
        {
            val1 = val2;
            val2 = nextVal;

            if (nextVal % 2 == 0)
            {
                sum += nextVal;
            }

            nextVal = val1 + val2;
        }

        return sum;
    }
}

public class Product
{
    // Find the thirteen adjacent digits in the 1000-digit number that have the greatest product.
    // What is the value of this product?
    public static long AdjacentDigits(String strNum, int count)
    {
        long product = 0;
        for (int i = 0; i < strNum.Length - count; i++)
        {
            long tempProduct = 1;
            for (int j = i; j < count + i; j++)
            {
                long num = Convert.ToInt64(strNum[j].ToString());
                tempProduct *= num;
            }
            if (tempProduct > product)
            {
                product = tempProduct;
            }
        }
        return product;
    }

    //A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
    //For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
    //There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.
    public static double PythagoreanProduct(double sum)
    {
        double a = 1, b = 1, c = 0;

        while (a <= (sum - b - c))
        {
            while (b <= (sum - a - c))
            {
                c = Math.Sqrt((Math.Pow(a, 2) + Math.Pow(b, 2)));
                if ((a + b + c) == sum)
                {
                    if (a < b && b < c)
                    {
                        return a * b * c;
                    }
                }
                b++;
            }
            b = 0;
            a++;
        }
        return -1;
    }
}

public class Max
{
    public static long PrimeFactors(long val)
    {
        long max = 0;
        long tempVal = val;
        for (long i = 1; i < tempVal; i++)
        {
            if ((val != i) && (tempVal % i == 0) && (Check.IsPrime(i)))
            {
                max = i;
                tempVal = val/i;
            }
        }
        return max;
    }

    // Find the largest palindrome made from the product of two 3-digit numbers.
    public static long PalindromeProduct(int digits)
    {
        int maxVal = 0;

        for (int i = 0; i < digits; i++)
        {
            maxVal += (9 * (int) Math.Pow(10,i));
        }

        int a = maxVal;
        int b = maxVal;
        long tempProduct = 0;
        long maxProduct = 0;

        while (a > 0)
        {
            while (b > 0)
            {
                String product = (a * b).ToString();
                if (Check.IsPalindrome(product))
                {
                    tempProduct = Convert.ToInt64(product);
                    if(tempProduct > maxProduct)
                    {
                        maxProduct = tempProduct;
                    }
                }
                b--;
            }
            b = maxVal;
            a--;
        }
        return maxProduct;
    }

    // What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?
    public static long ProductInGrid(int[] grid, int rowLength)
    {
        long product = 0;



        return product;
    }
}

public class Min
{
    // What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    public static double Divisible (long max)
    {
        long val = max;
        bool processing = true;

        // count up by max to try and find the target number
        while (processing == true)
        {
            bool divCheck = true;
            // make sure val is divisible by all of the numbers between 1 and the max number
            for (long i = 1; i <= max; i++)
            {
                if (val%i != 0)
                {
                    divCheck = false;
                }

                if (divCheck && i == max)
                {
                    processing = false;
                }
            }
            val += max;
        }
        return val - max;
    }
}

public class Diff
{
    public static double Powers(long max)
    {
        double powerOfSums = Math.Pow(Sum.Summation(max), 2);
        double sumOfPowers = 0;
        for (long i = 1; i <= max; i++)
        {
            sumOfPowers += Math.Pow(i, 2);
        }

        return powerOfSums - sumOfPowers;
    }
}

public class Find
{
    // Find the 10001st prime
    public static long Prime(long numPrime)
    {
        long targetPrime = 0;
        long count = 0;
        for(long i = 0; count < numPrime; i++)
        {
            if (Check.IsPrime(i))
            {
                count++;
                targetPrime = i;
            }
        }
        return targetPrime;
    }
}

public class Check
{
    public static List<int> SplitInt(int val)
    {
        List<int> inputDigits = new List<int>();

        int tempVal = val;
        while (tempVal > 0)
        {
            inputDigits.Add(tempVal % 10);
            tempVal /= 10;
        }

        return inputDigits;
    }

    public static bool IsPrime(long val)
    {
        if (val == 1)
        {
            return false;
        }
        if (val == 2 || val == 3)
        {
            return true;
        }
        if (val % 2 == 0)
        {
            return false;
        }
        if (val % 3 == 0)
        {
            return false;
        }
        if ((val + 1) % 6 == 0 || (val - 1) % 6 == 0 || val % 2 != 0 || val % 3 != 0)
        {
            int sqrtVal = (int)Math.Ceiling(Math.Sqrt(val));
            for (int i = 5; i <= sqrtVal; i++)
            {
                if (i % 2 == 0 || i % 3 == 0)
                {
                    continue;
                }
                if (val % i == 0)
                {
                    return false;
                }
            }
        }
        else
        {
            return false;
        }
        return true;
    }

    public static bool IsPalindrome(String val)
    {
        //cut the string in half and compare the first with the second
        for (int i = 0; i < val.Length / 2; i++)
        {
            if (val[i] != val[(val.Length - 1) - i])
            {
                return false;
            }
        }
        return true;
    }
}

public class Program
{
    public static void Main()
    {
        //Console.WriteLine(Sum.Multiples(3,5,1000));
        //Console.WriteLine(Sum.Fibonacci(4000000));
        //Console.WriteLine(Max.PrimeFactors(600851475143));
        //Console.WriteLine(Max.PalindromeProduct(3));
        //Console.WriteLine(Min.Divisible(20));
        //Console.WriteLine(Diff.Powers(100));
        //Console.WriteLine(Find.Prime(10001));
        //Console.WriteLine(Product.AdjacentDigits("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450", 13));
        //Console.WriteLine(Product.PythagoreanProduct(1000));
        //Console.WriteLine(Sum.PrimesBelow(2000000));
        int[] grid = {08, 02, 22, 97, 38, 15, 00, 40, 00, 75, 04, 05, 07, 78, 52, 12, 50, 77, 91, 08, 49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00, 81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 03, 49, 13, 36, 65, 52, 70, 95, 23, 04, 60, 11, 42, 69, 24, 68, 56, 01, 32, 56, 71, 37, 02, 36, 91, 22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80, 24, 47, 32, 60, 99, 03, 45, 02, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50, 32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70, 67, 26, 20, 68, 02, 62, 12, 20, 95, 63, 94, 39, 63, 08, 40, 91, 66, 49, 94, 21, 24, 55, 58, 05, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72, 21, 36, 23, 09, 75, 00, 76, 44, 20, 45, 35, 14, 00, 61, 33, 97, 34, 31, 33, 95, 78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 03, 80, 04, 62, 16, 14, 09, 53, 56, 92, 16, 39, 05, 42, 96, 35, 31, 47, 55, 58, 88, 24, 00, 17, 54, 24, 36, 29, 85, 57, 86, 56, 00, 48, 35, 71, 89, 07, 05, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58, 19, 80, 81, 68, 05, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 04, 89, 55, 40, 04, 52, 08, 83, 97, 35, 99, 16, 07, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66, 88, 36, 68, 87, 57, 62, 20, 72, 03, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69, 04, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 08, 46, 29, 32, 40, 62, 76, 36, 20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 04, 36, 16, 20, 73, 35, 29, 78, 31, 90, 01, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 05, 54, 01, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 01, 89, 19, 67, 48};
        Console.WriteLine(Max.ProductInGrid(grid, 20));
        int done = Console.Read();
    }
}
