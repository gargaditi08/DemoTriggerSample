//
//  User.m
//  DemoTriggerAT
//
//  Created by k2annex on 10/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "User.h"

@implementation User


+ (instancetype)sharedInstance
{
    static User *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[User alloc] init];
        sharedInstance.auth_token = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImExNjIyNDhlZTEzNTM5ZDk2NzYxZWUxNmYxNmZkOGE1M2JiY2YzMTEyNGJjYzU5ZmZmYmFmZWRjNDNiOTQ0ZGJmZWY4ZGQ5N2E4MzM1ZDdlIn0.eyJhdWQiOiIxIiwianRpIjoiYTE2MjI0OGVlMTM1MzlkOTY3NjFlZTE2ZjE2ZmQ4YTUzYmJjZjMxMTI0YmNjNTlmZmZiYWZlZGM0M2I5NDRkYmZlZjhkZDk3YTgzMzVkN2UiLCJpYXQiOjE1MjQwNTE0NDYsIm5iZiI6MTUyNDA1MTQ0NiwiZXhwIjoxNTU1NTg3NDQ2LCJzdWIiOiIyNTIzNiIsInNjb3BlcyI6WyIqIl19.qv2Jk8WxpvmnnD2D_V2nIcC1oj4nKxS9O4rcDYyWzvUZsXzCoxJAVpLby0k8Gy6-7OTqAXyQv7RAeyxkueoEtQw9j8iVI16pzzONcS9uC2pPrvT88FS9y2et1lFrsuI2BmS92pPjo459xcxt4NDEqwlmAxtZ3c9Au5iskp3PU4bLYLbMgXiPLWnKw6zUhYkP27rrvD-7m0vPDxt2yqYq8zXqqs_CQeu8zi9Jgm5afbO-nlAdj6CwOUdDkRprlhZepvlkBR3n_XybFlrwKF5RBZwAQQS0r4ix1wicwzj99Npq7d5I8m2z2MqxZhjgO-g27FbnYzBPFBlQ7G1wvK81b8iMafWannJsrTCwqFo0eW3NeUqRREj7Wt3FECacqhPnB0MLO5fkkAEM-c2HqFHr3HIEZKeSjR2w2OYFh1V4hpqav4T_qWSYkWQRsx0q6u8vFQCQ2R1nEKDKzPwyOdsJqrJWNOeBJwxoeXmmwgbacZguI-J0lrgOL3ZvpxCTTk4obLXWwGDQ2YtVrJW9KV_yX0zpEUS_H-aY302TmjAv7dKxsVzGm9ZgWHS4LZUpt915HvdG8aDmCQPP7uJvyl95xuihelMFffOhM6ZyUK39muH32rU_34eLiYGwWDUfxOMlZgEAz_Jk-fT4CcPYtrEnYn9cG8GLcRw4I05KSWpTL3g";
    });
    return sharedInstance;
}



@end
