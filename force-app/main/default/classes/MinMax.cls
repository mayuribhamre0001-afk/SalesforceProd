public class MinMax
{

    // Method to find the maximum and minimum values in a list
    public static void findMinMax(List<Integer> numbers) 
    {
        if (numbers == null || numbers.isEmpty())
        {
            System.debug('The list is empty or null.');
            return;
        }

        Integer min = numbers[0];
        Integer max = numbers[0];

        for (Integer num : numbers) 
        {
            if (num < min) 
            {
                min = num;
            }
            if (num > max) 
            {
                max = num;
            }
        }

        System.debug('Input List: ' + numbers);
        System.debug('Minimum Value: ' + min);
        System.debug('Maximum Value: ' + max);
    }

    // Test method
    public static void testFindMinMax() {
        List<Integer> testList = new List<Integer>{7, 2, 9, 1, 5};
        findMinMax(testList);
    }
}