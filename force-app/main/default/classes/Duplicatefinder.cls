public class Duplicatefinder 
{
    // Method to find duplicate elements in a list
    public static List<Integer> findDuplicates(List<Integer> inputList) {
        Map<Integer, Integer> frequencyMap = new Map<Integer, Integer>();
        List<Integer> duplicates = new List<Integer>();

        // Count the frequency of each number
        for (Integer num : inputList) {
            if (frequencyMap.containsKey(num)) {
                frequencyMap.put(num, frequencyMap.get(num) + 1);
            } else {
                frequencyMap.put(num, 1);
            }
        }

        // Collect elements that appear more than once
        for (Integer key : frequencyMap.keySet()) {
            if (frequencyMap.get(key) > 1) {
                duplicates.add(key);
            }
        }

        return duplicates;
    }

    // Test method to demonstrate functionality
    public static void testFindDuplicates() {
        List<Integer> testList = new List<Integer>{2, 4, 6, 8, 2, 6, 10};
        List<Integer> duplicateValues = findDuplicates(testList);

        System.debug('Input List: ' + testList);
        System.debug('Duplicates: ' + duplicateValues);
        // Expected output: [2, 6]
    }
}