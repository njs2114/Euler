using System;
using System.Collections.Generic;

public class Sum
{
    // Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
    public static long LargeSum(string[] FiftyDigitNums)
    {
        // add all of the n digit numbers (starting with n = 1st digit), save the sum, save the carry, move to the n+1 digit numbers
        int arrayLength = FiftyDigitNums.Length; // number of addends to sum (should be 100)
        int stringLength = FiftyDigitNums.GetValue(0).ToString().Length; // size of each addend string (should be 50)
        List<int> totalSum = new List<int>();

        int sumSize = 0;
        long carry = 0;
        long sum;
        for (int j = 0; j < stringLength; j++) // digit index
        {
            sum = carry;
            for (int i = 0; i < arrayLength; i++) // addend index
            {
                sum += Convert.ToInt64(FiftyDigitNums[i][stringLength - j - 1].ToString());
            }
            carry = sum / 10;
            sum = sum % 10;
            totalSum.Add((int)sum);
            sumSize++;
        }
        String finalSum = carry.ToString();
        int finalSumSize = finalSum.Length;

        while (finalSumSize < 10)
        {
            finalSum = finalSum + totalSum[sumSize-1];
            sumSize--;
            finalSumSize++;
        }

        return Convert.ToInt64(finalSum);
    }

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

    // What is the value of the first triangle number to have over five hundred divisors?
    public static long TriangleNumber(int divisors)
    {
        long triNum = 0;
        long addend = 1;
        int divCount = 0;
        while (divCount < (divisors + 1))
        {
            triNum += addend;
            addend++;
            divCount = Find.NumDivisors(triNum);
        }

        return triNum;
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
    public long mLevels = 0;
    public long mMaxIndex = 0;
    public long mCurrentLevels = 1;

    public static long CollatzRecurse(long val, Max max)
    {
        if( val == 1)
        {
            return max.mCurrentLevels;
        }
        else if( val % 2 == 0)
        {
            max.mCurrentLevels++;
            return CollatzRecurse(val / 2, max);
        }
        else
        {
            max.mCurrentLevels++;
            return CollatzRecurse((3 * val) + 1, max);
        }

    }

    // Which starting number, under one million, produces the longest chain?
    //NOTE this problem is begging to be solved with a tree, too bad I don't feel like rolling my own tree in C# right now
    public static long CollatzSequence(long maxStart)
    {
        Max max = new Max();
        long x;

        for(long i = 1; i < maxStart; i++)
        {
            max.mCurrentLevels = 1;
            x = Max.CollatzRecurse(i, max);
            if(x > max.mLevels)
            {
                max.mLevels = x;
                max.mMaxIndex = i;
                //DEBUG Console.WriteLine(x);
            }
        }
        return max.mMaxIndex;
    }

    public static long LaticeTraversal(long dimensions)
    {
        long paths = 0;

        //TODO create a 2 dimensional array with x and y coordinates
        //      do a node-by-node search on the array

        return paths;
    }

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
        long maxProduct = 0;
        int nearRightBorder = rowLength - 3;
        for (int a = 0; a < grid.Length; a++)
        {
            long product = 1;
            // get right product if within bounds
            if ((a % rowLength) < nearRightBorder)
            {
                product = (int)grid.GetValue(a) * (int)grid.GetValue(a + 1) * (int)grid.GetValue(a + 2) * (int)grid.GetValue(a + 3);
                maxProduct = Math.Max(maxProduct, product);
            }

            // get down product if within bounds
            if (((a / rowLength) % rowLength) < nearRightBorder) //TODO double check this logic and apply to the next two checks
            {
                product = (int)grid.GetValue(a) * (int)grid.GetValue(a + rowLength) * (int)grid.GetValue(a + (rowLength * 2)) * (int)grid.GetValue(a + (rowLength * 3));
                maxProduct = Math.Max(maxProduct, product);
            }

            // get diagonal right product if within bounds
            if ((a % rowLength < nearRightBorder) && (((a / rowLength) % rowLength) < nearRightBorder))
            {
                product = (int)grid.GetValue(a) * (int)grid.GetValue(a + rowLength + 1) * (int)grid.GetValue(a + (rowLength * 2) + 2) * (int)grid.GetValue(a + (rowLength * 3) + 3);
                maxProduct = Math.Max(maxProduct, product);
            }

            // get diagonal left product if within bounds
            if ((a % rowLength > 2) && (((a / rowLength) % rowLength) < nearRightBorder))
            {
                product = (int)grid.GetValue(a) * (int)grid.GetValue(a + rowLength - 1) * (int)grid.GetValue(a + (rowLength * 2) - 2) * (int)grid.GetValue(a + (rowLength * 3) - 3);
                maxProduct = Math.Max(maxProduct, product);
            }
        }
        return maxProduct;
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

    public static int NumDivisors(long val)
    {
        List<long> divisorList = new List<long>();
        divisorList.Add(1);
        divisorList.Add(val);

        long tempVal = val;

        int divisors = 2; // 1 and val
        
        for(int i = 2; i < tempVal; i++)
        {
            if(val%i == 0)
            {
                tempVal = val / i;

                if (!divisorList.Contains(i))
                {
                    divisorList.Add(i);
                    divisors += 1;
                }

                if (!divisorList.Contains(tempVal))
                {
                    divisorList.Add(tempVal);
                    divisors += 1;
                }
            }
        }

        return divisors;
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
        //int[] grid = {08, 02, 22, 97, 38, 15, 00, 40, 00, 75, 04, 05, 07, 78, 52, 12, 50, 77, 91, 08, 49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00, 81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 03, 49, 13, 36, 65, 52, 70, 95, 23, 04, 60, 11, 42, 69, 24, 68, 56, 01, 32, 56, 71, 37, 02, 36, 91, 22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80, 24, 47, 32, 60, 99, 03, 45, 02, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50, 32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70, 67, 26, 20, 68, 02, 62, 12, 20, 95, 63, 94, 39, 63, 08, 40, 91, 66, 49, 94, 21, 24, 55, 58, 05, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72, 21, 36, 23, 09, 75, 00, 76, 44, 20, 45, 35, 14, 00, 61, 33, 97, 34, 31, 33, 95, 78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 03, 80, 04, 62, 16, 14, 09, 53, 56, 92, 16, 39, 05, 42, 96, 35, 31, 47, 55, 58, 88, 24, 00, 17, 54, 24, 36, 29, 85, 57, 86, 56, 00, 48, 35, 71, 89, 07, 05, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58, 19, 80, 81, 68, 05, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 04, 89, 55, 40, 04, 52, 08, 83, 97, 35, 99, 16, 07, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66, 88, 36, 68, 87, 57, 62, 20, 72, 03, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69, 04, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 08, 46, 29, 32, 40, 62, 76, 36, 20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 04, 36, 16, 20, 73, 35, 29, 78, 31, 90, 01, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 05, 54, 01, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 01, 89, 19, 67, 48};
        //Console.WriteLine(Max.ProductInGrid(grid, 20));
        //Console.WriteLine(Sum.TriangleNumber(500));
        //string[] FiftyDigitNumbers = { "37107287533902102798797998220837590246510135740250", "46376937677490009712648124896970078050417018260538", "74324986199524741059474233309513058123726617309629", "91942213363574161572522430563301811072406154908250", "23067588207539346171171980310421047513778063246676", "89261670696623633820136378418383684178734361726757", "28112879812849979408065481931592621691275889832738", "44274228917432520321923589422876796487670272189318", "47451445736001306439091167216856844588711603153276", "70386486105843025439939619828917593665686757934951", "62176457141856560629502157223196586755079324193331", "64906352462741904929101432445813822663347944758178", "92575867718337217661963751590579239728245598838407", "58203565325359399008402633568948830189458628227828", "80181199384826282014278194139940567587151170094390", "35398664372827112653829987240784473053190104293586", "86515506006295864861532075273371959191420517255829", "71693888707715466499115593487603532921714970056938", "54370070576826684624621495650076471787294438377604", "53282654108756828443191190634694037855217779295145", "36123272525000296071075082563815656710885258350721", "45876576172410976447339110607218265236877223636045", "17423706905851860660448207621209813287860733969412", "81142660418086830619328460811191061556940512689692", "51934325451728388641918047049293215058642563049483", "62467221648435076201727918039944693004732956340691", "15732444386908125794514089057706229429197107928209", "55037687525678773091862540744969844508330393682126", "18336384825330154686196124348767681297534375946515", "80386287592878490201521685554828717201219257766954", "78182833757993103614740356856449095527097864797581", "16726320100436897842553539920931837441497806860984", "48403098129077791799088218795327364475675590848030", "87086987551392711854517078544161852424320693150332", "59959406895756536782107074926966537676326235447210", "69793950679652694742597709739166693763042633987085", "41052684708299085211399427365734116182760315001271", "65378607361501080857009149939512557028198746004375", "35829035317434717326932123578154982629742552737307", "94953759765105305946966067683156574377167401875275", "88902802571733229619176668713819931811048770190271", "25267680276078003013678680992525463401061632866526", "36270218540497705585629946580636237993140746255962", "24074486908231174977792365466257246923322810917141", "91430288197103288597806669760892938638285025333403", "34413065578016127815921815005561868836468420090470", "23053081172816430487623791969842487255036638784583", "11487696932154902810424020138335124462181441773470", "63783299490636259666498587618221225225512486764533", "67720186971698544312419572409913959008952310058822", "95548255300263520781532296796249481641953868218774", "76085327132285723110424803456124867697064507995236", "37774242535411291684276865538926205024910326572967", "23701913275725675285653248258265463092207058596522", "29798860272258331913126375147341994889534765745501", "18495701454879288984856827726077713721403798879715", "38298203783031473527721580348144513491373226651381", "34829543829199918180278916522431027392251122869539", "40957953066405232632538044100059654939159879593635", "29746152185502371307642255121183693803580388584903", "41698116222072977186158236678424689157993532961922", "62467957194401269043877107275048102390895523597457", "23189706772547915061505504953922979530901129967519", "86188088225875314529584099251203829009407770775672", "11306739708304724483816533873502340845647058077308", "82959174767140363198008187129011875491310547126581", "97623331044818386269515456334926366572897563400500", "42846280183517070527831839425882145521227251250327", "55121603546981200581762165212827652751691296897789", "32238195734329339946437501907836945765883352399886", "75506164965184775180738168837861091527357929701337", "62177842752192623401942399639168044983993173312731", "32924185707147349566916674687634660915035914677504", "99518671430235219628894890102423325116913619626622", "73267460800591547471830798392868535206946944540724", "76841822524674417161514036427982273348055556214818", "97142617910342598647204516893989422179826088076852", "87783646182799346313767754307809363333018982642090", "10848802521674670883215120185883543223812876952786", "71329612474782464538636993009049310363619763878039", "62184073572399794223406235393808339651327408011116", "66627891981488087797941876876144230030984490851411", "60661826293682836764744779239180335110989069790714", "85786944089552990653640447425576083659976645795096", "66024396409905389607120198219976047599490197230297", "64913982680032973156037120041377903785566085089252", "16730939319872750275468906903707539413042652315011", "94809377245048795150954100921645863754710598436791", "78639167021187492431995700641917969777599028300699", "15368713711936614952811305876380278410754449733078", "40789923115535562561142322423255033685442488917353", "44889911501440648020369068063960672322193204149535", "41503128880339536053299340368006977710650566631954", "81234880673210146739058568557934581403627822703280", "82616570773948327592232845941706525094512325230608", "22918802058777319719839450180888072429661980811197", "77158542502016545090413245809786882778948721859617", "72107838435069186155435662884062257473692284509516", "20849603980134001723930671666823555245252804609722", "53503534226472524250874054075591789781264330331690" };
        //Console.WriteLine(Sum.LargeSum(FiftyDigitNumbers));
        //Console.WriteLine(Max.CollatzSequence(1000000));
        Console.WriteLine(Max.LaticeTraversal(2));

        int done = Console.Read();
    }
}
