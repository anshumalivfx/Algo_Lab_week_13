#include<Foundation/Foundation.h>

@interface QuestionTwo : NSObject
-(int)findMinimumEdits:(NSString *)src dest:(NSString *)dest;
@end

@implementation QuestionTwo
-(int)findMinimumEdits:(NSString *)src dest:(NSString *)dest{
    
    int srcLength = (int)src.length;
    int destLength = (int)dest.length;
    int **dp = (int **)malloc(sizeof(int *) * (srcLength + 1));
    for (int i = 0; i <= srcLength; i++) {
        dp[i] = (int *)malloc(sizeof(int) * (destLength + 1));
        
        for (int j = 0; j <= destLength; j++) {
            dp[i][j] = 0;
        }
    }
    for (int i = 1; i <= srcLength; i++) {
        dp[i][0] = i;
    }
    for (int i = 1; i <= destLength; i++) {
        dp[0][i] = i;
    }
    for (int i = 1; i <= srcLength; i++) {
        for (int j = 1; j <= destLength; j++) {
            if ([src characterAtIndex:i - 1] == [dest characterAtIndex:j - 1]) {
                dp[i][j] = dp[i - 1][j - 1];
            }else{
                dp[i][j] = MIN(dp[i - 1][j], dp[i][j - 1]) + 1;
            }
        }
    }
    return dp[srcLength][destLength];
}
@end

int main() {
    @autoreleasepool {
        QuestionTwo *obj = [[QuestionTwo alloc] init];
        NSLog(@"%d", [obj findMinimumEdits:@"abcd" dest:@"abce"]);
    }
    return 0;
}