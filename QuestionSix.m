#include<Foundation/Foundation.h>

@interface QuestionSix : NSObject
-(void)MatrixChainOrder:(NSArray *)array;
@end

@implementation QuestionSix
-(void)MatrixChainOrder:(NSArray *)array{
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        [dp addObject:@0];
    }
    for (int i = 1; i < array.count; i++) {
        for (int j = 0; j < i; j++) {
            int min = INT_MAX;
            for (int k = j; k < i; k++) {
                min = MIN(min, [dp[k] intValue] + [array[j] intValue] * [array[k + 1] intValue]);
            }
            dp[i] = [NSNumber numberWithInt:min];
        }
    }
    NSLog(@"%d", [dp[array.count - 1] intValue]);
}
@end




int main() {
    @autoreleasepool {
        QuestionSix *obj = [[QuestionSix alloc] init];
        [obj MatrixChainOrder:@[@40, @20, @30, @10, @30]];

    }
    return 0;
}