#include<Foundation/Foundation.h>

@interface QuestionThree : NSObject
-(int)findLongestSubstringWithKDistinctVowels:(NSString *)s k:(int)k;
@end

@implementation QuestionThree
-(int)findLongestSubstringWithKDistinctVowels:(NSString *)s k:(int)k{

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    int maxLength = 0;
    int start = 0;
    int end = 0;
    int count = 0;
    while (end < s.length) {
        NSString *character = [s substringWithRange:NSMakeRange(end, 1)];
        if ([character isEqualToString:@"a"] || [character isEqualToString:@"e"] || [character isEqualToString:@"i"] || [character isEqualToString:@"o"] || [character isEqualToString:@"u"]) {
            count++;
        }
        end++;
        if (count == k) {
            maxLength = MAX(maxLength, end - start);
        }
        if (count > k) {
            NSString *startCharacter = [s substringWithRange:NSMakeRange(start, 1)];
            if ([startCharacter isEqualToString:@"a"] || [startCharacter isEqualToString:@"e"] || [startCharacter isEqualToString:@"i"] || [startCharacter isEqualToString:@"o"] || [startCharacter isEqualToString:@"u"]) {
                count--;
            }
            start++;
        }
    }
    return maxLength;
}

@end

int main() {
    @autoreleasepool {
        QuestionThree *obj = [[QuestionThree alloc] init];
        NSLog(@"%d", [obj findLongestSubstringWithKDistinctVowels:@"artyebui" k:2]);
    }
    return 0;
}
