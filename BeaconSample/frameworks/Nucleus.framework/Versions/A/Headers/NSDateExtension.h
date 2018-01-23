//
//  NSDateExtension.h
//  ACAudioSearch
//
//  Created by Andrey Brusnikin on 18.05.15.
//  Copyright (c) 2015 Cifrasoft. All rights reserved.
//

#ifndef TFAPI_NSDateExtension_h
#define TFAPI_NSDateExtension_h

@interface NSDate (TFApiDate)

- (NSString *)stringDateTFApi;

@end

@implementation NSDate (TFApiDate)

- (NSString*)stringDateTFApi
{
    return [self dateStringWithFormat:@"yyyy-MM-dd'T'H:m:s"];
}

- (NSString *)dateStringWithFormat:(NSString*)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

@end

#endif
