#include<Foundation/Foundation.h>

@interface QuestionFour : NSObject
-(int)findContiguousSubsequenceWithMaximumSum:(NSArray *)array;
@end

@implementation QuestionFour
-(int)findContiguousSubsequenceWithMaximumSum:(NSArray *)array{
    int maxSum = 0;
    int currentSum = 0;
    for (int i = 0; i < array.count; i++) {
        currentSum += [array[i] intValue];
        if (currentSum < 0) {
            currentSum = 0;
        }
        if (currentSum > maxSum) {
            maxSum = currentSum;
        }
    }
    return maxSum;
}
@end

int main() {
    @autoreleasepool {
        QuestionFour *obj = [[QuestionFour alloc] init];
        NSLog(@"%d", [obj findContiguousSubsequenceWithMaximumSum:@[@5, @15, @-30, @10, @-5, @40, @10]]);
    }
    return 0;
}
