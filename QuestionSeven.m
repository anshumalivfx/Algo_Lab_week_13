#include <Foundation/Foundation.h>

@interface QuestionSeven : NSObject
-(NSArray *)findLongestCommonSubsequence:(NSArray *)s1;
@end    

@implementation QuestionSeven
-(NSArray *)findLongestCommonSubsequence:(NSArray *)s1{
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i < s1.count; i++) {
        [dp addObject:@0];
    }
    for (int i = 1; i < s1.count; i++) {
        for (int j = 0; j < i; j++) {
            if ([s1[i] isEqual:s1[j]]) {
                dp[i] = [NSNumber numberWithInt:[dp[i] intValue] + 1];
            }
        }
    }
    int max = 0;
    for (int i = 0; i < dp.count; i++) {
        if ([dp[i] intValue] > max) {
            max = [dp[i] intValue];
        }
    }
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < dp.count; i++) {
        if ([dp[i] intValue] == max) {
            [result addObject:s1[i]];
        }
    }
    return result;
}
@end

int main() {
    @autoreleasepool {
        QuestionSeven *obj = [[QuestionSeven alloc] init];
        NSLog(@"%@", [obj findLongestCommonSubsequence:@[@"B", @"C", @"D", @"A", @"A", @"C", @"D"]]);
    }
    return 0;
}

