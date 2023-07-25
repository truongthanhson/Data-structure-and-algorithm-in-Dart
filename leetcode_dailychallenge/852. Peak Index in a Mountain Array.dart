void main(List<String> args) {
  print(Solution().peakIndexInMountainArray([0, 1, 0]));
  print(Solution().peakIndexInMountainArray([0, 2, 1, 0]));
  print(Solution().peakIndexInMountainArray([0, 10, 5, 2]));
  print(Solution()
      .peakIndexInMountainArray([18, 29, 38, 59, 98, 100, 99, 98, 90]));
}

class Solution {
  int peakIndexInMountainArray(List<int> arr) {
    print('==========');
    var l = 0, r = arr.length - 1;
    while (l < r) {
      int mid = l + (r - l + 1) ~/ 2;
      print(mid);
      if (arr[mid - 1] < arr[mid] && arr[mid] > arr[mid + 1]) {
        return mid;
      } else if (arr[mid - 1] < arr[mid]) {
        l = mid;
      } else {
        r = mid - 1;
      }
    }
    return l;
  }
}
